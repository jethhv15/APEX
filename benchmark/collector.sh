#!/system/bin/sh
#
# APEX
# Component : Benchmark
# File      : collector.sh
# Purpose   : Runtime Benchmark Collector
#
# SPDX-License-Identifier: MIT
#

benchmark_collect() {

    local out

    out="$APEX_LOG/benchmark_$(date +%Y%m%d_%H%M%S).log"

    {

        echo "===== Timestamp ====="
        date

        echo
        echo "===== CPU ====="
        cat /proc/stat

        echo
        echo "===== Memory ====="
        cat /proc/meminfo

        echo
        echo "===== Load ====="
        cat /proc/loadavg

        echo
        echo "===== Thermal ====="
        dumpsys thermalservice 2>/dev/null

        echo
        echo "===== Power ====="
        dumpsys power 2>/dev/null

        echo
        echo "===== SurfaceFlinger ====="
        dumpsys SurfaceFlinger --latency 2>/dev/null

    } > "$out"

    logger_write "BENCHMARK" "Collected: $out"

    return 0
}

# End of File
