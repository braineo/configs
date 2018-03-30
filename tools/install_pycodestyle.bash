#!/usr/bin/env bash

set -e

TARGET=$HOME/.config/pycodestyle

if [[ -e ${TARGET} ]] || [[ -L ${TARGET} ]]; then
    rm -rf ${TARGET}
fi;

PRIVATEPATH=$(pwd)
echo "Linking pycodestyle config"
ln -s "${PRIVATEPATH}/pycodestyle.config" "${TARGET}"
