

publish-npm: ${OUT-DIR}/${README-FILE} ${OUT-DIR}/${PACKAGEJSON-FILE}
	$(call LoadCurrentVersion)
	$(call show-msg,Publishing ${CURRENT-VERSION})
	@cd ${OUT-DIR} && ${NPM} publish --access=public
