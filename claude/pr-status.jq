{
  url: (.url // ""),
  checks: (
    if (.statusCheckRollup | length) == 0 then "pending"
    elif [.statusCheckRollup[] | select(.status != null and .status != "COMPLETED")] | length > 0 then "pending"
    elif [.statusCheckRollup[] | select(.conclusion != null and (.conclusion == "FAILURE" or .conclusion == "ERROR"))] | length > 0 then "failed"
    else "pass"
    end
  ),
  review: (
    [.reviews[] | select(.author.login != "copilot-pull-request-reviewer" and .author.login != "Copilot")] |
    if length == 0 then "none"
    elif [.[] | select(.state == "APPROVED")] | length > 0 then "approved"
    elif [.[] | select(.state == "CHANGES_REQUESTED")] | length > 0 then "changes_requested"
    else "commented"
    end
  )
}
