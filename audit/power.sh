#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : power.sh
# Purpose   : Power HAL Collector
#
# SPDX-License-Identifier: MIT
#

power_dump() {

    local out

    out="$APEX_LOG/power_$(date +%Y%m%d_%H%M%S).log"

    {
        echo "===== dumpsys power ====="
        dumpsys power 2>/dev/null

        echo
        echo "===== service list ====="
        service list | grep -i power

        echo
        echo "===== getprop power ====="
        getprop | grep -Ei "power|perf|hint"

    } > "$out"

    logger_write "AUDIT" "Power HAL -> $out"
}

power_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    power_dump

    return 0
}

# End of File
