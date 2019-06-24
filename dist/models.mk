Description.MODELS-MK:=##@models-mk Tools for converting json-schema to typescript models

MODEL-SRC-DIR ?= models##@models-mk The directory where to find the json-schema definitions
MODEL-OUT-DIR ?= ${SRC-DIR}/models##@models-mk The directory where you want to write the output
MODEL-EXT ?= yaml##@models-mk The extension to look for in MODEL-SRC-DIR. Can be yaml, yml, json.
MODEL-OUT := ${SRC-DIR}/${MODEL-SRC-DIR}/%.ts##@models-mk The dependecy definition. Add this to your build to include it in the build


MODEL-FILES := $(shell ${FIND} ${MODEL-SRC-DIR}/ -type f -name "*.${MODEL-EXT}*")
MODEL-FILES-OUT := $(MODEL-FILES:.${MODEL-EXT}=.ts)
MODEL-FILES-OUT := $(subst ${MODEL-SRC-DIR}/,${MODEL-OUT-DIR}/,${MODEL-FILES-OUT})

${MODEL-OUT}:
	${call start-msg,Creating models ${MODEL-SRC-DIR} => ${MODEL-OUT-DIR}}
	${JSM} --log-level=info -f "${MODEL-SRC-DIR}/*.${MODEL-EXT}" -o ${MODEL-OUT-DIR}
	${MAKE} build-ts
	${call end-msg,Creating models ${MODEL-SRC-DIR} => ${MODEL-OUT-DIR}}

build-ts:${TS-OUT}#This rule allows the to-compile list to be revaluated after the models have been created.