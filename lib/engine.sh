#!/system/bin/sh
#
# APEX Engine API
#

engine_name() {
    printf "%s\n" "${ENGINE_NAME:-Unknown Engine}"
}

init() {
    return 0
}

apply() {
    return 0
}

verify() {
    return 0
}

restore() {
    return 0
}

run_engine() {
    init || return 1
    apply || return 1
    verify || return 1
    return 0
}
