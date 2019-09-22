MAKEFLAGS += --no-print-directory
CONFIGS := $(shell ls .dotbot/configs | sd '.yaml' '')
PROFILES := $(shell ls .dotbot/profiles)

all:
ifeq ($(shell uname), Darwin)
	@make macos
else
	@make linux
endif

mac:
	@make macos

$(CONFIGS):
	@make submodule
	@.dotbot/install-config $@

$(PROFILES):
	@make submodule
	@.dotbot/install-profile $@

submodule:
	@git submodule update --init --recursive --remote
