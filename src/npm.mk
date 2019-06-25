.PHONY: publish-npm

Description.NPM-MK:=##@npm-mk Tools for working with the npm repository

publish-npm: ${README-FILE-OUT} ${PACKAGEJSON-OUT}##@npm-mk This will call npm publish
	$(call LoadCurrentVersion)
	$(call show-msg,Publishing ${CURRENT-VERSION})
	@cd ${OUT-DIR} && ${NPM} publish --access=public
