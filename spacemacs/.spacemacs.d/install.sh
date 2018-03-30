
#!/usr/bin/env bash

set -e


if [ -f $HOME/.spacemacs ] || [ -h $HOME/.spacemacs ]; then
    rm "$HOME/.spacemacs"
fi;


DOTSPACEMACSD=$HOME/.spacemacs.d

if [ -d ${DOTSPACEMACSD} ]; then
    if [ -h ${DOTSPACEMACSD} ]; then
        # Remove symlink, no -rf cause it might delete contents it points to
        rm ${DOTSPACEMACSD}
    else
        rm -rf ${DOTSPACEMACSD}
    fi;
fi;

touch custom.el
ln -s "$(pwd)/../spacemacs" "$HOME/.spacemacs.d"
