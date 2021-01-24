#! /usr/bin/env bash

# autogenerated by linuxdeploy

# make sure errors in sourced scripts will cause this script to stop
set -e

this_dir="$(readlink -f "$(dirname "$0")")"

# any file within that directory is considered to be a script
# we can't perform any validity checks, that would be way too much complexity and even tools which
# claim they can, like e.g., shellcheck, aren't perfect, they only aid in avoiding bugs but cannot
# prevent them completely
hooks_dir="$this_dir/apprun-hooks"
for hook in "$hooks_dir"/*; do
    if [ -f "$hook" ]; then
        # shellcheck disable=SC1090
        source "$hook"
    fi
done

exec "$this_dir"/AppRun.wrapped "$@"
