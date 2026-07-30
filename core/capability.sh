#!/system/bin/sh
#
# APEX
# Component : Core
# File      : capability.sh
# Purpose   : Device capability scanner
#
# SPDX-License-Identifier: MIT
#

CAP_SDK=""
CAP_DEVICE=""
CAP_KERNEL=""

capability_scan() {
    CAP_SDK="$(android_get_sdk)"
    CAP_DEVICE="$(android_get_device)"
    CAP_KERNEL="$(android_get_kernel)"
}

capability_sdk() {
    printf "%s" "$CAP_SDK"
}

capability_device() {
    printf "%s" "$CAP_DEVICE"
}

capability_kernel() {
    printf "%s" "$CAP_KERNEL"
}

# End of File
