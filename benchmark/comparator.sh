#!/system/bin/sh
#
# APEX
# Component : Benchmark
# File      : comparator.sh
#
# SPDX-License-Identifier: MIT
#

benchmark_compare() {

    local before
    local after
    local report

    before="$(ls -t "$APEX_LOG"/benchmark_*.log 2>/dev/null | sed -n '2p')"
    after="$(ls -t "$APEX_LOG"/benchmark_*.log 2>/dev/null | sed -n '1p')"

    [ -f "$before" ] || return 1
    [ -f "$after" ] || return 1

    report="$APEX_LOG/benchmark_compare_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "======================================"
        echo "APEX Benchmark Comparison"
        echo "======================================"
        echo
        echo "Before : $before"
        echo "After  : $after"
        echo

        if cmp -s "$before" "$after"
        then
            echo "Result : IDENTICAL"
        else
            echo "Result : DIFFERENT"
        fi

        echo
        echo "========== DIFF =========="

        diff "$before" "$after" 2>/dev/null

    } > "$report"

    logger_write "BENCHMARK" "Comparison: $report"

    return 0

}

# End of File
