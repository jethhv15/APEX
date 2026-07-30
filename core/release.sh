#!/system/bin/sh
#
# APEX
# Component : Core
# File      : release.sh
#
# SPDX-License-Identifier: MIT
#

RELEASE_NAME="APEX"
RELEASE_VERSION="2.0.0-rc1"
RELEASE_KERNEL="Clover 3.11"
RELEASE_STAGE="Release Candidate"

release_show() {

    logger_write "RELEASE" "Name    : ${RELEASE_NAME}"
    logger_write "RELEASE" "Version : ${RELEASE_VERSION}"
    logger_write "RELEASE" "Kernel  : ${RELEASE_KERNEL}"
    logger_write "RELEASE" "Stage   : ${RELEASE_STAGE}"

    return 0
}

# End of File
