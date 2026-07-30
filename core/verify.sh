#!/system/bin/sh
#
# APEX
# Component : Core
# File      : verify.sh
# Purpose   : Verification manager
#
# SPDX-License-Identifier: MIT
#

verify_run() {

    local result=0

    for engine in "${REGISTRY_ENGINES[@]}"
    do

        verify "$engine"

        if [ $? -ne 0 ]; then

            logger_write "VERIFY" "$engine failed."

            restore_engine "$engine"

            result=1

        else

            logger_write "VERIFY" "$engine passed."
        fi

    done

    return "$result"
}

# End of File
