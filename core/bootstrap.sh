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

    logger_write "BOOT" "Bootstrap started."

    context_reset
    registry_reset
    capability_scan

    runtime_init

    logger_write "BOOT" "Bootstrap completed."
}

# End of File
