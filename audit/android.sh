#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : android.sh
# Purpose   : Android framework audit
#
# SPDX-License-Identifier: MIT
#

ANDROID_VERSION=""
ANDROID_SDK=""
DEVICE=""
PRODUCT=""
BRAND=""
ROM_FINGERPRINT=""
KERNEL_VERSION=""

audit_android() {
    ANDROID_VERSION="$(getprop ro.build.version.release)"
    ANDROID_SDK="$(getprop ro.build.version.sdk)"
    DEVICE="$(getprop ro.product.device)"
    PRODUCT="$(getprop ro.product.product.name)"
    BRAND="$(getprop ro.product.brand)"
    ROM_FINGERPRINT="$(getprop ro.build.fingerprint)"
    KERNEL_VERSION="$(uname -r)"

    logger_write "ANDROID" "version=$ANDROID_VERSION sdk=$ANDROID_SDK"
    logger_write "ANDROID" "brand=$BRAND device=$DEVICE product=$PRODUCT"
    logger_write "ANDROID" "kernel=$KERNEL_VERSION"
    logger_write "ANDROID" "fingerprint=$ROM_FINGERPRINT"
}

audit_android_get() {
    case "$1" in
        version) printf "%s" "$ANDROID_VERSION" ;;
        sdk) printf "%s" "$ANDROID_SDK" ;;
        brand) printf "%s" "$BRAND" ;;
        device) printf "%s" "$DEVICE" ;;
        product) printf "%s" "$PRODUCT" ;;
        kernel) printf "%s" "$KERNEL_VERSION" ;;
        fingerprint) printf "%s" "$ROM_FINGERPRINT" ;;
        *) return 1 ;;
    esac
}

# End of File
