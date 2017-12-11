#!/usr/bin/env bash

set -e

TARGET=$HOME/.jsbeautifyrc

if [[ -e ${TARGET} ]] || [[ -L ${TARGET} ]]; then
    rm -rf ${TARGET}
fi;

PRIVATEPATH=$(pwd)
echo "Linking jsbeautify config"
ln -s "${PRIVATEPATH}/jsbeautifyrc" "${TARGET}"
