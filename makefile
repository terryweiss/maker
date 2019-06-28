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

build: ./${BUILD-DESCRIPTION} ${SOURCE-STATIC-FILES-OUT}## Create the dist directory and copy the files into it
	${call LoadCurrentVersion}
	@-${GIT} add .
	@-${GIT} commit -m "Built ${CURRENT-VERSION}"

publish: publish-npm## Publish this to the current


release:## Release a version of the system to NPM. This will version up the patch number and go from there
	@${MAKE} -e VERSION-TYPE=patch -e VERSION-SUFFIX= version-up clean build publish

release-prod:## Release a production version of the system to NPM. This will version up the minor numberm build and then publish
	@${MAKE} -e BUILD_TYPE=prod -e VERSION-TYPE=minor -e VERSION-SUFFIX= version-up clean build publish
