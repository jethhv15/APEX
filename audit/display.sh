#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : display.sh
# Purpose   : Display audit
#
# SPDX-License-Identifier: MIT
#

audit_display() {
    registry_set DISPLAY_DENSITY "$(wm density 2>/dev/null | awk '/Physical density/ {print $3}')"
    registry_set DISPLAY_SIZE "$(wm size 2>/dev/null | awk '/Physical size/ {print $3}')"
}

# End of File
