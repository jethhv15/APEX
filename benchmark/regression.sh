#!/system/bin/sh
#
# APEX
# Component : Benchmark
# File      : regression.sh
#
# SPDX-License-Identifier: MIT
#

benchmark_regression() {

    local latest

    latest="$(ls -t "$APEX_LOG"/benchmark_compare_*.log 2>/dev/null | head -n1)"

    [ -f "$latest" ] || return 1

    logger_write "BENCHMARK" "Regression analysis started."

    if grep -q "Result : IDENTICAL" "$latest"
    then
        logger_write "BENCHMARK" "No runtime regression detected."
        return 0
    fi

    logger_write "BENCHMARK" "Runtime changes detected."

    return 0
}

# End of File
