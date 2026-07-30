#!/system/bin/sh
#
# APEX
# Component : Core
# File      : report.sh
# Purpose   : Runtime Evidence Report
#
# SPDX-License-Identifier: MIT
#

report_generate() {

    local report

    report="$APEX_LOG/report_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "========================================"
        echo "APEX Runtime Report"
        echo "========================================"

        echo
        echo "Device"
        getprop ro.product.model
        getprop ro.build.version.release
        uname -r

        echo
        echo "Profile"
        profile_get

        echo
        echo "Rules"
        rule_list

        echo
        echo "Selected Engines"
        engine_selector_list

        echo
        echo "Scheduled Engines"
        engine_scheduler_list

    } > "$report"

    logger_write "REPORT" "Generated: $report"

    return 0
}

# End of File
