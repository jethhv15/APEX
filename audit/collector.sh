#!/system/bin/sh

LOG_DIR="/data/adb/modules/APEX/logs"
GAME_PKG="com.tencent.ig"

mkdir -p "$LOG_DIR"

wait_for_game() {
    while true
    do
        pid="$(pidof $GAME_PKG)"

        if [ -n "$pid" ]; then
            sleep 10
            return
        fi

        sleep 2
    done
}

collect() {

    TS="$(date +%Y%m%d-%H%M%S)"
    OUT="$LOG_DIR/framework-$TS.log"

    {

    echo "=================================="
    echo "APEX Framework Collector"
    echo "=================================="

    date

    echo
    echo "===== Device ====="
    getprop ro.product.device
    getprop ro.build.fingerprint
    uname -a

    echo
    echo "===== Game ====="
    pidof com.tencent.ig

    echo
    echo "===== Activity ====="
    dumpsys activity lru

    echo
    echo "===== Activity OOM ====="
    dumpsys activity oom

    echo
    echo "===== SurfaceFlinger ====="
    dumpsys SurfaceFlinger

    echo
    echo "===== Input ====="
    dumpsys input

    echo
    echo "===== GameManager ====="
    cmd game list

    echo
    echo "===== Thermal ====="
    dumpsys thermalservice

    echo
    echo "===== Power ====="
    dumpsys power

    echo
    echo "===== Scheduler ====="

    PID=$(pidof com.tencent.ig)

    if [ -n "$PID" ]; then

        cat /proc/$PID/status
        echo

        cat /proc/$PID/sched
        echo

        cat /proc/$PID/cgroup
        echo

        cat /proc/$PID/oom_score_adj

    fi

    } > "$OUT"

}

wait_for_game
collect
