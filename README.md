# README:
## Introduction
These are a series of makefile snippets, useful for different kinds of projects

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

# make-docs-mk:
## help
Show this help.
## help-to-md
Create a markdown file of the makefile help

