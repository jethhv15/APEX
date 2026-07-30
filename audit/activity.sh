#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : activity.sh
# Purpose   : ActivityManagerService Collector
#
# SPDX-License-Identifier: MIT
#

activity_dump() {

    local out

    out="$APEX_LOG/activity_$(date +%Y%m%d_%H%M%S).log"

    dumpsys activity > "$out"

    logger_write "AUDIT" "ActivityManager -> $out"

}

activity_wait_game() {

    while true
    do
        pidof com.tencent.ig >/dev/null 2>&1 && break
        sleep 2
    done

    sleep 10
}

activity_run() {

    activity_wait_game

    activity_dump

    return 0
}

# End of File
