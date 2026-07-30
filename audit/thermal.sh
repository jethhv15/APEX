#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : thermal.sh
# Purpose   : Thermal subsystem audit
#
# SPDX-License-Identifier: MIT
#

THERMAL_HAL=0
THERMAL_ZONES=0

audit_thermal() {
    service list 2>/dev/null | grep -qi "thermal" && THERMAL_HAL=1

    THERMAL_ZONES="$(find /sys/class/thermal -maxdepth 1 -name "thermal_zone*" 2>/dev/null | wc -l)"

    logger_write "THERMAL" \
        "hal=$THERMAL_HAL zones=$THERMAL_ZONES"
}

thermal_has_hal() {
    [ "$THERMAL_HAL" -eq 1 ]
}

thermal_get_zones() {
    printf "%s" "$THERMAL_ZONES"
}

# End of File
