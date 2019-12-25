# Colors
end:=$(shell echo -e "\033[0m")
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
blue=$(shell echo -e "\033[0;34m")
blueb=$(shell echo -e "\033[1;34m")
purple=$(shell echo -e "\033[0;35m")
purpleb=$(shell echo -e "\033[1;35m")
lightblue=$(shell echo -e "\033[0;36m")
lightblueb=$(shell echo -e "\033[1;36m")

.PHONY: all
all: help

define help_string
Usage:

  ${blue}Export/import tilix configurations${end}
  Example:
    ${green}Export tilix configurations to tilix.dconf${end}
    make export
    ${green}Import tilix configurations from tilix.dconf${end}
    make import

endef
export help_string
.PHONY: help
help:
	@echo "$$help_string"

.PHONY: export
export:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf

.PHONY: import
import:
	dconf load /com/gexperts/Tilix/ < tilix.dconf
