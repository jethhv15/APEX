#!/system/bin/sh
#
# APEX
# Component : Core
# File      : logger.sh
# Purpose   : Runtime logger manager
#
# SPDX-License-Identifier: MIT
#

LOG_DIR="/data/local/tmp/apex/logs"
LOG_FILE="${LOG_DIR}/runtime.log"

logger_init() {
    mkdir -p "$LOG_DIR"
    touch "$LOG_FILE"
}

logger_write() {
    log_info "$1" "$2" >> "$LOG_FILE"
}

logger_warn() {
    log_warn "$1" "$2" >> "$LOG_FILE"
}

logger_error() {
    log_error "$1" "$2" >> "$LOG_FILE"
}

logger_debug() {
    log_debug "$1" "$2" >> "$LOG_FILE"
}

# End of File
