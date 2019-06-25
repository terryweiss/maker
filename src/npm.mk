

publish-npm: ${README-FILE-OUT} ${PACKAGEJSON-OUT}
	$(call LoadCurrentVersion)
	$(call show-msg,Publishing ${CURRENT-VERSION})
	@cd ${OUT-DIR} && ${NPM} publish --access=public
