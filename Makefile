# EOL has comment to prevent erroneous whitespace in variables
IMAGE = zip#
DOCKER_HUB_USERNAME = joshkeegan#
IMAGE_URL = $(DOCKER_HUB_USERNAME)/$(IMAGE)#

.PHONY: clean
clean:
	rm -r artefacts || true
	mkdir artefacts

# Args
#	- params: optional. Additional params to pass to buildx
.PHONY: build
build: clean get-version-number
	docker buildx build \
		--platform linux/amd64,linux/arm/v7,linux/arm64 \
		--no-cache \
		--pull $(params) \
		-t $(IMAGE_URL):`cat artefacts/version`\
		-t $(IMAGE_URL):latest \
		.

.PHONY: get-version-number
get-version-number:
# Get the version number from the version of the base image
#	e.g. a base of alpine:3.12.0 would have version number 3.12.0
	export MSYS_NO_PATHCONV=1 && \
		docker run \
			--rm \
			-v ${PWD}:/app:ro \
			jess/dockfmt:v0.3.3 \
			base \
			/app/Dockerfile \
		| awk 'NR > 1 { split($$1, a, ":"); split(a[2], b, "-"); printf "%s", b[1] }' \
		> artefacts/version

	echo `cat artefacts/version`

.PHONY: publish
publish: params=--push
publish: build