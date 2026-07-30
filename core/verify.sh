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
    local expected="$1"
    local actual="$2"

    [ "$expected" = "$actual" ]
}

verify_success() {
    logger_write "VERIFY" "$1"
}

verify_failure() {
    logger_error "VERIFY" "$1"
}

# End of File
