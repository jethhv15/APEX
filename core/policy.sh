#!/system/bin/sh
#
# APEX
# Component : Core
# File      : policy.sh
# Purpose   : Runtime Policy Manager
#
# SPDX-License-Identifier: MIT
#

. /data/adb/modules/APEX/core/context.sh

policy_allow() {
    return 0
}

policy_deny() {
    return 1
}

policy_game() {
    [ -n "$APEX_GAME" ]
}

policy_profile() {
    [ -n "$APEX_PROFILE" ]
}

policy_runtime() {
    [ -n "$APEX_DEVICE" ] || return 1
    [ -n "$APEX_ANDROID" ] || return 1
    [ -n "$APEX_KERNEL" ] || return 1
    return 0
}

policy_engine() {
    local engine="$1"

    [ -n "$engine" ] || return 1

    policy_runtime || return 1

    case "$engine" in
        gamemanager)
            policy_game
            ;;
        display|surface|input|power|memory|network)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

policy_check() {
    policy_engine "$1"
}

# End of File
