#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : game.sh
# Purpose   : Detect running game
#
# SPDX-License-Identifier: MIT
#

GAME_PACKAGES="
com.tencent.ig
com.garena.game.codm
"

audit_game_detect() {
    local pkg pid

    for pkg in $GAME_PACKAGES; do
        pid="$(pidof "$pkg" 2>/dev/null)"

        [ -z "$pid" ] && continue

        context_set_package "$pkg"
        context_set_pid "$pid"

        logger_write "GAME" "Detected $pkg (PID=$pid)"

        return 0
    done

    context_reset

    logger_write "GAME" "No supported game detected."

    return 1
}

# End of File
