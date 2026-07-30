#!/system/bin/sh
#
# APEX
# Component : Core
# File      : engine_executor.sh
# Purpose   : Adaptive Engine Executor
#
# SPDX-License-Identifier: MIT
#

engine_executor_run() {

    local engine
    local status=0

    logger_write "ENGINE" "Engine execution started."

    for engine in $(engine_scheduler_list)
    do
        logger_write "ENGINE" "Executing: $engine"

        dispatcher_run "$engine"

        if [ $? -eq 0 ]
        then
            logger_write "ENGINE" "Success: $engine"
        else
            logger_write "ENGINE" "Failed: $engine"
            status=1
        fi
    done

    logger_write "ENGINE" "Engine execution finished."

    return $status
}

# End of File
