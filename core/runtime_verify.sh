#!/system/bin/sh
#
# APEX
# Component : Core
# File      : runtime_verify.sh
#
# SPDX-License-Identifier: MIT
#

runtime_verify_run() {

    logger_write "VERIFY" "Runtime verification started."

    if verify_run
    then

        logger_write "VERIFY" "Runtime verification passed."

        report_generate

        validation_run || return 1

        benchmark_compare

        benchmark_regression

        return 0

    fi

    logger_write "VERIFY" "Runtime verification failed."

    restore_run

    return 1
}

# End of File
