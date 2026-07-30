#!/system/bin/sh
#
# APEX
# Component : Library
# File      : log.sh
# Purpose   : Logging helper
#
# SPDX-License-Identifier: MIT
#

log_timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

log_format() {
    printf "[%s] [%s] [%s] %s\n" \
        "$(log_timestamp)" \
        "$1" \
        "$2" \
        "$3"
}

log_info() {
    log_format "INFO" "$1" "$2"
}

log_warn() {
    log_format "WARN" "$1" "$2"
}

log_error() {
    log_format "ERROR" "$1" "$2"
}

log_debug() {
    log_format "DEBUG" "$1" "$2"
}

# End of File
