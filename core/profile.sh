#!/system/bin/sh
#
# APEX
# Component : Core
# File      : profile.sh
# Purpose   : Adaptive Profile Evaluator
#
# SPDX-License-Identifier: MIT
#

PROFILE="balanced"

profile_reset() {

    PROFILE="balanced"

}

profile_set() {

    PROFILE="$1"

    logger_write "PROFILE" "Runtime Profile: $PROFILE"

}

profile_get() {

    echo "$PROFILE"

}

profile_evaluate() {

    profile_reset

    if grep -qi "Thermal throttling detected" "$APEX_LOG"/apex.log 2>/dev/null
    then
        profile_set "thermal"
        return 0
    fi

    if grep -qi "Memory PSI detected" "$APEX_LOG"/apex.log 2>/dev/null
    then
        profile_set "memory"
        return 0
    fi

    if grep -qi "Janky frames detected" "$APEX_LOG"/apex.log 2>/dev/null
    then
        profile_set "graphics"
        return 0
    fi

    if grep -qi "Input dispatch enabled" "$APEX_LOG"/apex.log 2>/dev/null
    then
        profile_set "performance"
        return 0
    fi

    profile_set "balanced"

    return 0

}

# End of File
