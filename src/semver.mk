.PHONY: version-up

Description.SEMVER-MK:=##@semver-mk This file contains some helpers for defining the semantic version of your project. Since we include the build type in the version, this also defines the BUILD-TYPE variable

PUSH-ON-VERSION:=false##@semver-mk When true, the repo will be automatically pushed on version increment

define LoadCurrentVersion##@semver-mk Call this function to create the CURRENT-VERSION variable which will contain the current instance version from package.json
$(eval CURRENT-VERSION=$(shell node -p "require('./${PACKAGEJSON-FILE}').version"))
endef

version-up:fix-line-endings ##@semver-mk This is the recipe to up the version number. Set the variables as necessary and run this.
	$(call start-msg,Updating version number)
	$(eval NEW_VERSION=$(shell node -p "let v = require('./${PACKAGEJSON-FILE}'); \
		v.version = require('semver').inc(v.version, '${VERSION-TYPE}', '${VERSION-SUFFIX}'); \
		let fs = require('fs'); \
		fs.writeFileSync('./${PACKAGEJSON-FILE}', JSON.stringify(v, null, 2)); \
		v.version;"))
	$(call show-msg,Updated to ${NEW_VERSION})
	$(call show-msg,Committing changes)
	@${GIT} add .
	@-${GIT} commit -a -m "Creating version ${NEW_VERSION}"
	$(call show-msg,Tagging repository with ${NEW_VERSION})
	@-${GIT} tag -a "v${NEW_VERSION}" -m "v${NEW_VERSION}"
ifeq (${PUSH-ON-VERSION},true)
	$(call show-msg,Pushing to git origin)
	@${GIT} push
endif
	$(call end-msg,Updating version number)

