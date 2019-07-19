MODEL-DIR ?= models##@jsm-mk Where to find the schema files
MODEL-EXT ?= yaml##@jsm-mk The extenion of your schema files
MODEL-OUT-DIR ?= ${SRC-DIR}/${MODEL-DIR}##@jsm-mk Where to put output

MODEL-FILES := $(shell ${FIND} ${MODEL-DIR}/ -type f -name "*.${MODEL-EXT}")
MODEL-FILES-OUT := $(MODEL-FILES:.${MODEL-EXT}=.ts)
MODEL-FILES-OUT := $(subst ${MODEL-DIR}/,${MODEL-OUT-DIR}/,${MODEL-FILES-OUT})

MODEL-SRC ?= ${MODEL-DIR}/%.${MODEL-EXT}
MODEL-OUT ?= ${MODEL-OUT-DIR}/%.ts##@jsm-mk This is the output pattern

gen-models: ${MODEL-OUT}##@jsm-mk This is the dependency for the build recipe

${MODEL-OUT}:
	${JSM} --log-level=trace -i "${MODEL-DIR}/**.${MODEL-EXT}" -o ${MODEL-OUT-DIR}
	-$(MAKE) BUILD-TS
