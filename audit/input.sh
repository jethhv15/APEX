#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : input.sh
# Purpose   : Input audit
#
# SPDX-License-Identifier: MIT
#

INPUT_SERVICE=0
INPUT_DEVICES=0

audit_input() {
    if service list 2>/dev/null | grep -q "input"; then
        INPUT_SERVICE=1
    fi

    INPUT_DEVICES="$(find /dev/input -type c 2>/dev/null | wc -l)"

    logger_write "INPUT" \
        "service=$INPUT_SERVICE devices=$INPUT_DEVICES"
}

input_get_service() {
    printf "%s" "$INPUT_SERVICE"
}

input_get_devices() {
    printf "%s" "$INPUT_DEVICES"
}

# End of File
