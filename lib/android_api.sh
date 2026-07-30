#!/system/bin/sh
#
# APEX
# Component : Library
# File      : android_api.sh
# Purpose   : Android API wrapper
#
# SPDX-License-Identifier: MIT
#

android_get_sdk() {
    prop_get ro.build.version.sdk
}

android_get_release() {
    prop_get ro.build.version.release
}

android_get_device() {
    prop_get ro.product.device
}

android_get_product() {
    prop_get ro.product.name
}

android_get_brand() {
    prop_get ro.product.brand
}

android_get_manufacturer() {
    prop_get ro.product.manufacturer
}

android_get_model() {
    prop_get ro.product.model
}

android_get_build_id() {
    prop_get ro.build.id
}

android_get_fingerprint() {
    prop_get ro.build.fingerprint
}

android_get_bootmode() {
    prop_get ro.bootmode
}

android_get_hardware() {
    prop_get ro.hardware
}

android_get_soc() {
    prop_get ro.soc.model
}

android_get_kernel() {
    uname -r
}

android_is_debuggable() {
    prop_equals ro.debuggable 1
}

# End of File
