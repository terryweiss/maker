Description.TS-MK:=##@tsdocs-mk Recipes for creating ts technical docs

TYPEDOC-CONFIG-FILE ?= typedoc.js##@tsdocs-mk The typedocs config file
DOCS-OUT ?= docs##@tsdocs-mk The directory where the docs will be generated. This is the build dependency
HTML-DOCS-DIR ?= ${DOCS-OUT}/html##@tsdocs-mk The directory where to place HTML documentation. If blank, it will not be generated
MD-DOCS-DIR ?= ${DOCS-OUT}/md##@tsdocs-mk The directory where to place markdown documentation. If blank, it will not be generated

${DOCS-OUT}: ${SOURCE-TS-FILES} makefile ${README-FILE} ${PACKAGEJSON-FILE} ${TYPEDOC-CONFIG-FILE} ${BUILD-DESCRIPTION-OUT}
ifneq (${HTML-DOCS-DIR},)
	@${TIME} ${TSDOCS} --out ${HTML-DOCS-DIR} --options ${TYPEDOC-CONFIG-FILE} --includes ./  ${SRC-DIR}
endif
ifneq (${MD-DOCS-DIR},)
	@${TIME} ${TSDOCS} --out ${MD-DOCS-DIR} --options ${TYPEDOC-CONFIG-FILE} --theme markdown --includes ./ ${SRC-DIR}
endif
	${call show-msg,Copying ${BUILD-DESCRIPTION} ${MD-DOCS-DIR}}
	@${COPY} ${BUILD-DESCRIPTION} ${MD-DOCS-DIR}
	@${TOUCH} -m ${DOCS-OUT}
	@${TOUCH} -m ${MD-DOCS-DIR}
	@${TOUCH} -m ${HTML-DOCS-DIR}


clean::
	${call show-msg,Cleaning ${DOCS-OUT}}
	@${RMDIR} ${DOCS-OUT}*
