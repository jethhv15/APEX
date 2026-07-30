#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : display.sh
# Purpose   : Display audit
#
# SPDX-License-Identifier: MIT
#

DISPLAY_WIDTH="$(wm size 2>/dev/null | awk -F': ' '/Physical size/{print $2}')"
DISPLAY_DENSITY="$(wm density 2>/dev/null | awk -F': ' '/Physical density/{print $2}')"
DISPLAY_REFRESH="$(dumpsys display 2>/dev/null | grep -m1 -oE '[0-9]+(\.[0-9]+)?Hz' | tr -d 'Hz')"

audit_display() {
    logger_write "DISPLAY" \
        "resolution=$DISPLAY_WIDTH density=$DISPLAY_DENSITY refresh=${DISPLAY_REFRESH:-unknown}"
}

display_get_refresh() {
    printf "%s" "$DISPLAY_REFRESH"
}

display_get_resolution() {
    printf "%s" "$DISPLAY_WIDTH"
}

display_get_density() {
    printf "%s" "$DISPLAY_DENSITY"
}

# End of File
