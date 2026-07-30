#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : power.sh
# Purpose   : Power Analyzer
#
# SPDX-License-Identifier: MIT
#

power_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/power_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "Power: $latest"

    grep -qi "Power Manager State" "$latest" &&
        logger_write "ANALYZER" "PowerManager state detected."

    grep -qi "Wakefulness" "$latest" &&
        logger_write "ANALYZER" "Wakefulness detected."

    grep -qi "PerformanceHint" "$latest" &&
        logger_write "ANALYZER" "Performance Hint detected."

    grep -qi "Low Power Mode" "$latest" &&
        logger_write "ANALYZER" "Low Power Mode detected."

    return 0
}

# End of File
