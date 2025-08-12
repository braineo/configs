TARGET ?=


# Colors
end:=$(shell tput -Txterm sgr0)
black=$(shell echo -e "\033[0;30m")
blackb=$(shell echo -e "\033[1;30m")
white=$(shell echo -e "\033[0;37m")
whiteb=$(shell echo -e "\033[1;37m")
red:=$(shell echo -e "\033[0;31m")
redb=$(shell echo -e "\033[1;31m")
green=$(shell echo -e "\033[0;32m")
greenb=$(shell echo -e "\033[1;32m")
yellow=$(shell echo -e "\033[0;33m")
yellowb=$(shell echo -e "\033[1;33m")
blue=$(shell tput -Txterm setaf 6)
blueb=$(shell echo -e "\033[1;34m")
purple=$(shell echo -e "\033[0;35m")
purpleb=$(shell echo -e "\033[1;35m")
lightblue=$(shell echo -e "\033[0;36m")
lightblueb=$(shell echo -e "\033[1;36m")

.PHONY: all
all: help

.PHONY: install
install: check-TARGET
	stow --verbose=1 --dotfiles -R ${TARGET} -t ${HOME}

.PHONY: remove
remove: check-TARGET
	stow --verbose=1 --dotfiles -D ${TARGET} -t ${HOME}

define help_string
Usage:

  ${blue}Install/uninstall various configurations for tool${end}
  Example:
    make TARGET=git install
    make TARGET=git remove

    replace git to other tools like oh-my-zsh, flake8
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
