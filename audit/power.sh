#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : power.sh
# Purpose   : Power subsystem audit
#
# SPDX-License-Identifier: MIT
#

POWER_HAL=0
CPU_GOVERNOR=""
CPU_POLICY=""

audit_power() {
    service list 2>/dev/null | grep -qi "power" && POWER_HAL=1

    CPU_GOVERNOR="$(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor 2>/dev/null)"

    CPU_POLICY="$(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors 2>/dev/null)"

    logger_write "POWER" \
        "hal=$POWER_HAL governor=${CPU_GOVERNOR:-unknown}"

    logger_write "POWER" \
        "available_governors=${CPU_POLICY:-unknown}"
}

power_has_hal() {
    [ "$POWER_HAL" -eq 1 ]
}

power_get_governor() {
    printf "%s" "$CPU_GOVERNOR"
}

power_get_available_governors() {
    printf "%s" "$CPU_POLICY"
}

# End of File
