MAKEFLAGS += --no-print-directory
CONFIGS := $(shell ls .dotbot/configs | sd '.yaml' '')
PROFILES := $(shell ls .dotbot/profiles)

all:
ifeq ($(shell uname), Darwin)
	@make macos
else
	@make linux
endif

mac: macos

submodule:
	@echo "Updating submodules"
	@git submodule update --init --recursive --remote

$(CONFIGS): submodule
	@.dotbot/install-config $@

$(PROFILES): submodule
	@.dotbot/install-profile $@
