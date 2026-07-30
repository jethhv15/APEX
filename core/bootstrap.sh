#!/system/bin/sh
#
# APEX
# Component : Core
# File      : bootstrap.sh
#

bootstrap_load_config() {
    [ -f "$MODULE/config/apex.conf" ] && . "$MODULE/config/apex.conf"
}

bootstrap_init() {

    logger_init

    bootstrap_load_config

    integrity_check || return 1

    context_reset
    registry_reset

    runtime_init

    capability_scan

    health_check

    audit_android

    analyzer_run

    decision_run || return 1

    engine_core_run || return 1

    logger_write

    return 0
}

# End of File
