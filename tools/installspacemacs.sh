#!/usr/bin/env bash

set -e

# SCRIPT=$(basename $0)
# MODE=${1:-setup}

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w

printf "${BLUE}Cloning Spacemacs...${NORMAL}\n"
hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
}

if [ ! -n "$BEMACS" ]; then
    BEMACS=$HOME/.bemacs
fi

SPACEMACSPATH=$BEMACS/.emacs.d

git clone https://github.com:braineo/configs.git $BEMACS || {
    printf "Error: git clone of bemacs repo failed\n"
    exit 1
}

git clone -b develop https://github.com/syl20bnr/spacemacs $SPACEMACSPATH || {
    printf "Error: git clone of spacemacs repo failed\n"
    exit 1
}

# Symlink private layers
declare -a layers=("braineo" "braineo-ui" "braineo-editor" "braineo-global-keybindings" "braineo-lang")

for layer in "${layers[@]}"
do
    TARGET="${SPACEMACSPATH}/private/${layer}"
    if [[ -e ${TARGET} ]] || [[ -L ${TARGET} ]]; then
        rm -rf ${TARGET}
    fi;
    printf "${BLUE}Linking layer $layer...${NORMAL}\n"
    ln -s "${BEMACS}/emacs/spacemacs/layers/${layer}" ${TARGET}
done

# Symlink config dotfile
printf "${BLUE}Looking for an existing spacemacs config...${NORMAL}\n"
if [ -f $HOME/.spacemacs ] || [ -h $HOME/.spacemacs ]; then
    printf "${YELLOW}Found ~/.spacemacs.${NORMAL} ${GREEN}Backing up to ~/.spacemacs.pre-bemacs${NORMAL}\n";
    mv $HOME/.spacemacs ~/.spacemacs.pre-bemacs;
fi

cp $BEMACS/emacs/spacemacs/spacemacs.guest.template $HOME/.spacemacs

# Install dependencies
printf "${BLUE}Installing dependencies...${NORMAL}\n"
if [[ $OSTYPE == "linux-gnu" ]]; then
    sudo apt install silversearcher-ag xclip;
    sudo pip install --upgrade "jedi>=0.9.0" "json-rpc>=1.8.1" "service_factory>=0.1.5";
    sudo pip install flake8;
fi

# Copy executable
if [[ -d $HOME/.local/bin ]]; then
    cp ${BEMACS}/bin/bemacs $HOME/.local/bin;
fi;
