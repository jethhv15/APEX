#!/system/bin/sh
#
# APEX
# Component : Core
# File      : verify.sh
# Purpose   : Verify engine execution
#
# SPDX-License-Identifier: MIT
#

VERIFY_STATUS="UNKNOWN"

verify_run() {
    VERIFY_STATUS="PASS"

    # Game still running
    if [ -z "$(context_get_package)" ] || [ -z "$(context_get_pid)" ]; then
        VERIFY_STATUS="FAIL"
    elif ! kill -0 "$(context_get_pid)" 2>/dev/null; then
        VERIFY_STATUS="FAIL"
    fi

    logger_write "VERIFY" "status=$VERIFY_STATUS"

    [ "$VERIFY_STATUS" = "PASS" ]
}

verify_status() {
    printf "%s" "$VERIFY_STATUS"
}

# End of File
