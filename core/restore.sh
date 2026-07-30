#!/system/bin/sh
#
# APEX
# Component : Core
# File      : restore.sh
# Purpose   : Restore manager
#
# SPDX-License-Identifier: MIT
#

restore_init() {
    return 0
}

restore_engine() {
    local engine="$1"

    [ -z "$engine" ] && return 1

    if [ -f "$MODPATH/engines/${engine}.sh" ]; then
        restore "$engine"
    fi

    return 0
}

restore_all() {

    local engine

    for engine in "${REGISTRY_ENGINES[@]}"
    do
        restore_engine "$engine"
    done

    return 0
}

restore_run() {
    restore_all
}

# End of File
