#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : input.sh
# Purpose   : InputDispatcher Collector
#
# SPDX-License-Identifier: MIT
#

input_dump() {

    local out

    out="$APEX_LOG/input_$(date +%Y%m%d_%H%M%S).log"

    dumpsys input > "$out"

    logger_write "AUDIT" "InputDispatcher -> $out"
}

input_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    input_dump

    return 0
}

# End of File
