#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : android.sh
# Purpose   : Android system audit
#
# SPDX-License-Identifier: MIT
#

audit_android() {
    registry_set SDK "$(android_get_sdk)"
    registry_set DEVICE "$(android_get_device)"
    registry_set MODEL "$(android_get_model)"
    registry_set BRAND "$(android_get_brand)"
    registry_set KERNEL "$(android_get_kernel)"
}

# End of File
