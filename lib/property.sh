#!/system/bin/sh
#
# APEX
# Component : Library
# File      : property.sh
# Purpose   : Android property wrapper
#
# SPDX-License-Identifier: MIT
#

prop_get() {
    getprop "$1"
}

prop_set() {
    setprop "$1" "$2"
}

prop_exists() {
    [ -n "$(prop_get "$1")" ]
}

prop_equals() {
    [ "$(prop_get "$1")" = "$2" ]
}

# End of File
