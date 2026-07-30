#!/system/bin/sh
#
# APEX
# Component : Core
# File      : rules.sh
# Purpose   : Decision Rule Registry
#
# SPDX-License-Identifier: MIT
#

RULES=""

rule_register() {

    RULES="$RULES $1"

    logger_write "RULE" "Registered: $1"

}

rule_init() {

    RULES=""

    rule_register activity
    rule_register surface
    rule_register input
    rule_register game
    rule_register thermal
    rule_register power
    rule_register binder
    rule_register lmkd
    rule_register hwui

}

rule_list() {

    echo "$RULES"

}

# End of File
