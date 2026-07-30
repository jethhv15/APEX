#!/system/bin/sh
#
# APEX
# Component : Library
# File      : property.sh
# Purpose   : Android property wrapper
#
# SPDX-License-Identifier: MIT
#

# ==========================
# Public API
# ==========================

prop_get() {
    getprop "$1"
}

prop_set() {
    setprop "$1" "$2"
}

prop_exists() {
    [ -n "$(getprop "$1")" ]
}

prop_equals() {
    [ "$(getprop "$1")" = "$2" ]
}

# ==========================
# End of File
# ==========================
