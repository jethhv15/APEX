#!/system/bin/sh
#
# APEX
# Component : Core
# File      : runtime.sh
# Purpose   : Runtime manager
#
# SPDX-License-Identifier: MIT
#

RUNTIME_STATE="STOPPED"

runtime_load() {
    local base

    base="${MODPATH:-${0%/*}/..}"

    # Libraries
    . "$base/lib/log.sh"
    . "$base/lib/property.sh"
    . "$base/lib/android_api.sh"
    . "$base/lib/file.sh"
    . "$base/lib/process.sh"
    . "$base/lib/string.sh"

    # Core
    . "$base/core/logger.sh"
    . "$base/core/context.sh"
    . "$base/core/capability.sh"
    . "$base/core/registry.sh"
    . "$base/core/policy.sh"
    . "$base/core/decision.sh"
    . "$base/core/dispatcher.sh"
    . "$base/core/verify.sh"
    . "$base/core/restore.sh"
    . "$base/core/health.sh"
}

runtime_init() {
    runtime_is_ready && return 0

    runtime_load

    logger_init

    RUNTIME_STATE="RUNNING"

    logger_write "RUNTIME" "Runtime initialized."

    return 0
}

runtime_is_ready() {
    [ "$RUNTIME_STATE" = "RUNNING" ]
}

runtime_shutdown() {
    runtime_is_ready || return 0

    logger_write "RUNTIME" "Runtime shutdown."

    RUNTIME_STATE="STOPPED"
}

# End of File
