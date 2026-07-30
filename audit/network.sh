#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : network.sh
# Purpose   : Network subsystem audit
#
# SPDX-License-Identifier: MIT
#

NETWORK_IFACE=""
NETWORK_STATE="DOWN"
DNS_SERVERS=""

audit_network() {
    NETWORK_IFACE="$(ip route 2>/dev/null | awk '/default/ {print $5; exit}')"

    if [ -n "$NETWORK_IFACE" ]; then
        NETWORK_STATE="UP"
    fi

    DNS_SERVERS="$(getprop net.dns1) $(getprop net.dns2)"

    logger_write "NETWORK" \
        "iface=${NETWORK_IFACE:-none} state=$NETWORK_STATE"

    logger_write "NETWORK" \
        "dns=${DNS_SERVERS:-unknown}"
}

network_get_iface() {
    printf "%s" "$NETWORK_IFACE"
}

network_get_state() {
    printf "%s" "$NETWORK_STATE"
}

network_get_dns() {
    printf "%s" "$DNS_SERVERS"
}

# End of File
