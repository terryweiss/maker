LIBDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
include ${LIBDIR}/make.docs.mk
include ${LIBDIR}/apps.mk
include ${LIBDIR}/clean.mk
include ${LIBDIR}/info.mk
include ${LIBDIR}/project.mk
include ${LIBDIR}/semver.mk


