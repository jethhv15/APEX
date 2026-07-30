#!/system/bin/sh
#
# APEX
# Component : Engine
# File      : gamemanager.sh
# Purpose   : Android GameManager Engine
#
# SPDX-License-Identifier: MIT
#

engine_gamemanager_apply() {
    local pkg

    pkg="$(context_get_package)"

    [ -z "$pkg" ] && return 1

    if [ "$(capability_get gamemanager)" != "1" ]; then
        logger_write "GM" "GameManager not available."
        return 1
    fi

    if cmd game >/dev/null 2>&1; then
        logger_write "GM" "GameManager available for $pkg."
        #
        # Future:
        # cmd game mode performance "$pkg"
        # cmd game downscale disable "$pkg"
        #
        return 0
    fi

    logger_write "GM" "cmd game unavailable."

    return 1
}

# End of File
