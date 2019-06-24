# README:
## Introduction
These are a series of makefile snippets, useful for different kinds of projects

# api-mk:
## Description
When you have a swagger file, you may want to make it available from the API so that others can create clients based on the definition
## SWAGGER-FILE
This is the name of your api file. It can be JSON or YAML, but really the makefile won't care 
## SWAGGER-OUT-DIR
The directoory where you will be serving static assets
## SWAGGER-OUT
This is the dependency definition. Add this to your build line to trigger the swagger file copy

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
## BABEL
Bable for compiling ES(X) code to JS
## REPORT-TIME
When running some compilations, the system will call the `time` program when running to see what is going on. This must be `true` for that to happen
## TIME
Long running tasks will be `time`d to track performance if REPORT-TIME is true

# clean-mk:
## Description
Recipes for cleaning up after yourself
## clean
Clean up the out dir by deleting everything in it
## dist-clean
Clean up the out dir *and* the node_modules directory by deleting everything in it

# docker-mk:
## Description
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

# ejsfile-mk:
## Description
Got some ejs or other template files you want to accompany your code? This is the right place.
## EJS-TEMPLATES-DIR
The directory under the src directory where we will find the templates
## EJS-EXTENSION
So maybe you want to use another templting system? Set the extension here.
## EJS-OUT
This is the full output, use this ariable in your build dependencies

# info-mk:
## print-var-
This is a debugging tool. It allows you to see the value of any variable in the makefile by appending it to this like so: make print-var-HSCONFIG

# js-mk:
## JS-OUT
Add this to your build dependencies

# make-docs-mk:
## help
Show this help.
## help-to-md
Create a markdown file of the makefile help

# models-mk:
## Description
Tools for converting json-schema to typescript models
## MODEL-SRC-DIR
The directory where to find the json-schema definitions
## MODEL-OUT-DIR
The directory where you want to write the output
## MODEL-EXT
The extension to look for in MODEL-SRC-DIR. Can be yaml, yml, json.
## MODEL-OUT
The dependecy definition. Add this to your build to include it in the build

# project-mk:
## Description
Tools for working with package.json and other meta information around the project directory
## OUT-DIR
The output directory for the build
## SRC-DIR
Where to find source files
## BUILD_TYPE
Can be one of dev, prod, or stage. It is used to deploy artifacts (the ones that use it are locally documented) and to name a version number
## VERSION-TYPE
The version type speficies what portion of the build number will be incremented. Standard choices are `preminor` for prod (0.X.0), `prepatch` for staging (0.0.X) and `prelease` for dev (0.0.0-dev.X)
## VERSION-SUFFIX
The string that gets appended to the version (0.0.0-XXXX.0)
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

# semver-m:
## PUSH-ON-VERSION
When true, the repo will be automatically pushed on version increment

# semver-mk:
## Description
This file contains some helpers for defining the semantic version of your project. Since we include the build type in the version, this also defines the BUILD-TYPE variable
## define
Call this function to create the CURRENT-VERSION variable which will contain the current instance from package.json
## version-up
This is the recipe to up the version number. Set the variables as necessary and run this.

# ts-mk:
## Description
Recipes for compiling typescript 
## BUILD-TS
Use this to define a build dependency
## TS-DECLARE
When true, a declaration file will be generated for each module
## Description
Recipes for compiling javascript via babel

