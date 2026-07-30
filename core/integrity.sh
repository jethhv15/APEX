#!/system/bin/sh
#
# APEX
# Component : Core
# File      : integrity.sh
# Purpose   : Runtime Integrity Validation
#
# SPDX-License-Identifier: MIT
#

integrity_check() {

    local failed=0
    local file

    for file in \
        "$MODULE/core/bootstrap.sh" \
        "$MODULE/core/runtime.sh" \
        "$MODULE/core/context.sh" \
        "$MODULE/core/capability.sh" \
        "$MODULE/core/analyzer.sh" \
        "$MODULE/core/decision_engine.sh" \
        "$MODULE/core/engine_core.sh" \
        "$MODULE/core/runtime_verify.sh"
    do

        if [ ! -f "$file" ]
        then
            logger_write "INTEGRITY" "Missing: $file"
            failed=1
        fi

    done

    if [ "$failed" -eq 0 ]
    then
        logger_write "INTEGRITY" "Runtime integrity passed."
        return 0
    fi

    logger_write "INTEGRITY" "Runtime integrity failed."

    return 1
}

# End of File
