# Setup fzf
# ---------
export PATH="${PATH:+${PATH}:}${ZIM_HOME}/modules/fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${ZIM_HOME}/modules/fzf/shell/completion.zsh" 2>/dev/null

# Key bindings
# ------------
source "${ZIM_HOME}/modules/fzf/shell/key-bindings.zsh"

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_complete_gdb() {
    _fzf_complete -m --preview 'echo {}' --preview-window down:3:wrap --min-height 15 -- "$@" < <(
        command ps -ef | sed 1d
    )
}

_fzf_complete_gdb_post() {
    awk '{print $2}'
}

alias _fzf_complete_lldb=_fzf_complete_gdb
alias _fzf_complete_lldb_post=_fzf_complete_gdb_post

_gen_fzf_default_opts() {

    local color00='#1f2022'
    local color01='#282828'
    local color02='#444155'
    local color03='#585858'
    local color04='#b8b8b8'
    local color05='#a3a3a3'
    local color06='#e8e8e8'
    local color07='#f8f8f8'
    local color08='#f2241f'
    local color09='#ffa500'
    local color0A='#b1951d'
    local color0B='#67b11d'
    local color0C='#2d9574'
    local color0D='#4f97d7'
    local color0E='#a31db1'
    local color0F='#b03060'

    export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
    # Setting fd as the default source for fzf
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always --line-range :500 {} || tree -C {}) 2> /dev/null || head -200'"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
}

_gen_fzf_default_opts
