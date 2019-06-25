Description.PROJECT-MK:=##@project-mk Tools for working with package.json and other meta information around the project directory

OUT-DIR ?= dist##@project-mk The output directory for the build
SRC-DIR ?= src##@project-mk Where to find source files
BUILD_TYPE ?= dev##@project-mk Can be one of dev, prod, or stage. It is used to deploy artifacts (the ones that use it are locally documented) and to name a version number

ifeq (${BUILD_TYPE},prod)
VERSION-TYPE ?= preminor##@project-mk The version type speficies what portion of the build number will be incremented. Standard choices are `preminor` for prod (0.X.0), `prepatch` for staging (0.0.X) and `prelease` for dev (0.0.0-dev.X)
VERSION-SUFFIX ?= prod##@project-mk The string that gets appended to the version (0.0.0-XXXX.0)
else
ifeq (${BUILD_TYPE},stage)
VERSION-TYPE ?= prepatch
VERSION-SUFFIX ?= stage
else
VERSION-TYPE ?= prerelease
VERSION-SUFFIX ?= dev
endif
endif

PACKAGEJSON-FILE ?= package.json##@project-mk The name and location of the package.json file.
LIB ?= node_modules##@project-mk The location of the node_modules directory. Use this var to specify your build depdency

PACKAGEJSON-OUT = ${OUT-DIR}/${PACKAGEJSON-FILE}##@project-mk The build target for package.json. Use this var to specify your build depdency
README-FILE ?= README.md##@project-mk The name of your readme file
README-FILE-OUT = ${OUT-DIR}/${README-FILE}##@project-mk The build target for the readme file. Use this var to specify your build depdency

${LIB}: ${PACKAGEJSON-FILE}
	${call start-msg,Installing depenedencies}
	@${TIME} ${NPM} install
	${call show-msg,Applying NPM audit}
	@${TIME} ${NPM} audit fix
	@${TOUCH} -m ${LIB}
	${call end-msg,Installing depenedencies}

${PACKAGEJSON-OUT}: ${PACKAGEJSON-FILE}
	${call show-msg,Copying ${PACKAGEJSON-FILE} => ${OUT-DIR}/${PACKAGEJSON-FILE}}
	@${COPY} ${PACKAGEJSON-FILE} ${OUT-DIR}/${PACKAGEJSON-FILE}


${README-FILE-OUT}: ${README-FILE}
	${call show-msg,Copying ${README-FILE} => ${OUT-DIR}/${README-FILE}}
	@${COPY} ${README-FILE} ${OUT-DIR}/${README-FILE}

