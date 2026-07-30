#!/system/bin/sh
#
# APEX
# Component : Core
# File      : manifest.sh
#
# SPDX-License-Identifier: MIT
#

APEX_NAME="APEX"
APEX_VERSION="2.0.0"
APEX_API="2"
APEX_STATUS="Stable"

APEX_COMPONENTS="
bootstrap
runtime
context
capability
registry
health
audit
analyzer
decision
engine
verify
restore
integrity
report
validation
benchmark
"

manifest_show() {

    logger_write "MANIFEST" "Name      : ${APEX_NAME}"
    logger_write "MANIFEST" "Version   : ${APEX_VERSION}"
    logger_write "MANIFEST" "API       : ${APEX_API}"
    logger_write "MANIFEST" "Status    : ${APEX_STATUS}"

    for component in ${APEX_COMPONENTS}
    do
        logger_write "MANIFEST" "Component : ${component}"
    done

    return 0
}

# End of File
