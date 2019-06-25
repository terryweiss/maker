
Description.DOCKER-MK:=##@docker-mk Recipes for dealing with docker containers and publications

DOCKER-REGISTRY-URL ?= registry.concorde2000.com:5000##@docker-mk This is the name of the docker repository to publish containers to
DOCKER-NAME ?= iAmNotARrepo##@docker-mk This is the name of the container that is being published.
DOCKER-PUBLISH-LATEST ?= false##@docker-mk Should the docker container also get the "latest" tag? This can be helpful when setting up a container that is being tested or evaluated before being committed to
DOCKER-FILE ?= .##@docker-mk The path to the docker file

DOCKER-DC-PROD-SERVER ?= nowhere##@docker-mk The name of the server to deploy your docker compose production file to. Use ssh syntax. To automatically capture the current version number, make package.json/version = {{version}}
DOCKER-DC-STAGE-SERVER ?= nowhere##@docker-mk The name of the server to deploy your docker compose staging file to. Use ssh syntax.To automatically capture the current version number, make package.json/version = {{version}}
DOCKER-DC-DEV-SERVER ?= nowhere##@docker-mk The name of the server to deploy your docker compose development file to. Use ssh syntax. To automatically capture the current version number, make package.json/version = {{version}}
DOCKER-DC-EXT ?= yml ##@docker-mk The extension of your local docker-compose file

build-container:##@docker-mk Build a docker container
	$(eval THIS_VERSION=$(shell node -p "let v = require('./package.json');v.version;"))
ifeq (${DOCKER-PUBLISH-LATEST},true)
	${call start-msg,Building Docker container ${DOCKER-NAME}:latest}
	@${DOCKER} build ${DOCKER-FILE} -t ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:latest
	${call end-msg,Building Docker container ${DOCKER-NAME}:latest}
endif
	${call start-msg,Building Docker container ${DOCKER-NAME}:${THIS_VERSION}}
	@${DOCKER} build ${DOCKER-FILE} -t ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:${THIS_VERSION}
	${call end-msg,Building Docker container ${DOCKER-NAME}:${THIS_VERSION}}

publish-container: build-container##@docker-mk Publish a container to the docker repo
	$(eval THIS_VERSION=$(shell node -p "let v = require('./package.json');v.version;"))
ifeq (${DOCKER-PUBLISH-LATEST},true)
	${call start-msg,Publishing Docker container ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:latest}
	@${DOCKER} push ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:latest
	${call end-msg,Publishing Docker container ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:latest}
endif
	${call start-msg,Publishing Docker container ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:${THIS_VERSION}}
	@${DOCKER} push ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:${THIS_VERSION}
	${call end-msg,Publishing Docker container ${DOCKER-REGISTRY-URL}/${DOCKER-NAME}:${THIS_VERSION}}

deploy-dc:##@docker-mk Deploys your docker-compose file to the server you specify. Set DOCKER-DC-<build type>-SERVER and BUILD_TYPE and go for it
	$(eval THIS_VERSION=$(shell node -p "let v = require('./package.json');v.version;"))
ifeq (${BUILD_TYPE},prod)
	${call show-msg,Pushing ./docker-compose.${BUILD_TYPE}.yml:${THIS_VERSION} to ${DOCKER-DC-PROD-SERVER}/etc/concorde/docker-compose.yaml}
	@${SCP} ./docker-compose.${BUILD_TYPE}.${DOCKER-DC-EXT} ${DOCKER-DC-PROD-SERVER}/etc/concorde/docker-compose.yaml
	@${SSH} -t ${DOCKER-DC-PROD-SERVER} ${SED} -i -e s/{{version}}/${THIS_VERSION}/ /etc/concorde/docker-compose.yaml
else
ifeq (${BUILD_TYPE},stage)
	${call show-msg,Pushing ./docker-compose.${BUILD_TYPE}.yml:${THIS_VERSION} to ${DOCKER-DC-STAGE-SERVER}/etc/concorde/docker-compose.yaml}
	@${SCP} ./docker-compose.${BUILD_TYPE}.${DOCKER-DC-EXT} ${DOCKER-DC-STAGE-SERVER}:/etc/concorde/docker-compose.yaml
	@${SSH} -t ${DOCKER-DC-STAGE-SERVER} ${SED} -i -e s/{{version}}/${THIS_VERSION}/ /etc/concorde/docker-compose.yaml
else
	${call show-msg,Pushing ./docker-compose.${BUILD_TYPE}.yml:${THIS_VERSION} to ${DOCKER-DC-DEV-SERVER}/etc/concorde/docker-compose.yaml}
	@${SCP} ./docker-compose.${BUILD_TYPE}.${DOCKER-DC-EXT} ${DOCKER-DC-DEV-SERVER}:/etc/concorde/docker-compose.yaml
	@${SSH} -t ${DOCKER-DC-DEV-SERVER} ${SED} -i -e s/{{version}}/${THIS_VERSION}/ /etc/concorde/docker-compose.yaml
endif
endif
