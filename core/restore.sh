#!/system/bin/sh
#
# APEX
# Component : Core
# File      : restore.sh
# Purpose   : Restore manager
#
# SPDX-License-Identifier: MIT
#

restore_execute() {
    local target="$1"

    if [ -z "$target" ]; then
        logger_warn "RESTORE" "No restore target."
        return 1
    fi

    if ! file_exists "${target}.bak"; then
        logger_warn "RESTORE" "Backup not found: ${target}.bak"
        return 1
    fi

    file_restore "$target"
    logger_write "RESTORE" "Restored: $target"

    return 0
}

# End of File
