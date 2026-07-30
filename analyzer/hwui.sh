#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : hwui.sh
# Purpose   : HWUI Analyzer
#
# SPDX-License-Identifier: MIT
#

hwui_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/hwui_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "HWUI: $latest"

    grep -qi "Graphics Stats" "$latest" &&
        logger_write "ANALYZER" "GraphicsStats detected."

    grep -qi "Profile data" "$latest" &&
        logger_write "ANALYZER" "Frame profile detected."

    grep -qi "Janky frames" "$latest" &&
        logger_write "ANALYZER" "Janky frames detected."

    grep -qi "Total frames rendered" "$latest" &&
        logger_write "ANALYZER" "Frame rendering statistics detected."

    return 0
}

# End of File
