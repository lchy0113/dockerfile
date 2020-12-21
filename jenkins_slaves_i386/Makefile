include ../env.sh

IMAGE_NAME=ubunt16.04.i386.jenkins_slave
VERSION=latest

all : build

keys: .ssh/id_rsa

.ssh/id_rsa:
	mkdir -p .ssh
	cp ../jenkins_master/.ssh/* .ssh/
	cat .ssh/id_rsa.pub > .ssh/authorized_keys

#build: keys
build:
	docker build --no-cache --tag ${IMAGE_NAME}:${VERSION} .

