#!/system/bin/sh
#
# APEX
# Component : Library
# File      : file.sh
# Purpose   : File operation helper
#
# SPDX-License-Identifier: MIT
#

# ==========================
# Public API
# ==========================

file_exists() {
    [ -e "$1" ]
}

file_read() {
    cat "$1"
}

file_write() {
    printf "%s" "$2" > "$1"
}

file_append() {
    printf "%s\n" "$2" >> "$1"
}

file_copy() {
    cp "$1" "$2"
}

file_move() {
    mv "$1" "$2"
}

file_remove() {
    rm -f "$1"
}

file_backup() {
    if file_exists "$1"; then
        cp "$1" "$1.bak"
    fi
}

file_restore() {
    if file_exists "$1.bak"; then
        mv "$1.bak" "$1"
    fi
}

# ==========================
# End of File
# ==========================
