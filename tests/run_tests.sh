#!/usr/bin/env bash

set -e
[ -n "$DEBUG" ] && set -x

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
METADATA=${CURDIR}/../metadata.yml
FORMULA_NAME=$(cat $METADATA | python -c "import sys,yaml; print yaml.load(sys.stdin)['name']")

## Overrideable parameters
PILLARDIR=${PILLARDIR:-${CURDIR}/pillar}

 
