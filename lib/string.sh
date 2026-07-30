#!/system/bin/sh
#
# APEX
# Component : Library
# File      : string.sh
# Purpose   : String helper library
#
# SPDX-License-Identifier: MIT
#

# Check whether a string contains another string.
string_contains() {
    case "$1" in
        *"$2"*) return 0 ;;
        *) return 1 ;;
    esac
}

# Convert string to lowercase.
string_lower() {
    printf "%s" "$1" | tr '[:upper:]' '[:lower:]'
}

# Convert string to uppercase.
string_upper() {
    printf "%s" "$1" | tr '[:lower:]' '[:upper:]'
}

# Trim leading and trailing spaces.
string_trim() {
    printf "%s" "$1" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# End of File
