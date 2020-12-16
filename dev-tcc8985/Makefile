include ../env.sh

IMAGE_NAME=dev-tcc8985
VERSION=latest

all : build

build: 
	docker build --no-cache --tag ${IMAGE_NAME}:${VERSION} .

push:
	docker tag ${IMAGE_NAME}:${VERSION} ${DOCKER_PRIVATE}/${IMAGE_NAME}:0.1
	docker push ${DOCKER_PRIVATE}/${IMAGE_NAME}:0.1
