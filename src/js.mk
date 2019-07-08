Description.TS-MK:=##@js-mk Recipes for compiling javascript via babel


SOURCE-JS-FILES := $(shell ${FIND} ${SRC-DIR}/ -type f -name "**.js")
SOURCE-JS-FILES-OUT = $(SOURCE-JS-FILES:.js=.js)
SOURCE-JS-FILES-OUT := $(subst ${SRC-DIR}/,${OUT-DIR}/,${SOURCE-JS-FILES-OUT})

JS-OUT := ${OUT-DIR}/%.js
JS-IN := ${SRC-DIR}/%.js

${JS-OUT}: ${JS-IN}
	${call show-msg,Compiling $< => $@}
	@${MKDIRP} $(@D)
	@${TIME} ${BABEL} -o $@  $<


