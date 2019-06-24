Description.EJSFILE-MK:=##@ejsfile-mk Got some ejs or other template files you want to accompany your code? This is the right place.

EJS-TEMPLATES-DIR ?= templates##@ejsfile-mk The directory under the src directory where we will find the templates
EJS-EXTENSION ?= ejs##@ejsfile-mk So maybe you want to use another templting system? Set the extension here.
EJS-FILES := $(shell ${FIND} ${SRC-DIR}/ -type f -name "**.${EJS-EXTENSION}")
EJS-FILES-OUT := $(subst ${SRC-DIR}/,${OUT-DIR}/,${EJS-FILES})
EJS-OUT := ${OUT-DIR}/${EJS-TEMPLATES-DIR}/%.ejs##@ejsfile-mk This is the full output, use this ariable in your build dependencies

${EJS-OUT}: ${SRC-DIR}/${EJS-TEMPLATES-DIR}/%.${EJS-EXTENSION}
	${call show-msg,Copying $< => $@}
	@${MKDIRP} $(@D)
	${COPY} $< $@