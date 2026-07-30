#!/system/bin/sh
#
# APEX
# Component : Library
# File      : log.sh
# Purpose   : Common logging helper functions
#
# SPDX-License-Identifier: MIT
#

# ==========================
# Constants
# ==========================

LOG_LEVEL_INFO="INFO"
LOG_LEVEL_WARN="WARN"
LOG_LEVEL_ERROR="ERROR"
LOG_LEVEL_DEBUG="DEBUG"

# ==========================
# Internal
# ==========================

_internal_timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

_internal_format_log() {
    local level="$1"
    local tag="$2"
    local message="$3"

    printf "[%s] [%s] [%s] %s\n" \
        "$(_internal_timestamp)" \
        "$level" \
        "$tag" \
        "$message"
}

# ==========================
# Public API
# ==========================

log_info() {
    _internal_format_log "$LOG_LEVEL_INFO" "$1" "$2"
}

log_warn() {
    _internal_format_log "$LOG_LEVEL_WARN" "$1" "$2"
}

log_error() {
    _internal_format_log "$LOG_LEVEL_ERROR" "$1" "$2"
}

log_debug() {
    _internal_format_log "$LOG_LEVEL_DEBUG" "$1" "$2"
}

# ==========================
# End of File
# ==========================
