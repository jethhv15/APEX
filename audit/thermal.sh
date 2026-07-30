#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : thermal.sh
# Purpose   : Thermal audit
#
# SPDX-License-Identifier: MIT
#

audit_thermal() {
    registry_set THERMAL_STATUS "$(cmd thermalservice get-current-thermal-status 2>/dev/null)"
    registry_set THERMAL_TEMP "$(dumpsys thermalservice 2>/dev/null)"
}

# End of File
