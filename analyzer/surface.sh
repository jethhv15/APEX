#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : surface.sh
# Purpose   : SurfaceFlinger Analyzer
#
# SPDX-License-Identifier: MIT
#

surface_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/surface_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "SurfaceFlinger: $latest"

    grep -qi "Display" "$latest" &&
        logger_write "ANALYZER" "Display state detected."

    grep -qi "Layer" "$latest" &&
        logger_write "ANALYZER" "Layer information detected."

    grep -qi "Composition" "$latest" &&
        logger_write "ANALYZER" "Composition pipeline detected."

    grep -qi "VSync" "$latest" &&
        logger_write "ANALYZER" "VSync information detected."

    return 0
}

# End of File
