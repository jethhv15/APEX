#!/system/bin/sh
#
# APEX
# Component : Core
# File      : bootstrap.sh
# Purpose   : Bootstrap manager
#
# SPDX-License-Identifier: MIT
#

bootstrap_load_config() {
    local base

    base="${MODPATH:-${0%/*}/..}"

    [ -f "$base/config/apex.conf" ] && . "$base/config/apex.conf"
    [ -f "$base/config/policy.conf" ] && . "$base/config/policy.conf"
}

bootstrap_init() {
    logger_init

    logger_write "BOOT" "Bootstrap started."

    bootstrap_load_config

    context_reset
    registry_reset
    capability_scan

    runtime_init

    logger_write "BOOT" "Bootstrap completed."
}

# End of File
