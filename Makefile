# EOL has comment to prevent erroneous whitespace in variables
IMAGE = zip#
DOCKER_HUB_USERNAME = joshkeegan#
IMAGE_URL = $(DOCKER_HUB_USERNAME)/$(IMAGE)#

clean:
	rm -r artefacts || true
	mkdir artefacts

build:
	docker build --no-cache --pull -t $(IMAGE_URL):dev .

tag: clean build get-version-number
	docker tag $(IMAGE_URL):dev $(IMAGE_URL):`cat artefacts/version`
	docker tag $(IMAGE_URL):dev $(IMAGE_URL):latest

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

publish:
	docker push $(IMAGE_URL):`cat artefacts/version`
	docker push $(IMAGE_URL):latest