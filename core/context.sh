#!/system/bin/sh
#
# APEX Runtime Context
#

MODULE_DIR="/data/adb/modules/APEX"

export APEX_MODULE="$MODULE_DIR"

########################################
# Device
########################################

export APEX_DEVICE="$(getprop ro.product.device)"
export APEX_MODEL="$(getprop ro.product.model)"
export APEX_BRAND="$(getprop ro.product.brand)"

########################################
# Android
########################################

export APEX_ANDROID="$(getprop ro.build.version.release)"
export APEX_API="$(getprop ro.build.version.sdk)"

########################################
# Kernel
########################################

export APEX_KERNEL="$(uname -r)"

########################################
# Game
########################################

GAME=""

pidof com.tencent.ig >/dev/null 2>&1 && GAME="PUBG"

export APEX_GAME="$GAME"

########################################
# Profile
########################################

PROFILE="default"

case "$GAME" in
    PUBG)
        PROFILE="pubg"
        ;;
esac

export APEX_PROFILE="$PROFILE"

########################################
# Paths
########################################

export APEX_LOG="$MODULE_DIR/logs"
export APEX_ENGINE="$MODULE_DIR/engines"
export APEX_CONFIG="$MODULE_DIR/config"
export APEX_PROFILE_DIR="$MODULE_DIR/profiles"

return 0
