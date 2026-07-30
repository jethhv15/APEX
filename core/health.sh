#!/system/bin/sh
#
# APEX
# Component : Core
# File      : health.sh
# Purpose   : Health manager
#
# SPDX-License-Identifier: MIT
#

health_check() {
    if runtime_is_ready; then
        logger_write "HEALTH" "Runtime healthy."
        return 0
    fi

    logger_error "HEALTH" "Runtime not ready."
    return 1
}

# End of File
