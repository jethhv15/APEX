#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : network.sh
# Purpose   : Network audit
#
# SPDX-License-Identifier: MIT
#

audit_network() {
    registry_set WIFI_STATE "$(settings get global wifi_on)"
    registry_set MOBILE_DATA "$(settings get global mobile_data)"
    registry_set AIRPLANE_MODE "$(settings get global airplane_mode_on)"
}

# End of File
