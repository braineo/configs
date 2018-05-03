if [[ "$OSTYPE" == linux* ]]; then
    alias emacs="emacsclient -t"
    alias emacsapp="export LC_CTYPE=zh_CN.UTF-8 /usr/local/bin/emacs"
elif  [[ "$OSTYPE" = darwin* ]]; then
    alias emacsapp="open -a /Applications/Emacs.app"
    alias emacsd="/usr/local/bin/emacs --daemon"
    alias emacs="emacsclient -c -a emacs-cocoa"
fi

alias killemacs="emacsclient -e '(kill-emacs)'"
