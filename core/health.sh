#!/system/bin/sh
#
# APEX
# Runtime Health Manager
#

MODULE_DIR="/data/adb/modules/APEX"

health_log() {
    echo "[HEALTH] $1"
}

health_path() {
    [ -d "$MODULE_DIR" ] || return 1
    [ -d "$MODULE_DIR/core" ] || return 1
    [ -d "$MODULE_DIR/engines" ] || return 1
    [ -d "$MODULE_DIR/lib" ] || return 1
    return 0
}

health_android() {
    getprop ro.build.version.sdk >/dev/null 2>&1
}

health_kernel() {
    uname -r >/dev/null 2>&1
}

health_busybox() {
    command -v sh >/dev/null 2>&1
}

health_magisk() {
    [ -d /data/adb ]
}

health_runtime() {

    health_path || {
        health_log "Directory check failed"
        return 1
    }

    health_android || {
        health_log "Android check failed"
        return 1
    }

    health_kernel || {
        health_log "Kernel check failed"
        return 1
    }

    health_busybox || {
        health_log "Shell check failed"
        return 1
    }

    health_magisk || {
        health_log "Magisk environment missing"
        return 1
    }

    return 0
}

health_runtime
exit $?
