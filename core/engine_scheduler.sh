#!/system/bin/sh
#
# APEX
# Component : Core
# File      : engine_scheduler.sh
# Purpose   : Adaptive Engine Scheduler
#
# SPDX-License-Identifier: MIT
#

ENGINE_SCHEDULE=""

engine_scheduler_reset() {

    ENGINE_SCHEDULE=""

}

engine_scheduler_add() {

    ENGINE_SCHEDULE="$ENGINE_SCHEDULE $1"

    logger_write "ENGINE" "Scheduled: $1"

}

engine_scheduler_run() {

    local engine

    engine_scheduler_reset

    for engine in $(engine_selector_list)
    do
        engine_scheduler_add "$engine"
    done

    return 0
}

engine_scheduler_list() {

    echo "$ENGINE_SCHEDULE"

}

# End of File
