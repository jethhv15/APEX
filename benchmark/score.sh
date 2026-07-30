#!/system/bin/sh
#
# APEX
# Component : Benchmark
# File      : score.sh
#
# SPDX-License-Identifier: MIT
#

benchmark_score() {

    local score=0

    grep -q "Runtime verification passed." "$APEX_LOG/apex.log" && score=$((score+20))
    grep -q "Runtime validation PASSED." "$APEX_LOG/apex.log" && score=$((score+20))
    grep -q "No runtime regression detected." "$APEX_LOG/apex.log" && score=$((score+20))
    grep -q "Decision completed" "$APEX_LOG/apex.log" && score=$((score+20))
    grep -q "Engine completed" "$APEX_LOG/apex.log" && score=$((score+20))

    logger_write "SCORE" "Runtime Score : ${score}/100"

    return 0
}

# End of File
