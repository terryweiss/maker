Description.APP-MK:=##@apps-mk These are the global commands the make system understands. These are all overrideable, so if for instance you want to use `yarn` instead of `npm`, you can overide `NPM=yarm` and et viola.

FIND ?= /usr/bin/find##@apps-mk Be careful with this one if you are in windows. It expects linux `find` not CMD `find` and you may need to update the path to your local cygwin instance
NPM ?= npm##@apps-mk NPM executable
RM ?= rm##@apps-mk The delete command
MKDIR ?= mkdir##@apps-mk The command to make directories
MKDIRP ?= mkdir -p##@apps-mk The beloved `mkdir -p`
COPY ?= cp##@apps-mk Copy command
TOUCH ?= touch##@apps-mk Touch command
TSC ?= node_modules/.bin/tsc##@apps-mk The TypeScript compiler specifying the module system and the source library
DOCKER ?= docker##@apps-mk The docker CLI executable
PERL ?= perl##@apps-mk PERL is used to generate these docs
JSM ?= jsm##@apps-mk The Javascript Module Schema package
GIT ?= git##@apps-mk GIT cli
RMDIR ?= rm -Rf##@apps-mk rimraf, delete an entire directory
SCP ?= scp##@apps-mk Secure Copy over ssh
SSH ?= ssh##@apps-mk ssh. 'nuff said
SED ?= sed##@apps-mk sed - mostly used when applying the current version to the docker-compose remotely
BABEL ?= babel##@apps-mk Bable for compiling ES(X) code to JS
TSDOCS ?= node_modules/.bin/typedoc ##@apps-mk The path to the typedoc executable
JSM ?= jsm##@apps-mk The json schema model generator

REPORT-TIME ?= false##@apps-mk When running some compilations, the system will call the `time` program when running to see what is going on. This must be `true` for that to happen

ifeq (${REPORT-TIME},true)
TIME ?= time##@apps-mk Long running tasks will be `time`d to track performance if REPORT-TIME is true
else
TIME :=
endif
