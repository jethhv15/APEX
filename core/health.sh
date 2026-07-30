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
    runtime_is_ready &&
    logger_write "HEALTH" "Runtime healthy."
}

# End of File
