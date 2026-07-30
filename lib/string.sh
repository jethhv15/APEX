#!/system/bin/sh
#
# APEX
# Component : Library
# File      : string.sh
# Purpose   : String helper library
#
# SPDX-License-Identifier: MIT
#

string_contains() {
    case "$1" in
        *"$2"*) return 0 ;;
        *) return 1 ;;
    esac
}

string_lower() {
    printf "%s" "$1" | tr '[:upper:]' '[:lower:]'
}

string_upper() {
    printf "%s" "$1" | tr '[:lower:]' '[:upper:]'
}

string_trim() {
    printf "%s" "$1" | awk '{$1=$1};1'
}

# End of File
