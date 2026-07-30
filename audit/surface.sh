#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : surface.sh
# Purpose   : SurfaceFlinger Collector
#
# SPDX-License-Identifier: MIT
#

surface_dump() {

    local out

    out="$APEX_LOG/surface_$(date +%Y%m%d_%H%M%S).log"

    dumpsys SurfaceFlinger > "$out"

    logger_write "AUDIT" "SurfaceFlinger -> $out"
}

surface_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    surface_dump

    return 0
}

# End of File
