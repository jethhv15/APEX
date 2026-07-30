#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : activity.sh
# Purpose   : ActivityManager Analyzer
#
# SPDX-License-Identifier: MIT
#

activity_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/activity_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "ActivityManager: $latest"

    grep -q "ResumedActivity" "$latest" &&
        logger_write "ANALYZER" "Foreground activity detected."

    grep -q "ProcessRecord" "$latest" &&
        logger_write "ANALYZER" "Process records detected."

    grep -q "oom" "$latest" &&
        logger_write "ANALYZER" "OOM information detected."

    return 0
}

# End of File
