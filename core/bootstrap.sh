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

    #
    # Logger
    #
    logger_init

    #
    # Framework Manifest
    #
    manifest_show

    #
    # Release Information
    #
    release_show

    #
    # Configuration
    #
    bootstrap_load_config

    #
    # Runtime Integrity
    #
    integrity_check || return 1

    #
    # Reset Runtime Context
    #
    context_reset
    registry_reset

    #
    # Runtime Initialization
    #
    runtime_init

    #
    # Capability Detection
    #
    capability_scan

    #
    # Health Check
    #
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
    # Evidence Analysis
    #
    analyzer_run

    #
    # Runtime Decision
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
    # Flush Log Buffer
    #
    logger_write

    return 0

}

# End of File
