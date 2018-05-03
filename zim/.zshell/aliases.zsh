if [[ "$OSTYPE" == linux* ]]; then
    alias emacs="emacsclient -t"
    alias emacsapp="export LC_CTYPE=zh_CN.UTF-8 /usr/local/bin/emacs"
elif  [[ "$OSTYPE" = darwin* ]]; then
    alias emacsapp="open -a /Applications/Emacs.app"
    alias emacsd="/usr/local/bin/emacs --daemon"
    alias emacs="emacsclient -c -a emacs-cocoa"
fi

alias killemacs="emacsclient -e '(kill-emacs)'"

alias ga='git add'
alias gaa='git add --all'
alias gss='git status -s'
alias gcp='git cherry-pick'
alias gl='git pull'
alias gfa='git fetch --all --prune'
alias gcl='git clone --recursive'
alias gd='git diff'
alias gdca='git diff --cached'
