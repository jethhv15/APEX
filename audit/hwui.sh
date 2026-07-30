#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : hwui.sh
# Purpose   : HWUI / RenderThread Collector
#
# SPDX-License-Identifier: MIT
#

hwui_dump() {

    local out

    out="$APEX_LOG/hwui_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "===== Graphics Stats ====="
        dumpsys graphicsstats 2>/dev/null

        echo
        echo "===== GfxInfo ====="
        dumpsys gfxinfo com.tencent.ig 2>/dev/null

        echo
        echo "===== SurfaceFlinger Latency ====="
        dumpsys SurfaceFlinger --latency 2>/dev/null

    } > "$out"

    logger_write "AUDIT" "HWUI -> $out"
}

hwui_run() {

    pidof com.tencent.ig >/dev/null 2>&1 || return 1

    hwui_dump

    return 0
}

# End of File
