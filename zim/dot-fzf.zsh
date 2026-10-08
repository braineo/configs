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
    fd --color=always --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --color=always --type d --hidden --follow --exclude ".git" . "$1"
}

# gdb -p **<Tab> / lldb -p **<Tab>: pick one process to attach to
_fzf_complete_gdb() {
    _fzf_complete --header-lines=1 --wrap --no-preview -- "$@" < <(
        command ps -eo user,pid,ppid,start,time,command
    )
}

_fzf_complete_gdb_post() {
    awk '{print $2}'
}

alias _fzf_complete_lldb=_fzf_complete_gdb

# Snazzy palette, matches wezterm color_scheme
export FZF_DEFAULT_OPTS="
  --ansi --layout=reverse --border=rounded --highlight-line --height=~60% --min-height=10 --cycle
  --info=inline-right --prompt='❯ ' --pointer='▌' --marker='┃' --gutter=' '
  --separator='─' --scrollbar='│' --ellipsis='…'
  --preview-window=right,55%,border-rounded
  --bind='ctrl-/:toggle-preview,ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'
  --color=fg:#c5c6c9,bg:-1,gutter:-1,alt-bg:#2e303c,fg+:#eff0eb:bold,bg+:#3e4152
  --color=hl:#ff6ac1:bold,hl+:#ff6ac1:bold:underline
  --color=info:#686868,prompt:#ff6ac1,pointer:#ff6ac1,marker:#5af78e,spinner:#9aedfe
  --color=header:#686868,border:#43454f,separator:#43454f,scrollbar:#686868
  --color=label:#57c7ff:bold,query:#eff0eb:bold
"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --color=always --type f --strip-cwd-prefix --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS="--border-label ' Files '
  --preview '(bat --style=numbers,changes --color=always --line-range :500 {} || eza --tree --icons --color=always {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--border-label ' History ' --preview 'echo {2..}'
  --preview-window down,3,hidden,wrap,border-top --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND='fd --color=always --type d --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--border-label ' Directories '
  --preview 'eza --tree --level=2 --icons --color=always {} | head -200'"
