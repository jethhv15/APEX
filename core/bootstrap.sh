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

    health_runtime || {
        logger_write "BOOT" "Health check failed."
        return 1
    }

    audit_android
    audit_game_detect

    decision_run || {
        logger_write "BOOT" "Decision failed."
        return 1
    }

    dispatcher_run || {
        logger_write "BOOT" "Dispatcher failed."
        return 1
    }

    verify_run || {
        logger_write "BOOT" "Verification failed."
        restore_run
        return 1
    }

    logger_write "BOOT" "Bootstrap completed."

    return 0
}

# End of File
