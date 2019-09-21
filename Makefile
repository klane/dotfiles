MAKEFLAGS += --no-print-directory
CONFIGS := $(shell ls meta/configs | sd '.yaml' '')
PROFILES := $(shell ls meta/profiles)

all:
ifeq ($(shell uname), Darwin)
	@make macos
else
	@make linux
endif

mac:
	@make macos

$(CONFIGS):
	./install-config $@

$(PROFILES):
	./install-profile $@
