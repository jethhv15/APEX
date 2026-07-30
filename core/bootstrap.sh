#!/system/bin/sh
#
# APEX
# Component : Core
# File      : bootstrap.sh
#
# SPDX-License-Identifier: MIT
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

    #
    # Benchmark (Before APEX)
    #
    benchmark_collect

    #
    # Evidence Collection
    #
    audit_android

    #
    # Analysis
    #
    analyzer_run

    #
    # Decision
    #
    decision_run || return 1

    #
    # Engine Execution
    #
    engine_core_run || return 1

    #
    # Benchmark (After APEX)
    #
    benchmark_collect

    #
    # Flush Log
    #
    logger_write

    return 0
}

# End of File
