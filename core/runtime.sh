#!/system/bin/sh
#
# APEX
# Component : Core
# File      : runtime.sh
# Purpose   : Runtime manager
#
# SPDX-License-Identifier: MIT
#

RUNTIME_STATE="STOPPED"

runtime_init() {
    if runtime_is_ready; then
        return 0
    fi

    logger_init

    RUNTIME_STATE="RUNNING"

    logger_write "RUNTIME" "Runtime initialized."
}

runtime_is_ready() {
    [ "$RUNTIME_STATE" = "RUNNING" ]
}

runtime_shutdown() {
    if ! runtime_is_ready; then
        return 0
    fi

    logger_write "RUNTIME" "Runtime shutdown."

    RUNTIME_STATE="STOPPED"
}

# End of File
