include ../env.sh

IMAGE_NAME=dev-matter
VERSION=latest

all : build

build: 
	docker build --tag ${IMAGE_NAME}:${VERSION} .
	#docker build --no-cache --tag ${IMAGE_NAME}:${VERSION} .

push:
	docker tag ${IMAGE_NAME}:${VERSION} ${DOCKER_PRIVATE}/${IMAGE_NAME}:${VERSION}
	docker push ${DOCKER_PRIVATE}/${IMAGE_NAME}:${VERSION}
