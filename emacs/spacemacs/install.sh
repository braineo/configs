
#!/usr/bin/env bash

set -e

SCRIPT=$(basename $0)
MODE=${1:-setup}

function usage
{
    echo "Usage: ${SCRIPT} <mode>"
    echo "       ${SCRIPT} setup/vanilla/guest"
    echo "       setup: spacemacs is install at home, just need to symlink private layers and .spacemacs file"
    echo "       vanilla: full install"
    echo "       guest: full install to specific path to keep existing emacs config"
}

if ! [[ ${MODE} =~ ^(setup|vanilla|guest)$ ]]; then
    usage
fi

# private layers to install
declare -a layers=(braineo braineo-ui braineo-editor braineo-global-keybindings braineo-lang)
declare -A map

for key in "${!layers[@]}"; do map[${layers[$key]}]="$key"; done

PRIVATEPATH=$(pwd)
for layer in *; do
    if [[ -n "${map[$layer]}" ]]; then
        TARGET="${HOME}/.emacs.d/private/${layer}"
        if [[ -e ${TARGET} ]]; then
            rm -rf ${TARGET}
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
