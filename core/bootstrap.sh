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

    runtime_init

    capability_scan
    audit_android
    audit_game_detect

    dispatcher_run

    verify_run

    logger_write "BOOT" "Bootstrap completed."
}

# End of File
