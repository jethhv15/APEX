#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : input.sh
# Purpose   : InputDispatcher Analyzer
#
# SPDX-License-Identifier: MIT
#

input_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/input_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "InputDispatcher: $latest"

    grep -qi "FocusedApplication" "$latest" &&
        logger_write "ANALYZER" "Focused application detected."

    grep -qi "FocusedWindow" "$latest" &&
        logger_write "ANALYZER" "Focused window detected."

    grep -qi "Input Dispatcher State" "$latest" &&
        logger_write "ANALYZER" "Dispatcher state detected."

    grep -qi "DispatchEnabled" "$latest" &&
        logger_write "ANALYZER" "Input dispatch enabled."

    return 0
}

# End of File
