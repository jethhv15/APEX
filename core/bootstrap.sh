#!/system/bin/sh
#
# APEX
# Component : Core
# File      : bootstrap.sh
# Purpose   : Bootstrap manager
#
# SPDX-License-Identifier: MIT
#

bootstrap_init() {
    logger_init
    runtime_init
    context_reset
    capability_scan
    registry_reset

    logger_write "BOOT" "Bootstrap completed."
}

# End of File
