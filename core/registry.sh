#!/system/bin/sh
#
# APEX
# Component : Core
# File      : registry.sh
# Purpose   : Runtime registry manager
#
# SPDX-License-Identifier: MIT
#

registry_set() {
    eval "REG_$1=\"\$2\""
}

registry_get() {
    eval "printf '%s' \"\$REG_$1\""
}

registry_exists() {
    eval "[ -n \"\$REG_$1\" ]"
}

registry_clear() {
    eval "unset REG_$1"
}

registry_reset() {
    unset $(set | awk -F= '/^REG_/ {print $1}')
}

# End of File
