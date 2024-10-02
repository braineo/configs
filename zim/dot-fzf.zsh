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


# port for glab using util functions in https://github.com/chitoku-k/fzf-zsh-completions
_fzf_complete_glab() {
    setopt local_options no_aliases
    local command_pos=$(_fzf_complete_get_command_pos "$@")
    local arguments=("${(Qe)${(z)$(_fzf_complete_requote_arguments ${~${(z)@}})}[@][$command_pos, -1]}")
    local glab_command=${arguments[2]}
    local glab_subcommand=${arguments[3]}
    local last_argument=${arguments[-1]}

    if (( $command_pos > 1 )); then
        local -x "${(Qe)${(z)$(_fzf_complete_requote_arguments ${~${(z)@}})}[@][1, $command_pos - 1]}"
    fi

    if (( $+functions[_fzf_complete_glab_${glab_command}] )) && _fzf_complete_glab_${glab_command} "$@"; then
        return
    fi

    if [[ $glab_command = mr ]]; then
        local prefix_option completing_option
        local glab_options_argument_required=(-R --repo)
        local glab_options_argument_optional=()

        completing_option=$(_fzf_complete_parse_completing_option "$prefix" "$last_argument" "${(F)glab_options_argument_required}" "${(F)glab_options_argument_optional}" || :)

        case $completing_option in
            -R|--repo)
                return
                ;;

            *)
                if [[ $glab_subcommand = (checkout|close|merge|approve|todo|revoke) ]]; then
                    _fzf_complete_glab-mr '' '' "$@"
                fi

                if [[ $glab_subcommand = reopen ]]; then
                    _fzf_complete_glab-mr '' '--closed' "$@"
                fi

                if [[ $glab_subcommand = (diff|update|view) ]]; then
                    _fzf_complete_glab-mr '' '--all' "$@"
                fi

                return
                ;;
        esac

        return
    fi

    _fzf_path_completion "$prefix" "$@"
}

_fzf_complete_glab-mr() {
    local fzf_options=$1
    local mr_state=$2
    shift 2

    _fzf_complete --ansi --tiebreak=index --header-lines=1 ${(Q)${(Z+n+)fzf_options}} -- "$@" < <({
        echo "#\tTITLE\tBRANCH\tSTATE"
        glab mr list $mr_state -F json | jq -r '(.[] | [.reference, .title, .source_branch, .state]) | @tsv'
    } | FS="\t" _fzf_complete_tabularize ${fg[yellow]} $reset_color ${fg[blue]} ${fg[green]})
}

_fzf_complete_glab-mr_post() {
    awk '{ print $1 }' | tr -d "!"
}

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
