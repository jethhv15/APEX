#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : lmkd.sh
# Purpose   : LMKD Analyzer
#
# SPDX-License-Identifier: MIT
#

lmkd_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/lmkd_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "LMKD: $latest"

    grep -qi "lmkd" "$latest" &&
        logger_write "ANALYZER" "LMKD daemon detected."

    grep -qi "some avg10" "$latest" &&
        logger_write "ANALYZER" "Memory PSI detected."

    grep -qi "full avg10" "$latest" &&
        logger_write "ANALYZER" "Full memory pressure detected."

    grep -qi "MemAvailable" "$latest" &&
        logger_write "ANALYZER" "Memory availability detected."

    return 0
}

# End of File
