#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : game.sh
# Purpose   : GameManager Analyzer
#
# SPDX-License-Identifier: MIT
#

game_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/game_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "GameManager: $latest"

    grep -qi "GameManagerService" "$latest" &&
        logger_write "ANALYZER" "GameManagerService detected."

    grep -qi "Game Mode" "$latest" &&
        logger_write "ANALYZER" "Game Mode detected."

    grep -qi "com.tencent.ig" "$latest" &&
        logger_write "ANALYZER" "PUBG registered."

    grep -qi "Intervention" "$latest" &&
        logger_write "ANALYZER" "Game intervention detected."

    return 0
}

# End of File
