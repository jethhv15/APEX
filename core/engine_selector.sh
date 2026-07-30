#!/system/bin/sh
#
# APEX
# Component : Core
# File      : engine_selector.sh
# Purpose   : Adaptive Engine Selector
#
# SPDX-License-Identifier: MIT
#

ENGINE_SELECTION=""

engine_selector_reset() {

    ENGINE_SELECTION=""

}

engine_selector_add() {

    ENGINE_SELECTION="$ENGINE_SELECTION $1"

    logger_write "ENGINE" "Selected: $1"

}

engine_selector_run() {

    local profile

    profile="$(profile_get)"

    engine_selector_reset

    case "$profile" in

        performance)
            engine_selector_add input
            engine_selector_add surface
            engine_selector_add power
            engine_selector_add gamemanager
            ;;

        graphics)
            engine_selector_add surface
            engine_selector_add display
            ;;

        memory)
            engine_selector_add memory
            ;;

        thermal)
            engine_selector_add power
            ;;

        balanced|*)
            engine_selector_add display
            engine_selector_add input
            engine_selector_add memory
            ;;

    esac

    return 0
}

engine_selector_list() {

    echo "$ENGINE_SELECTION"

}

# End of File
