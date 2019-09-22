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
	@.dotbot/install-config $@

$(PROFILES):
	@.dotbot/install-profile $@
