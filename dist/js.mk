Description.TS-MK:=##@js-mk Recipes for compiling javascript via babel

JS-IN-PATTERN = ${SRC-DIR}/%.js
JS-OUT := $(patsubst ${SRC-DIR}/%.js, ${OUT-DIR}/%.js, $(wildcard ${SRC-DIR}/*.js))##@js-mk Add this to your build dependencies

${JS-OUT}: ${JS-IN-PATTERN}
	${call show-msg,Compiling $< => $@}
	@${MKDIRP} $(@D)	
	@${TIME} ${BABEL} -o $(@D) -i $<


