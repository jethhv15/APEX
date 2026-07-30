#!/system/bin/sh
#
# APEX
# Component : Core
# File      : analyzer.sh
# Purpose   : Evidence Analyzer Core
#
# SPDX-License-Identifier: MIT
#

ANALYZER_DIR="$APEX_LOG"

analyzer_init() {

    logger_write "ANALYZER" "Analyzer initialized."

    return 0
}

analyzer_run() {

    analyzer_init

    activity_analyze
    surface_analyze
    input_analyze
    game_analyze
    thermal_analyze
    power_analyze
    binder_analyze
    lmkd_analyze

    logger_write "ANALYZER" "Analysis completed."

    return 0
}

# End of File
