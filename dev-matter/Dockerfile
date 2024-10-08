# ====================================================================== #
# NXP Base SDK Docker Image. (Project XXX)
# ====================================================================== #


# Base image
# ====================================================================== #
FROM ubuntu:22.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"


# Update apt-get
RUN apt-get -y update

## Installing packages
RUN apt-get -y install \
		locales	\
		openssh-server \
		uuid \
		uuid-dev	\
		sudo	\
		git	\
		gcc	\
		g++	\
		pkg-config	\
		libssl-dev	\
		libdbus-1-dev	\
		libglib2.0-dev	\
		libavahi-client-dev	\
		ninja-build	\
		python3-venv	\
		python3-dev	\
		python3-pip	\
		zip	\
		unzip	\
		libgirepository1.0-dev	\
		libcairo2-dev	\
		libreadline-dev	\
		libsdl2-dev	\
		curl	\
 		openjdk-11-jdk \
		kotlin  

#	zlib1g-dev	\
#	liblz-dev	\
#	liblzo2-2	\
#	liblzo2-dev	\
#	lzop	\
#	git-core	\
#	curl	\
#	u-boot-tools	\
#	python	\
#	mtd-utils	\
#	openjdk-8-jdk	\
#	device-tree-compiler	\
#	gdisk	\
#	make	\
#	gcc	\
#	bc	\
#	m4 	\
#	ccache	\
#	zip	\
#	unzip	\
#	gnupg	\
#	flex	\
#	bison	\
#	gperf	\
#	build-essential	\
#	gcc-multilib	\
#	g++-multilib	\
#	libc6-dev-i386	\
#	lib32ncurses5-dev	\
#	x11proto-core-dev	\
#	libx11-dev	\ 
#	lib32z-dev	\
#	libgl1-mesa-dev	\
#	libxml2-utils	\
#	xsltproc	\
#	vim	\
#	usbutils	\
#	sudo	\
#	ctags	\
#	cscope	\
#	openssh-server \
#	locales	\
#	repo	\ 
#	figlet	\
#	tzdata	\
#	gawk	\
#	wget	\
#	diffstat	\
#	texinfo	\
#	chrpath	\
#	socat

RUN curl -s https://get.sdkman.io | bash
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
SHELL ["/bin/bash", "-c"]  
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" \
		&& sdk install kotlin


# Sets Language to UTF8 : this works in pretty much all cases
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN export LC_ALL="en_US.UTF-8"

RUN mkdir -p /var/run/sshd

RUN adduser -u 1000 --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 


VOLUME "/tmp" "/run" "/var/run"

# replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
