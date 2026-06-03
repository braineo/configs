#
# git
#
alias ga='git add'
alias gaa='git add --all'
alias gss='git status -s'
# Local
alias gs='git stash'
alias gst='git reset'
alias gco='git checkout'
alias gcp='git cherry-pick'
# Data
alias gc='git commit'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gm='git merge'
# Log
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgpd='BAT_PAGER="less -R" GIT_PAGER=delta glgp'
alias glgg='git log --graph'
# Upstream
alias gfa='git fetch --all --prune'
alias gcl='git clone --recursive'
# Diff
alias gd='git diff'
alias gdca='git diff --cached'

alias dgd='GIT_PAGER=delta gd --ignore-all-space'
# Submodule
alias gsu='git submodule update'
# Housekeeping
alias gbc='git branch --merged | rg -v "(^\*|master|dev|v\d)" | xargs git branch -D'
# Worktree switcher (fzf). enter: cd into worktree, ^x: remove worktree
gwt() {
  git rev-parse --show-toplevel >/dev/null 2>&1 || {
    print -u2 "gwt: not inside a git repository"
    return 1
  }

  local selected
  selected=$(
    git worktree list |
      fzf --height 40% --reverse \
          --header 'enter: switch   ^x: remove' \
          --preview 'git -C {1} log --oneline --decorate --color=always -20; \
                     echo; git -C {1} -c color.status=always status -s' \
          --preview-window 'right:60%' \
          --bind 'ctrl-x:execute(git worktree remove {1})+reload(git worktree list)'
  ) || return

  local target=${selected%% *}
  [[ -n $target ]] && cd -- "$target"
}

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
