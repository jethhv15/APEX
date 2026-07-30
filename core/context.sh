#!/system/bin/sh
#
# APEX
# Component : Core
# File      : context.sh
# Purpose   : Runtime context manager
#
# SPDX-License-Identifier: MIT
#

CONTEXT_PACKAGE=""
CONTEXT_PID=""
CONTEXT_PROFILE=""

context_reset() {
    CONTEXT_PACKAGE=""
    CONTEXT_PID=""
    CONTEXT_PROFILE=""
}

context_set_package() {
    CONTEXT_PACKAGE="$1"
}

context_get_package() {
    printf "%s" "$CONTEXT_PACKAGE"
}

context_set_pid() {
    CONTEXT_PID="$1"
}

context_get_pid() {
    printf "%s" "$CONTEXT_PID"
}

context_set_profile() {
    CONTEXT_PROFILE="$1"
}

context_get_profile() {
    printf "%s" "$CONTEXT_PROFILE"
}

# End of File
