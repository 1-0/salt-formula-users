#!/usr/bin/env bash

###

set -e
[ -n "$DEBUG" ] && set -x

CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FORMULA_NAME="salt-formula-users"


# to do - create test environment and run test pillar
