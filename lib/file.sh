#!/system/bin/sh
#
# APEX
# Component : Library
# File      : file.sh
# Purpose   : File helper library
#
# SPDX-License-Identifier: MIT
#

file_exists() {
    [ -e "$1" ]
}

file_read() {
    cat "$1"
}

file_write() {
    printf "%s" "$2" >"$1"
}

file_append() {
    printf "%s\n" "$2" >>"$1"
}

file_copy() {
    cp -f "$1" "$2"
}

file_move() {
    mv -f "$1" "$2"
}

file_remove() {
    rm -f "$1"
}

file_backup() {
    file_exists "$1" && cp -f "$1" "$1.bak"
}

file_restore() {
    file_exists "$1.bak" && mv -f "$1.bak" "$1"
}

# End of File
