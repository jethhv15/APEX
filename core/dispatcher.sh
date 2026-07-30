#!/system/bin/sh

DECISION="/data/adb/modules/APEX/logs/decision.prop"

[ -f "$DECISION" ] || exit 1

. "$DECISION"

run_engine() {
    NAME="$1"
    SCRIPT="$2"

    echo "[Dispatcher] $NAME"

    if [ -x "$SCRIPT" ]; then
        sh "$SCRIPT"
    else
        echo "[Dispatcher] Missing $SCRIPT"
    fi
}

####################################################
# Display
####################################################

[ "$ENABLE_DISPLAY" = "1" ] && \
run_engine "Display Engine" \
"/data/adb/modules/APEX/engines/display.sh"

####################################################
# Input
####################################################

[ "$ENABLE_INPUT" = "1" ] && \
run_engine "Input Engine" \
"/data/adb/modules/APEX/engines/input.sh"

####################################################
# Thermal
####################################################

[ "$ENABLE_THERMAL" = "1" ] && \
run_engine "Thermal Engine" \
"/data/adb/modules/APEX/engines/thermal.sh"

echo "[Dispatcher] Done"
