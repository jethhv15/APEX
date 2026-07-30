#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : surface.sh
# Purpose   : SurfaceFlinger audit
#
# SPDX-License-Identifier: MIT
#

SURFACE_PRESENT=0
SURFACE_VSYNC=0

audit_surface() {
    if service list 2>/dev/null | grep -q "SurfaceFlinger"; then
        SURFACE_PRESENT=1
    fi

    if dumpsys SurfaceFlinger 2>/dev/null | grep -qi "vsync"; then
        SURFACE_VSYNC=1
    fi

    logger_write "SURFACE" \
        "present=$SURFACE_PRESENT vsync=$SURFACE_VSYNC"
}

surface_get_present() {
    printf "%s" "$SURFACE_PRESENT"
}

surface_get_vsync() {
    printf "%s" "$SURFACE_VSYNC"
}

# End of File
