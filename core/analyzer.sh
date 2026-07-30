#!/system/bin/sh

LOG_DIR="/data/adb/modules/APEX/logs"

LOG="$(ls -t "$LOG_DIR"/framework-*.log 2>/dev/null | head -n1)"

if [ ! -f "$LOG" ]; then
    echo "No framework log found."
    exit 1
fi

PASS=0
WARN=0
FAIL=0

pass() {
    printf "[PASS] %s\n" "$1"
    PASS=$((PASS+1))
}

warn() {
    printf "[WARN] %s\n" "$1"
    WARN=$((WARN+1))
}

fail() {
    printf "[FAIL] %s\n" "$1"
    FAIL=$((FAIL+1))
}

echo
echo "========== APEX Analyzer =========="
echo
echo "Log : $LOG"
echo

####################################
# ActivityManager
####################################

if grep -q "com.tencent.ig" "$LOG"; then
    pass "Game process detected"
else
    fail "Game process missing"
fi

####################################
# SurfaceFlinger
####################################

if grep -q "SurfaceFlinger" "$LOG"; then
    pass "SurfaceFlinger dump collected"
else
    warn "SurfaceFlinger unavailable"
fi

####################################
# Input
####################################

if grep -q "Input Dispatcher" "$LOG"; then
    pass "InputDispatcher collected"
else
    warn "InputDispatcher missing"
fi

####################################
# Thermal
####################################

if grep -q "Thermal" "$LOG"; then
    pass "Thermal service collected"
else
    warn "Thermal service unavailable"
fi

####################################
# Power
####################################

if grep -q "Wakefulness" "$LOG"; then
    pass "Power service collected"
else
    warn "Power service unavailable"
fi

####################################
# Scheduler
####################################

if grep -q "Cpus_allowed" "$LOG"; then
    pass "Kernel scheduler collected"
else
    warn "Scheduler info unavailable"
fi

echo
echo "========== SUMMARY =========="
echo

echo "PASS : $PASS"
echo "WARN : $WARN"
echo "FAIL : $FAIL"

echo

if [ "$FAIL" -gt 0 ]; then
    echo "Verdict : AUDIT INCOMPLETE"
elif [ "$WARN" -gt 0 ]; then
    echo "Verdict : REVIEW REQUIRED"
else
    echo "Verdict : READY FOR DECISION ENGINE"
fi
