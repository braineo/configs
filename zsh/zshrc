# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k/powerlevel9k" # ys

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git brew ls forklift pip sublime zsh-syntax-highlighting zsh-completions gitfast autojump npm)

source $ZSH/oh-my-zsh.sh

# User configuration

# Development path
export DEV=$HOME/Develop

# Go Settup
export GOPATH=$DEV/Go

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emacsapp="open -a /Applications/Emacs.app"
alias emacsd="/usr/local/bin/emacs --daemon"
alias emacs="emacsclient -c -a emacs-cocoa"
alias killemacs="emacsclient -e '(kill-emacs)'"
eval "$(thefuck --alias)"
export TERM="xterm-256color"

# Powerline setup
detached_head(){
    if $(command git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        local BRANCH_NAME="$(git symbolic-ref -q HEAD)"
        if [[ -n $BRANCH_NAME || `pwd` != $(git rev-parse --show-toplevel)  ]]; then
            echo ""
        else
            echo "$(__git_ps1 '%s')"
        fi
    fi
}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_detached_head time)
POWERLEVEL9K_CUSTOM_DETACHED_HEAD="detached_head"
POWERLEVEL9K_CUSTOM_DETACHED_HEAD_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_DETACHED_HEAD_FOREGROUND="249"
DEFAULT_USER=$USER
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
GIT_PS1_DESCRIBE_STYLE='branch'

# Z shell setup
unsetopt nomatch

#Auto Jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# pure prompt https://github.com/sindresorhus/pure
fpath=("/usr/local/lib/node_modules/pure-prompt/" $fpath)
autoload -U promptinit; promptinit
prompt pure