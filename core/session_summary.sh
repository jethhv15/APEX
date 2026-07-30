#!/system/bin/sh
#
# APEX
# Component : Core
# File      : session_summary.sh
#
# SPDX-License-Identifier: MIT
#

session_summary_generate() {

    local out

    out="$APEX_LOG/session_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "========== APEX Runtime Session =========="
        echo
        date
        echo

        echo "Device      : ${DEVICE_MODEL:-Unknown}"
        echo "Android     : ${ANDROID_VERSION:-Unknown}"
        echo "Kernel      : ${KERNEL_VERSION:-Unknown}"
        echo "Profile     : ${RUNTIME_PROFILE:-Unknown}"
        echo

        echo "========== Latest Score =========="
        grep "Runtime Score" "$APEX_LOG/apex.log" | tail -n1

        echo
        echo "========== Latest Validation =========="
        grep "Runtime validation" "$APEX_LOG/apex.log" | tail -n2

        echo
        echo "========== Latest Regression =========="
        grep "Regression" "$APEX_LOG/apex.log" | tail -n2

    } > "$out"

    logger_write "SUMMARY" "Session summary generated: $out"

    return 0
}

# End of File
