#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : thermal.sh
# Purpose   : Thermal HAL Collector
#
# SPDX-License-Identifier: MIT
#

thermal_dump() {

    local out

    out="$APEX_LOG/thermal_$(date +%Y%m%d_%H%M%S).log"

    {
        echo "===== dumpsys thermalservice ====="
        dumpsys thermalservice 2>/dev/null

        echo
        echo "===== service list ====="
        service list | grep -i thermal

        echo
        echo "===== getprop thermal ====="
        getprop | grep -i thermal
    } > "$out"

    logger_write "AUDIT" "Thermal HAL -> $out"
}

thermal_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    thermal_dump

    return 0
}

# End of File
