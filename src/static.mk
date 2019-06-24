Description.STATIC-MK:=##@static-mk Move static files from wherever to wherever

STATIC-IN-DIR ?= ${SRC-DIR}/static##@static-mk The directory where we will find the static files
STATIC-OUT-DIR ?= ${OUT-DIR}/public##@static-mk The directory where we will put the static files

SOURCE-STATIC-FILES := $(shell ${FIND} ${STATIC-IN-DIR}/ -type f -name "**")
SOURCE-STATIC-FILES-OUT := $(subst ${STATIC-IN-DIR}/,${STATIC-OUT-DIR}/,${SOURCE-STATIC-FILES})##@static-mk This the dependencies to add to your build statement

#STATIC-OUT := $(patsubst ${STATIC-IN-DIR}/%, ${STATIC-OUT-DIR}/%, $(wildcard ${STATIC-IN-DIR}/*))##@static-mk This the dependencies to add to your build statement
STATIC-OUT:=${STATIC-OUT-DIR}/%
STATIC-IN:=${STATIC-IN-DIR}/%

${STATIC-OUT}: ${STATIC-IN}
	${call show-msg,Copying $< => $@}
	@${MKDIRP} $(@D)
	@${COPY} $< $@
