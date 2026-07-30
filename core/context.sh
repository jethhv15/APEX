#!/system/bin/sh
#
# APEX
# Component : Core
# File      : context.sh
# Purpose   : Runtime context manager
#
# SPDX-License-Identifier: MIT
#

CONTEXT_PACKAGE=""
CONTEXT_PID=""
CONTEXT_PROFILE="default"

context_reset() {
    CONTEXT_PACKAGE=""
    CONTEXT_PID=""
    CONTEXT_PROFILE="default"
}

context_set_package() {
    CONTEXT_PACKAGE="$1"

    case "$1" in
        com.tencent.ig)
            CONTEXT_PROFILE="pubg"
            ;;
        com.garena.game.codm)
            CONTEXT_PROFILE="codm"
            ;;
        *)
            CONTEXT_PROFILE="default"
            ;;
    esac
}

context_get_package() {
    printf "%s" "$CONTEXT_PACKAGE"
}

context_set_pid() {
    CONTEXT_PID="$1"
}

context_get_pid() {
    printf "%s" "$CONTEXT_PID"
}

context_get_profile() {
    printf "%s" "$CONTEXT_PROFILE"
}

# End of File
