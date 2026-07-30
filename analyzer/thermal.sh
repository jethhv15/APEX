#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : thermal.sh
# Purpose   : Thermal Analyzer
#
# SPDX-License-Identifier: MIT
#

thermal_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/thermal_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "Thermal: $latest"

    grep -qi "thermalservice" "$latest" &&
        logger_write "ANALYZER" "ThermalService detected."

    grep -qi "Temperature" "$latest" &&
        logger_write "ANALYZER" "Temperature information detected."

    grep -qi "Thrott" "$latest" &&
        logger_write "ANALYZER" "Thermal throttling detected."

    grep -qi "Cooling" "$latest" &&
        logger_write "ANALYZER" "Cooling device detected."

    return 0
}

# End of File
