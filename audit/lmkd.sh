#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : lmkd.sh
# Purpose   : LMKD Collector
#
# SPDX-License-Identifier: MIT
#

lmkd_dump() {

    local out

    out="$APEX_LOG/lmkd_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "===== LMKD Process ====="
        ps -A | grep lmkd

        echo
        echo "===== LMKD Properties ====="
        getprop | grep -Ei "lmk|lowmemory|memory"

        echo
        echo "===== PSI ====="
        cat /proc/pressure/memory 2>/dev/null

        echo
        echo "===== MemInfo ====="
        cat /proc/meminfo

    } > "$out"

    logger_write "AUDIT" "LMKD -> $out"
}

lmkd_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    lmkd_dump

    return 0
}

# End of File
