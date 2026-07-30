#!/system/bin/sh
#
# APEX
# Component : Core
# File      : dispatcher.sh
# Purpose   : Engine dispatcher
#
# SPDX-License-Identifier: MIT
#

dispatcher_run() {
    decision_evaluate
    decision_log

    if ! decision_should_apply; then
        logger_write "DISPATCHER" "Skip: $(decision_reason)"
        return 1
    fi

    logger_write "DISPATCHER" "Applying profile: $(context_get_profile)"

    engine_power_apply
    engine_display_apply
    engine_surface_apply
    engine_input_apply
    engine_network_apply
    engine_memory_apply
    engine_gamemanager_apply

    logger_write "DISPATCHER" "Engine pipeline completed."

    return 0
}

# End of File
