#!/system/bin/sh
#
# APEX
# Component : Core
# File      : capability.sh
# Purpose   : Android capability audit
#
# SPDX-License-Identifier: MIT
#

CAP_HAS_UCLAMP=0
CAP_HAS_EAS=0
CAP_HAS_PSI=0
CAP_HAS_GAMEMANAGER=0
CAP_HAS_SURFACEFLINGER=0

capability_scan() {
    [ -d /dev/stune ] || [ -d /dev/cpuctl ] && CAP_HAS_UCLAMP=1

    [ -f /sys/devices/system/cpu/eas/enable ] && CAP_HAS_EAS=1

    [ -f /proc/pressure/cpu ] && CAP_HAS_PSI=1

    service list 2>/dev/null | grep -qi "game" && CAP_HAS_GAMEMANAGER=1

    service list 2>/dev/null | grep -qi "SurfaceFlinger" && CAP_HAS_SURFACEFLINGER=1

    logger_write "CAPABILITY" \
        "uclamp=$CAP_HAS_UCLAMP eas=$CAP_HAS_EAS psi=$CAP_HAS_PSI gm=$CAP_HAS_GAMEMANAGER sf=$CAP_HAS_SURFACEFLINGER"
}

capability_get() {
    case "$1" in
        uclamp) printf "%s" "$CAP_HAS_UCLAMP" ;;
        eas) printf "%s" "$CAP_HAS_EAS" ;;
        psi) printf "%s" "$CAP_HAS_PSI" ;;
        gamemanager) printf "%s" "$CAP_HAS_GAMEMANAGER" ;;
        surfaceflinger) printf "%s" "$CAP_HAS_SURFACEFLINGER" ;;
        *) return 1 ;;
    esac
}

# End of File
