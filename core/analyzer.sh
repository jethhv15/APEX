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

    for file in "$ANALYZER_DIR"/*.log
    do
        [ -f "$file" ] || continue

        logger_write "ANALYZER" "Analyzing $(basename "$file")"
    done

    logger_write "ANALYZER" "Analysis completed."

    return 0
}

# End of File
