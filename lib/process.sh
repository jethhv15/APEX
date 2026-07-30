#!/system/bin/sh
#
# APEX
# Component : Library
# File      : process.sh
# Purpose   : Process helper library
#
# SPDX-License-Identifier: MIT
#

process_exists() {
    pidof "$1" >/dev/null 2>&1
}

process_pid() {
    pidof "$1"
}

process_running() {
    process_exists "$1"
}

process_kill() {
    kill "$1" 2>/dev/null
}

process_kill_force() {
    kill -9 "$1" 2>/dev/null
}

# End of File
