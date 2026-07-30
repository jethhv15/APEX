#!/system/bin/sh
#
# APEX
# Component : Core
# File      : engine_core.sh
# Purpose   : Adaptive Engine Core
#
# SPDX-License-Identifier: MIT
#

engine_core_init() {

    logger_write "ENGINE" "Adaptive Engine initialized."

    return 0
}

engine_core_prepare() {

    logger_write "ENGINE" "Preparing runtime."

    engine_selector_run

    engine_scheduler_run

    return 0
}

engine_core_execute() {

    engine_executor_run

    return $?
}

engine_core_verify() {

    verify_run

    return $?
}

engine_core_run() {

    engine_core_init

    engine_core_prepare

    engine_core_execute || return 1

    engine_core_verify || return 1

    logger_write "ENGINE" "Adaptive Engine finished."

    return 0
}

# End of File
