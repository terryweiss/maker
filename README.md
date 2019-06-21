# MakeFileDocs:
## help
Show this help.

# apps-mk:
## APPS-MK
These are the global commands the make system understands. These are all overrideable, so if for instance you want to use `yarn` instead of `npm`, you can overide `NPM=yarm` and et viola.
## BUILD_TYPE
dev, prod, or stage. 
## FIND
Be careful with this one if you are in windows. It expects linux `find` not CMD `find` and you may need to update the path to your local cygwin instance
## NPM
NPM executable
## RM
The delete command
## MKDIR
The command to make directories
## MKDIRP
The beloved `mkdir -p`
## COPY
Copy command
## TOUCH
Touch command
## TSC
The TypeScript compiler specifying the module system and the source library
## DOCKER
The docker CLI executable 
## PERL
PERL is used to generate these docs
## JSM
The Javascript Module Schema package
## GIT
GIT cli
## RMDIR
rimraf, delete an entire directory
## SCP
Secure Copy over ssh
## SSH
ssh. 'nuff said
## SED
sed - mostly used when applying the current version to the docker-compose remotely
## REPORT-TIME
When running some compilations, the system will call the `time` program when running to see what is going on. This must be `true` for that to happen
## TIME
Long running tasks will be `time`d to track performance if REPORT-TIME is true

# build-mk:
## BUILD-MK
Tools for the build process
## OUT-DIR
The output directory for the build
## SRC-DIR
Where to find source files

# clean-mk:
## CLEAN-MK
Recipes for cleaning up after yourself
## clean
Clean up the out dir by deleting everything in it
## dist-clean
Clean up the out dir *and* the node_modules directory by deleting everything in it

# docker-mk:
## DOCKER-MK
Recipes for dealing with docker containers and publications
## DOCKER-REGISTRY-URL
This is the name of the docker repository to publish containers to
## DOCKER-NAME
This is the name of the container that is being published. 
## DOCKER-PUBLISH-LATEST
Should the docker container also get the "latest" tag? This can be helpful when setting up a container that is being tested or evaluated before being committed to
## DOCKER-FILE
The path to the docker file
## DOCKER-DC-PROD-SERVER
The name of the server to deploy your docker compose production file to. Use ssh syntax. To automatically capture the current version number, make package.json/version = {{version}}
## DOCKER-DC-STAGE-SERVER
The name of the server to deploy your docker compose staging file to. Use ssh syntax.To automatically capture the current version number, make package.json/version = {{version}}
## DOCKER-DC-DEV-SERVER
The name of the server to deploy your docker compose development file to. Use ssh syntax. To automatically capture the current version number, make package.json/version = {{version}}
## DOCKER-DC-EXT
The extension of your local docker-compose file
## build-container
Build a docker container
## publish-container
Publish a container to the docker repo
## deploy-dc
Deploys your docker-compose file to the server you specify. Set DOCKER-DC-<build type>-SERVER and BUILD_TYPE and go for it

# project-mk:
## PROJECT-MK
Tools for working with package.json and other meta information around the project directory
## PACKAGEJSON-FILE
The name and location of the package.json file.
## LIB
The location of the node_modules directory. Use this var to specify your build depdency
## PACKAGEJSON-OUT
The build target for package.json. Use this var to specify your build depdency
## README-FILE
The name of your readme file
## README-FILE-OUT
The build target for the readme file. Use this var to specify your build depdency

# semver-mk:
## BUILD_TYPE
Can be one of dev, prod, or stage. It is used to deploy artifacts (the ones that use it are locally documented) and to name a version number
## VERSION-TYPE
The version type speficies what portion of the build number will be incremented. Standard choices are `preminor` for prod (0.X.0), `prepatch` for staging (0.0.X) and `prelease` for dev (0.0.0-dev.X)
## VERSION-SUFFIX
The string that gets appended to the version (0.0.0-XXXX.0)

# ts-mk:
## TS-MK
Recipes for compiling typescript 
## BUILD-TS
Use this to define a build dependency
## TS-DECLARE
When true, a declaration file will be generated for each module
