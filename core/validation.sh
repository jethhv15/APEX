#!/system/bin/sh
#
# APEX
# Component : Core
# File      : validation.sh
# Purpose   : Runtime Validation Suite
#
# SPDX-License-Identifier: MIT
#

validation_run() {

    local failed=0

    logger_write "VALIDATION" "Runtime validation started."

    for dir in audit analyzer decision engine verify report
    do

        if grep -qi "$dir" "$APEX_LOG/apex.log"
        then
            logger_write "VALIDATION" "$dir : PASS"
        else
            logger_write "VALIDATION" "$dir : FAIL"
            failed=1
        fi

    done

    if [ "$failed" -eq 0 ]
    then
        logger_write "VALIDATION" "Runtime validation PASSED."
        return 0
    fi

    logger_write "VALIDATION" "Runtime validation FAILED."

    return 1
}

# End of File
