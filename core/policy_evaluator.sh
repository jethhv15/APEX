#!/system/bin/sh
#
# APEX
# Component : Core
# File      : policy_evaluator.sh
# Purpose   : Policy Evaluator
#
# SPDX-License-Identifier: MIT
#

policy_evaluate() {

    local profile

    profile="$(profile_get)"

    logger_write "POLICY" "Evaluating runtime policy."

    case "$profile" in
        performance)
            logger_write "POLICY" "Performance profile accepted."
            return 0
            ;;
        graphics)
            logger_write "POLICY" "Graphics profile accepted."
            return 0
            ;;
        memory)
            logger_write "POLICY" "Memory profile accepted."
            return 0
            ;;
        thermal)
            logger_write "POLICY" "Thermal profile accepted."
            return 0
            ;;
        balanced)
            logger_write "POLICY" "Balanced profile accepted."
            return 0
            ;;
        *)
            logger_write "POLICY" "Unknown profile rejected."
            return 1
            ;;
    esac
}

# End of File
