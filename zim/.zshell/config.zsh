unsetopt NOMATCH

if [[ "$OSTYPE" == linux* ]]; then

elif  [[ "$OSTYPE" = darwin* ]]; then
# Some linux utils path
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/gnu-tar/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:MANPATH"
fi
