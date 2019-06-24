Description.STATIC-MK:=##@static-mk Move static files from wherever to wherever

STATIC-IN-DIR ?= ${SRC-DIR}/static##@static-mk The directory where we will find the static files
STATIC-OUT-DIR ?= ${OUT-DIR}/public##@static-mk The directory where we will put the static files

STATIC-ASSETS := $(patsubst ${STATIC-IN-DIR}/%, ${STATIC-OUT-DIR}/%, $(wildcard ${STATIC-IN-DIR}/*))##@static-mk This the dependencies to add to your build statement
#STATIC-OUT := ${STATIC-OUT-DIR}/%

${STATIC-ASSETS}: ${STATIC-IN-DIR}/%
	${call show-msg,Copying $< => $@}
	@${MKDIRP} $(@D)
	${COPY} $< $@