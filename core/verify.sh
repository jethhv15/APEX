#!/system/bin/sh
#
# APEX
# Component : Core
# File      : verify.sh
# Purpose   : Verification manager
#
# SPDX-License-Identifier: MIT
#

verify_result() {
    [ "$1" = "$2" ]
}

verify_execute() {
    local expected="$1"
    local actual="$2"
    local tag="$3"

    if verify_result "$expected" "$actual"; then
        logger_write "VERIFY" "$tag: PASS"
        return 0
    fi

    logger_error "VERIFY" "$tag: FAIL"
    return 1
}

# End of File
