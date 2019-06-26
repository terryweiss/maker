Description.API-MK:=##@api-mk When you have a swagger file, you may want to make it available from the API so that others can create clients based on the definition

SWAGGER-FILE ?= api.json##@api-mk This is the name of your api file. It can be JSON or YAML, but really the makefile won't care 
SWAGGER-OUT-DIR ?= ${OUT-DIR}/public##@api-mk The directoory where you will be serving static assets
SWAGGER-OUT := ${SWAGGER-OUT-DIR}/${SWAGGER-FILE}##@api-mk This is the dependency definition. Add this to your build line to trigger the swagger file copy

${SWAGGER-OUT-DIR}/${SWAGGER-FILE}: ${SWAGGER-FILE}
	${call show-msg,Copying ${SWAGGER-FILE} => ${SWAGGER-OUT-DIR}/${SWAGGER-FILE}}
	@${MKDIRP} ${SWAGGER-OUT-DIR}
	@${COPY} ${SWAGGER-FILE} ${SWAGGER-OUT-DIR}/${SWAGGER-FILE}