#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : game.sh
# Purpose   : Game audit
#
# SPDX-License-Identifier: MIT
#

audit_game() {
    registry_set GAME_PACKAGE "$(context_get_package)"
    registry_set GAME_PID "$(context_get_pid)"
    registry_set GAME_PROFILE "$(context_get_profile)"
}

# End of File
