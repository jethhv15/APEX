#!/system/bin/sh
#
# APEX
# Component : Core
# File      : policy.sh
# Purpose   : Policy manager
#
# SPDX-License-Identifier: MIT
#

policy_allow() {
    return 0
}

policy_deny() {
    return 1
}

policy_check() {
    local action="$1"

    [ -n "$action" ] || return 1

    policy_allow
}

# End of File
