NAME=middleman_base
VERSION=2.3

build:
	docker build -t ${NAME} .

shell: build
	docker run --rm -it ${NAME} bash

test: build
	docker run --rm -it ${NAME}

release:
	git commit -av -e -m "Upgrade to Ruby ${VERSION}" && \
	git tag -f ${VERSION} && \
	git push && \
	git push --tags -f
