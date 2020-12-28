# ====================================================================== #
# Android SDK Docker Image. (Project NHN1033)
# ====================================================================== #


# Base image
# ====================================================================== #
FROM ubuntu:16.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"


# Update apt-get
RUN apt-get -y update

# Installing packages
RUN apt-get -y install \
	uuid 	\
	uuid-dev	\
	zlib1g-dev	\
	liblz-dev	\
	liblzo2-2	\
	liblzo2-dev	\
	lzop	\
	git-core	\
	curl	\
	u-boot-tools	\
	python	\
	mtd-utils	\
	openjdk-8-jdk	\
	device-tree-compiler	\
	gdisk	\
	make	\
	gcc	\
	bc	\
	m4 	\
	ccache	\
	zip	\
	unzip	\
	gnupg	\
	flex	\
	bison	\
	gperf	\
	build-essential	\
	gcc-multilib	\
	g++-multilib	\
	libc6-dev-i386	\
	lib32ncurses5-dev	\
	x11proto-core-dev	\
	libx11-dev	\ 
	lib32z-dev	\
	libgl1-mesa-dev	\
	libxml2-utils	\
	xsltproc	\
	vim	\
	usbutils	\
	sudo	\
	ctags	\
	cscope	\
	openssh-server \
	locales	\
	repo	\ 
	figlet
	
# Sets Language to UTF8 : this works in pretty much all cases
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN export LC_ALL="en_US.UTF-8"

RUN mkdir -p /var/run/sshd

RUN adduser -u 1000 --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1001 --disabled-password -gecos "" jkkim \
		&& echo 'jkkim:jkkim' | chpasswd \
		&& adduser jkkim sudo \
		&& echo 'jkkim ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 


RUN adduser -u 1002 --disabled-password -gecos "" ssyoo \
		&& echo 'ssyoo:ssyoo' | chpasswd \
		&& adduser ssyoo sudo \
		&& echo 'ssyoo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1005 --disabled-password -gecos "" kbh88zz \
		&& echo 'kbh88zz:kbh88zz' | chpasswd \
		&& adduser kbh88zz sudo \
		&& echo 'kbh88zz ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN adduser -u 1007 --disabled-password -gecos "" syjeon \
		&& echo 'syjeon:syjeon' | chpasswd \
		&& adduser syjeon sudo \
		&& echo 'syjeon ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 




VOLUME "/tmp" "/run" "/var/run"


# replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
