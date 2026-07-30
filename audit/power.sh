#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : power.sh
# Purpose   : Power audit
#
# SPDX-License-Identifier: MIT
#

audit_power() {
    registry_set BATTERY_LEVEL "$(dumpsys battery | awk -F': ' '/level/ {print $2}')"
    registry_set BATTERY_STATUS "$(dumpsys battery | awk -F': ' '/status/ {print $2}')"
    registry_set POWER_SAVE "$(settings get global low_power)"
}

# End of File
