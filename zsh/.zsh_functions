detached_head(){
    if $(command git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        local BRANCH_NAME="$(git symbolic-ref -q HEAD)"
        if [[ -n $BRANCH_NAME || `pwd` != $(git rev-parse --show-toplevel) ]]; then
            echo ""
        else
            echo "$(__git_ps1 '%s' | sed -e 's/^(//' -e 's/)$//')"
        fi
    fi
}
