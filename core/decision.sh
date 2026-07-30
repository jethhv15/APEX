#!/system/bin/sh
#
# APEX
# Component : Core
# File      : decision.sh
# Purpose   : Decision Engine
#
# SPDX-License-Identifier: MIT
#

DECISION_STATUS="IDLE"
DECISION_REASON=""

decision_reset() {
    DECISION_STATUS="IDLE"
    DECISION_REASON=""
}

decision_evaluate() {
    decision_reset

    # No supported game
    if [ -z "$(context_get_package)" ]; then
        DECISION_STATUS="SKIP"
        DECISION_REASON="No supported game running"
        return 1
    fi

    # Missing GameManager
    if [ "$(capability_get gamemanager)" != "1" ]; then
        DECISION_STATUS="SKIP"
        DECISION_REASON="GameManager unavailable"
        return 1
    fi

    # Missing SurfaceFlinger
    if [ "$(capability_get surfaceflinger)" != "1" ]; then
        DECISION_STATUS="SKIP"
        DECISION_REASON="SurfaceFlinger unavailable"
        return 1
    fi

    DECISION_STATUS="APPLY"
    DECISION_REASON="System ready"

    return 0
}

decision_should_apply() {
    [ "$DECISION_STATUS" = "APPLY" ]
}

decision_reason() {
    printf "%s" "$DECISION_REASON"
}

decision_status() {
    printf "%s" "$DECISION_STATUS"
}

decision_log() {
    logger_write "DECISION" \
        "status=$DECISION_STATUS reason=$DECISION_REASON"
}

# End of File
