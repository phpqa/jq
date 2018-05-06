#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- jq "$@"
elif [ "$1" = "jq" ]; then
  set -- /sbin/tini -- "$@"
fi

exec "$@"
