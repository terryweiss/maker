
.DEFAULT_GOAL :=
.DEFAULT_GOAL := help

Description.MAKEFILE-DOCS.:=##@make-docs-mk: Document generation engine for `makefile` recipes and variables
Introduction:=##@README These are a series of makefile snippets, useful for different kinds of projects

HELP-DEFINITION  := $(shell tput setaf 15)
HELP-CATEGORY  := $(shell tput setaf 13)
HELP-TERM := $(shell tput setaf 87)
HELP-RESET := $(shell tput setaf sgr0)
HELP-SUNDERLINE := $(shell tput smul)
HELP-EUNDERLINE := $(shell tput rmul)


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
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-\_]+)\s*:?.*\#\#(?:@([a-zA-Z\-\_]+))?\s(.*)$$/ }; \
    for (sort keys %help) { \
    print "\# $$_:\n"; \
    for (@{$$help{$$_}}) { \
    print "\#\# $$_->[0]\n$$_->[1]\n"; \
    }; \
    print "\n"; }

help-to-md: ##@make-docs-mk Create a markdown file of the makefile help
	@$(PERL) -e '$(HELP_RENDER_MD)' $(MAKEFILE_LIST) 



