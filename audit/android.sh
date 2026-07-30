#!/system/bin/sh
#
# APEX
# Component : Audit
# File      : android.sh
# Purpose   : Android Framework Audit
#
# SPDX-License-Identifier: MIT
#

audit_android() {

    logger_write "AUDIT" "Android audit started."

    activity_run

    logger_write "AUDIT" "Android audit finished."

    return 0
}

# End of File
