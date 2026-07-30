#!/system/bin/sh

REPORT="/data/adb/modules/APEX/logs/report.prop"

. "$REPORT"

ENABLE_DISPLAY=0
ENABLE_INPUT=0
ENABLE_THERMAL=0

[ "$SF" = "WARN" ] && ENABLE_DISPLAY=1
[ "$INPUT" = "WARN" ] && ENABLE_INPUT=1
[ "$THERMAL" = "WARN" ] && ENABLE_THERMAL=1

export ENABLE_DISPLAY
export ENABLE_INPUT
export ENABLE_THERMAL
