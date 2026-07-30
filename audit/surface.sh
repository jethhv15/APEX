#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : surface.sh
# Purpose   : Surface audit
#
# SPDX-License-Identifier: MIT
#

audit_surface() {
    registry_set SURFACE_COMPOSER "$(service check SurfaceFlinger)"
    registry_set DISPLAY_REFRESH "$(dumpsys display | awk -F': ' '/RefreshRate/ {print $2; exit}')"
}

# End of File
