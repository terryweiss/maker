.PHONY: build publish release

STATIC-IN-DIR:=src
STATIC-OUT-DIR:=dist

include src/common.mk
include ${LIBDIR}/api.mk
include ${LIBDIR}/docker.mk
include ${LIBDIR}/ejsfiles.mk
include ${LIBDIR}/models.mk
include ${LIBDIR}/ts.mk
include ${LIBDIR}/js.mk
include ${LIBDIR}/npm.mk
include ${LIBDIR}/static.mk
include ${LIBDIR}/tsdocs.mk

build: ./${BUILD-DESCRIPTION} ${SOURCE-STATIC-FILES-OUT}
	${call LoadCurrentVersion}
	@-${GIT} add .
	@-${GIT} commit -m "Built ${CURRENT-VERSION}"

publish: publish-npm


release:
	${MAKE} -e VERSION-TYPE=minor -e VERSION-SUFFIX= version-up clean build publish
