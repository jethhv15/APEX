#!/system/bin/sh
#
# APEX
# Component : Analyzer
# File      : binder.sh
# Purpose   : Binder Analyzer
#
# SPDX-License-Identifier: MIT
#

binder_analyze() {

    local latest

    latest=$(ls -t "$APEX_LOG"/binder_*.log 2>/dev/null | head -n1)

    [ -f "$latest" ] || return 1

    logger_write "ANALYZER" "Binder: $latest"

    grep -qi "android.os.IServiceManager" "$latest" &&
        logger_write "ANALYZER" "ServiceManager detected."

    grep -qi "binderfs" "$latest" &&
        logger_write "ANALYZER" "BinderFS detected."

    grep -qi "/dev/binder" "$latest" &&
        logger_write "ANALYZER" "Binder device detected."

    grep -qi "SurfaceFlinger" "$latest" &&
        logger_write "ANALYZER" "SurfaceFlinger binder service detected."

    return 0
}

# End of File
