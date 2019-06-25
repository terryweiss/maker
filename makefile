.PHONY: build publish

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


build: ${SOURCE-STATIC-FILES-OUT}

publish: publish-npm
