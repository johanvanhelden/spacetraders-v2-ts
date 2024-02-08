.DEFAULT_GOAL := sdk
NODE_VERSION ?= lts/*

.PHONY: build
build: package.json
	@make set-nvm

	@npm install
	@npm run build

	@make set-nvm-default

.PHONY: ci-build
ci-build: package.json package-lock.json
	@# We assume that the proper node version has already been set in the GH Actions

	@npm ci
	@npm run build

.PHONY: ci-publish
ci-publish: package.json package-lock.json
	@npm publish

.PHONY: ci-audit
ci-audit: package.json package-lock.json
	@npm audit

.PHONY: sdk
sdk:
	docker run --user $$(id -u):$$(id -g) --rm -v "$${PWD}:/local" openapitools/openapi-generator-cli generate \
	-p npmName="spacetraders-v2-ts",npmVersion="2.0.0",supportsES6=true,withSeparateModelsAndApi=true,modelPackage="models",apiPackage="api" \
	-g typescript-axios \
	-o local/ \
	-i https://stoplight.io/api/v1/projects/spacetraders/spacetraders/nodes/reference/SpaceTraders.json?fromExportButton=true&snapshotType=http_service&deref=optimizedBundle \

.PHONY: set-nvm
set-nvm:
	@[ -f ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh && nvm install ${NODE_VERSION} && nvm use ${NODE_VERSION}

.PHONY: set-nvm-default
set-nvm-default:
	@[ -f ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh && nvm use default
