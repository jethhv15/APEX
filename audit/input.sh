#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : input.sh
# Purpose   : Input audit
#
# SPDX-License-Identifier: MIT
#

audit_input() {
    registry_set INPUT_METHOD "$(settings get secure default_input_method)"
    registry_set TOUCH_DEVICE "$(getevent -pl 2>/dev/null | awk '/touch/ {print $2; exit}')"
}

# End of File
