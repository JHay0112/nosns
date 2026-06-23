#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Sets up the nosns development environment
#
# Author: J. L. Hay
# ------------------------------------------------------------------------------

# Import shared constants
source "$(dirname -- ${BASH_SOURCE[0]})/constants.sh"

# Permit empty glob results
shopt -s nullglob

# Clear out the git hooks directory if it exists
if [ -d "${GIT_HOOKS_DIR}" ] && [ ! -L "${GIT_HOOKS_DIR}" ];
then
    rm -f ${GIT_HOOKS_DIR}/*.sample
    rmdir "${GIT_HOOKS_DIR}" 2>/dev/null
fi

# If the git hooks directory still exists then something has gone wrong
if [ -d "${GIT_HOOKS_DIR}" ] && [ ! -L "${GIT_HOOKS_DIR}" ];
then
    echo "error: git hooks directory contains non-default hooks"
    exit 1
fi

# Symlink hooks scripts to githooks dir
ln -srf ${NOSNS_HOOKS_DIR} ${GIT_HOOKS_DIR}
