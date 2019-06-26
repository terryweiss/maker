.PHONY: watch

Description.TS-MK:=##@ts-mk Recipes for compiling typescript

SOURCE-TS-FILES := $(shell ${FIND} ${SRC-DIR}/ -type f -name "**.ts")
SOURCE-TS-FILES-OUT = $(SOURCE-TS-FILES:.ts=.js)
SOURCE-TS-FILES-OUT := $(subst ${SRC-DIR}/,${OUT-DIR}/,${SOURCE-TS-FILES-OUT})

TS-OUT := ${OUT-DIR}/%.js
TS-IN := ${SRC-DIR}/%.ts

BUILD-TS:=${SOURCE-TS-FILES-OUT}##@ts-mk Use this to define a build dependency
TS-DECLARE?=false##@ts-mk When true, a declaration file will be generated for each module

${TS-OUT}: ${TS-IN}
	${call show-msg,Compiling $< => $@}
	@${MKDIRP} $(@D)
	@${TIME} ${TSC} --target es2015 --lib 'ES2015' --module 'commonjs' --sourceMap --outDir $(@D) $<
ifeq (${TS-DECLARE},true)
	${call show-msg,Creating declaration for $< => $(@D)/$(*F).d.ts}
	@${TIME} tsc --declaration --lib 'ES2015' --module 'commonjs' --outDir $(@D) $<
endif

watch:##@ts-mk Wtahc the directory defined in the tsconfig.json file
	@${TSC} --watch
