#!/bin/bash
source config.sh

_parallel() {
    for cmd in "$@"; do {
    echo "[_parallel] process \"$cmd\" started";
    $cmd & pid=$!
    PID_LIST+=" $pid";
    } done

    trap "kill $PID_LIST" SIGINT

    echo "[_parallel] processes have started";

    wait $PID_LIST

    echo
    echo "[_parallel] all processes have completed";
}

./build.sh

_parallel "npx live-server www"  "./dev-watch.sh" 

# gnu parallel not logging for some reason
# parallel ::: "npx live-server $TARGET_DIR" "./dev-watch.sh"