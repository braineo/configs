TARGET ?=


# Colors
end:=$(shell echo "\033[0m")
black=$(shell echo "\033[0;30m")
blackb=$(shell echo "\033[1;30m")
white=$(shell echo "\033[0;37m")
whiteb=$(shell echo "\033[1;37m")
red:=$(shell echo "\033[0;31m")
redb=$(shell echo "\033[1;31m")
green=$(shell echo "\033[0;32m")
greenb=$(shell echo "\033[1;32m")
yellow=$(shell echo "\033[0;33m")
yellowb=$(shell echo "\033[1;33m")
blue=$(shell echo "\033[0;34m")
blueb=$(shell echo "\033[1;34m")
purple=$(shell echo "\033[0;35m")
purpleb=$(shell echo "\033[1;35m")
lightblue=$(shell echo "\033[0;36m")
lightblueb=$(shell echo "\033[1;36m")

.PHONY: all
all: help

.PHONY: install
install: check-TARGET
	stow --verbose=1 -R ${TARGET} -t ${HOME}

define help_string
Usage:

  ${blue}Install various configurations for tool:${end}

    make TARGET=git install

    replace git to other tools like zsh, flake8
endef
export help_string
.PHONY: help
help:
	@echo "$$help_string"

check-%:
	 @if [ "${${*}}" = "" ]; then \
		echo "${red}Environment variable ${yellow}$* ${red}not set${end}"; \
		exit 1; \
	fi
