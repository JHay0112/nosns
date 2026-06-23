#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Validates the nosns development environment
#
# Author: J. L. Hay
# ------------------------------------------------------------------------------

# Permit empty glob results
shopt -s nullglob

# Import shared constants
source "$(dirname -- ${BASH_SOURCE[0]})/constants.sh"

# Check both git hooks directories exist and the Git one is a symlink to the
# nosns one
if [ ! -L "${GIT_HOOKS_DIR}" ] &&
   [ ! -d "${NOSNS_HOOKS_DIR}" ] &&
   [ ! "${GIT_HOOKS_DIR}" -ef "${NOSNS_HOOKS_DIR}" ];
then
    echo "error: git hooks not installed"
    exit 1
fi

# Check the scripts in the git hooks directory are executable
for file in ${GIT_HOOKS_DIR}/*;
do
    if [ -f "${file}" ] && [ ! -x "${file}" ];
    then
        echo "error: git hook ${file} is not executable"
        exit 1
    fi
done

exit 0
