include ../env.sh

IMAGE_NAME=ubuntu16_04_i386_slave
VERSION=latest

all : build

build:
	docker build --tag ${IMAGE_NAME}:${VERSION} .
	#docker build --no-cache --tag ${IMAGE_NAME}:${VERSION} .

