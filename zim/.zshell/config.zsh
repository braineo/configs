unsetopt NOMATCH

WORDCHARS=${WORDCHARS//[&-.;\/\_=]}

# directory related
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
