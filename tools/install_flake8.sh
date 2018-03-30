#!/usr/bin/env bash

set -e

TARGET=$HOME/.config/flake8

if [[ -e ${TARGET} ]] || [[ -L ${TARGET} ]]; then
    rm -rf ${TARGET}
fi;

PRIVATEPATH=$(pwd)
echo "Linking flake8 config"
ln -s "${PRIVATEPATH}/flake8.config" "${TARGET}"
