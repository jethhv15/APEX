#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : binder.sh
# Purpose   : Binder Collector
#
# SPDX-License-Identifier: MIT
#

binder_dump() {

    local out

    out="$APEX_LOG/binder_$(date +%Y%m%d_%H%M%S).log"

    {
        echo "===== service list ====="
        service list

        echo
        echo "===== binderfs ====="
        ls -l /dev/binderfs 2>/dev/null

        echo
        echo "===== binder devices ====="
        ls -l /dev/*binder* 2>/dev/null

        echo
        echo "===== binder properties ====="
        getprop | grep -i binder

    } > "$out"

    logger_write "AUDIT" "Binder -> $out"
}

binder_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    binder_dump

    return 0
}

# End of File
