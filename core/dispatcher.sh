#!/system/bin/sh
#
# APEX Dispatcher
#

MODULE_DIR="/data/adb/modules/APEX"

ENGINE_DIR="$MODULE_DIR/engines"

LOGGER="$MODULE_DIR/core/logger.sh"
CONTEXT="$MODULE_DIR/core/context.sh"
POLICY="$MODULE_DIR/core/policy.sh"

[ -f "$LOGGER" ] && . "$LOGGER"
[ -f "$CONTEXT" ] && . "$CONTEXT"
[ -f "$POLICY" ] && . "$POLICY"

log() {
    if command -v apex_log >/dev/null 2>&1; then
        apex_log "$1"
    else
        echo "[APEX] $1"
    fi
}

log "Dispatcher started"

for ENGINE in "$ENGINE_DIR"/*.sh
do
    [ -f "$ENGINE" ] || continue

    NAME="$(basename "$ENGINE" .sh)"

    if command -v policy_check >/dev/null 2>&1; then
        if ! policy_check "$NAME"; then
            log "$NAME skipped by policy"
            continue
        fi
    fi

    chmod 0755 "$ENGINE"

    log "Executing $NAME"

    sh "$ENGINE"

    RESULT=$?

    if [ "$RESULT" -eq 0 ]; then
        log "$NAME SUCCESS"
    else
        log "$NAME FAILED ($RESULT)"
    fi
done

log "Dispatcher finished"

exit 0
