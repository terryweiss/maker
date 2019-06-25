.PHONY: help help-to-md

.DEFAULT_GOAL :=
.DEFAULT_GOAL := help

Description.MAKEFILE-DOCS.:=##@make-docs-mk: Document generation engine for `makefile` recipes and variables

HELP-DEFINITION  := $(shell tput setaf 15)
HELP-CATEGORY  := $(shell tput setaf 13)
HELP-TERM := $(shell tput setaf 87)
HELP-RESET := $(shell tput setaf sgr0)
HELP-SUNDERLINE := $(shell tput smul)
HELP-EUNDERLINE := $(shell tput rmul)

BUILD-DESCRIPTION ?= BUILD.md ##@make-docs-mk: A markdown file to be included in the docs for the project that contains the details of a make environment. You can use this as a build dependency

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category
HELP_RENDER = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-\_]+)\s*:?.*\#\#(?:@([a-zA-Z\-\_]+))?\s(.*)$$/ }; \
    print "usage: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${HELP-SUNDERLINE}${HELP-CATEGORY}$$_:${HELP-RESET}${HELP-EUNDERLINE}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (30 - length $$_->[0]); \
    print "  ${HELP-TERM}$$_->[0]${HELP-RESET}\n\t${HELP-DEFINITION}$$_->[1]${HELP-RESET}\n"; \
    };  \
    print "\n"; }


help:##@make-docs-mk Show this help.
	@$(PERL) -e '$(HELP_RENDER)' $(MAKEFILE_LIST)


 HELP_RENDER_MD = \
    $(info \# Building) \
    $(info This project is built using [GNU make](https://www.gnu.org/software/make/manual/html_node/index.html). Get it from the usual channels. The `makefile` included here provides the following verbs:) \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-\_]+)\s*:?.*\#\#(?:@([a-zA-Z\-\_]+))?\s(.*)$$/ }; \
    for (sort keys %help) { \
    print "\#\# File: $$_:\n\n| Var/Verb | Description  |\n|---|---|\n"; \
    for (@{$$help{$$_}}) { \
    print "| $$_->[0] | $$_->[1]\n"; \
    }; \
    print "\n"; }

help-to-md: ##@make-docs-mk Create a markdown file of the makefile help
	@$(PERL) -e '$(HELP_RENDER_MD)' $(MAKEFILE_LIST) 

${BUILD-DESCRIPTION}:
#     $(MAKE) help-to-md ${BUILD-DESCRIPTION}

