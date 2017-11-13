#!/usr/bin/env bash

declare -a layers=(braineo braineo-ui braineo-editor braineo-global-keybindings)
declare -A map

for key in "${!layers[@]}"; do map[${layers[$key]}]="$key"; done

PRIVATEPATH=$(pwd)
for layer in *; do
    if [[ -n "${map[$layer]}" ]]; then
        TARGET="${HOME}/.emacs.d/private/${layer}"
        if [[ -e ${TARGET} ]]; then
            rm ${TARGET}
        fi;
        echo "Linking layer $layer"
        ln -s "${PRIVATEPATH}/${layer}" ${TARGET}
    fi;
done

if [[ -e "${HOME}/.spacemacs" ]]; then
    rm "${HOME}/.spacemacs"
fi;
echo "Linking spacemacs config"
ln -s "${PRIVATEPATH}/spacemacs" "${HOME}/.spacemacs"
