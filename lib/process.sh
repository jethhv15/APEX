#!/system/bin/sh
#
# APEX
# Component : Library
# File      : process.sh
# Purpose   : Process helper library
#
# SPDX-License-Identifier: MIT
#

# Check whether a process exists.
process_exists() {
    pidof "$1" >/dev/null 2>&1
}

# Get process PID.
process_pid() {
    pidof "$1"
}

# Check whether a process is running.
process_running() {
    process_exists "$1"
}

# Kill a process.
process_kill() {
    kill "$1"
}

# Kill a process forcefully.
process_kill_force() {
    kill -9 "$1"
}

# End of File
