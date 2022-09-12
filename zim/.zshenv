export GO111MODULE=on
export PATH="$HOME/go/bin:$PATH"
GOPATH=${GOPATH:-$HOME/go}

. "$HOME/.cargo/env"

# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install
