#!/system/bin/sh
#
# APEX
# Component : Core
# File      : dispatcher.sh
# Purpose   : Dispatcher manager
#
# SPDX-License-Identifier: MIT
#

dispatcher_run() {
    local task="$1"

    if [ -z "$task" ]; then
        logger_warn "DISPATCHER" "No task specified."
        return 1
    fi

    if ! command -v "$task" >/dev/null 2>&1; then
        logger_error "DISPATCHER" "Task not found: $task"
        return 1
    fi

    logger_write "DISPATCHER" "Run: $task"

    "$task"
}

# End of File
