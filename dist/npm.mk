

publish-npm: ${OUT-DIR}/${README-FILE} ${OUT-DIR}/${PACKAGEJSON-FILE}
	$(call LoadCurrentVersion)
	$(call show-msg,Publishing ${CURRENT-VERSION})
#	@${COPY} ./${README-FILE} ${OUT-DIR}/${README-FILE}
#	@${COPY} ./${PACKAGEJSON-FILE} ${OUT-DIR}/${PACKAGEJSON-FILE}
	@cd ${OUT-DIR} && ${NPM} publish --access=public
