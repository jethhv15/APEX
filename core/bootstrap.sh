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

    context_reset
    registry_reset

    runtime_init

    capability_scan

    health_check

    audit_android

    analyzer_run

    decision_run

    dispatcher_run

    verify_run

    logger_write

    return 0
}

# End of File
