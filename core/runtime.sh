#!/system/bin/sh
#
# APEX
# Component : Core
# File      : runtime.sh
# Purpose   : Runtime manager
#
# SPDX-License-Identifier: MIT
#

RUNTIME_STARTED=0

runtime_init() {
    logger_init
    RUNTIME_STARTED=1
    logger_write "RUNTIME" "Runtime initialized."
}

runtime_is_ready() {
    [ "$RUNTIME_STARTED" -eq 1 ]
}

runtime_shutdown() {
    logger_write "RUNTIME" "Runtime shutdown."
    RUNTIME_STARTED=0
}

# End of File
