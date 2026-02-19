#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
short_cwd=$(echo "$cwd" | sed "s|^$HOME|~|")

git_branch=""
pr_info=""

if [ -d "$cwd/.git" ] || git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(cd "$cwd" && git -c core.useBuiltinFSMonitor=false symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  [ -n "$git_branch" ] && git_branch=" ($git_branch)"

  cache=/tmp/claude-pr-cache
  jq_filter="$HOME/.claude/pr-status.jq"
  branch_key=$(cd "$cwd" && git rev-parse --abbrev-ref HEAD 2>/dev/null)

  # Background refresh: single gh call, jq filter from file, write cache
  refresh_cache() {
    local dir="$1" branch="$2" cachefile="$3" filter="$4"
    local parsed url checks review label

    parsed=$(cd "$dir" && gh pr view --json url,statusCheckRollup,reviews 2>/dev/null | jq -r -f "$filter" 2>/dev/null) || return
    url=$(echo "$parsed" | jq -r '.url // empty')
    [ -z "$url" ] && return

    checks=$(echo "$parsed" | jq -r '.checks')
    review=$(echo "$parsed" | jq -r '.review')

    case "$checks" in
      pending|failed) label="in progress" ;;
      pass)
        case "$review" in
          approved)          label="ready to merge" ;;
          changes_requested) label="in progress" ;;
          *)                 label="needs review" ;;
        esac ;;
      *) label="" ;;
    esac

    printf '%s\n%s\n%s' "$branch" "$url" "$label" > "$cachefile"
  }

  pr_url=""
  pr_status=""

  if [ -f "$cache" ] && [ "$(sed -n '1p' "$cache")" = "$branch_key" ]; then
    pr_url=$(sed -n '2p' "$cache")
    pr_status=$(sed -n '3p' "$cache")
    age=$(($(date +%s) - $(stat -f %m "$cache" 2>/dev/null || echo 0)))
    if [ "$age" -ge 10 ]; then
      refresh_cache "$cwd" "$branch_key" "$cache" "$jq_filter" &
    fi
  else
    refresh_cache "$cwd" "$branch_key" "$cache" "$jq_filter" &
  fi

  if [ -n "$pr_url" ]; then
    # Color the status label
    case "$pr_status" in
      "in progress")    status_colored="\033[2;33m($pr_status)\033[0m" ;;        # dim yellow
      "needs review")   status_colored="\033[2;36m($pr_status)\033[0m" ;;        # dim cyan
      "ready to merge") status_colored="\033[2;32m($pr_status)\033[0m" ;;        # dim green
      *)                status_colored="" ;;
    esac
    pr_info=" $pr_url"
    [ -n "$status_colored" ] && pr_info="$pr_info $status_colored"

    # Show spinner if PR watcher is active
    if [ -f /tmp/claude-pr-watcher-active ]; then
      frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
      idx=$(( $(date +%S) % 10 ))
      pr_info="$pr_info \033[2;35m${frames[$idx]} watching\033[0m"
    fi
  fi
fi

cost=$(printf '%.2f' $(echo "$input" | jq -r '.cost.total_cost_usd // 0'))
context_info=""
[ -n "$remaining" ] && context_info=" [${remaining}%, \$${cost}]"

printf "\033[38;2;232;127;95m❋\033[0m \033[38;5;244m%s\033[0m\033[0;33m%s\033[0m\033[2;36m%s\033[0m\033[2;34m%b\033[0m" "$short_cwd" "$git_branch" "$context_info" "$pr_info"
