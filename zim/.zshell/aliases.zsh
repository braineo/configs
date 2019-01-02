if [[ "$OSTYPE" == linux* ]]; then
    alias emacs="emacsclient -t -a ''"
    alias emacsapp="LC_CTYPE=zh_CN.UTF-8 /usr/local/bin/emacs"
elif  [[ "$OSTYPE" = darwin* ]]; then
    alias emacsapp="open -a /Applications/Emacs.app"
    alias emacsd="/usr/local/bin/emacs --daemon"
    alias emacs="emacsclient -c -a emacs-cocoa"
fi

alias killemacs="emacsclient -e '(kill-emacs)'"


#
# git
#
alias ga='git add'
alias gaa='git add --all'
alias gss='git status -s'
alias gcp='git cherry-pick'
alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias gfa='git fetch --all --prune'
alias gcl='git clone --recursive'
alias gd='git diff'
alias gdca='git diff --cached'
alias gsu='git submodule update'

#
# navigation
#
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias d='dirs -v | head -10'

alias ncdu='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
