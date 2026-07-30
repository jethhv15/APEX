#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : game.sh
# Purpose   : GameManagerService Collector
#
# SPDX-License-Identifier: MIT
#

game_dump() {

    local out

    out="$APEX_LOG/game_$(date +%Y%m%d_%H%M%S).log"

    dumpsys game > "$out"

    logger_write "AUDIT" "GameManagerService -> $out"

}

game_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    game_dump

    return 0

}

# End of File
