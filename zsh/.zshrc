source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme

#Plugins
zplug "rupa/z", from:github, use:z.sh as:command
zplug "plugins/git", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "zsh-users/zsh-completions"
zplug "zdharma/history-search-multi-word"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", defer:1


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GIT_PS1_DESCRIBE_STYLE='branch'

source $HOME/.zshell/config.zsh
source $HOME/.zshell/aliases.zsh
source $HOME/.zshell/functions.zsh


