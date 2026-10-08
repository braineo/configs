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

# Listening-port finder (fzf). enter: print pid, ^x: kill. `fport 8080` pre-filters.
# Other users' processes only show up under sudo.
fport() {
  local list='lsof -nP -iTCP -sTCP:LISTEN'
  eval $list | fzf --exact --query "${1-}" --header-lines=1 \
      --header 'enter: print pid   ^x: kill' \
      --preview 'ps -o pid,ppid,user,etime,args -p {2}' \
      --preview-window 'down,4,wrap' \
      --bind "ctrl-x:execute-silent(kill {2})+reload($list)" |
    awk '{print $2}'
}
