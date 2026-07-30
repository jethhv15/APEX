#!/system/bin/sh
#
# APEX
# Component : Core
# File      : decision.sh
# Purpose   : Decision engine
#
# SPDX-License-Identifier: MIT
#

decision_execute() {
    local action="$1"

    if [ -z "$action" ]; then
        logger_warn "DECISION" "No action specified."
        return 1
    fi

    if ! policy_check "$action"; then
        logger_warn "DECISION" "Policy denied: $action"
        return 1
    fi

    logger_write "DECISION" "Execute: $action"

    "$action"
}

# End of File
