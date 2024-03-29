# ====================================================================== #
# Android SDK Docker Image. (Project NHN1033)
# ====================================================================== #


# Base image
# ====================================================================== #
FROM ubuntu:20.04

# Author
# ====================================================================== #
LABEL maintainer "lchy0113@gmail.com"


ARG DEBIAN_FRONTEND=noninteractive

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
	python-dev \
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
	libncurses5 \
	rsync \
	xsltproc	\
	vim	\
	usbutils	\
	sudo	\
	ctags	\
	cscope	\
	openssh-server \
	locales	\
	cpio	\
	gawk	\
	busybox	\
	figlet
	
# Sets Language to UTF8 : this works in pretty much all cases
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN export LC_ALL="en_US.UTF-8"
RUN export LC_ALL=C

RUN mkdir -p /var/run/sshd
RUN mkdir -p /home/lchy0113/ssd/Allwinner

RUN adduser -u 1000 --disabled-password -gecos "" lchy0113 \
		&& echo 'lchy0113:lchy0113' | chpasswd \
		&& adduser lchy0113 sudo \
		&& echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN mkdir -p /home/lchy0113/Develop/Allwinner && \
		chown lchy0113:lchy0113 -R /home/lchy0113/Develop
RUN mkdir -p /home/lchy0113/bin

#ADD setup.sh /setup.sh
#RUN chmod 0755 /setup.sh
#RUN /setup.sh

RUN mkdir -p /home/lchy0113/.ssh && \
		chown lchy0113:lchy0113 -R /home/lchy0113/.ssh && \
		chmod 0700 /home/lchy0113/.ssh
COPY id_rsa /home/lchy0113/.ssh/
COPY id_rsa.pub /home/lchy0113/.ssh/
COPY add_script_to_bashrc.sh /home/lchy0113/.ssh
COPY .bashrc /home/lchy0113/.bashrc
RUN chmod 0700 /home/lchy0113/.ssh/add_script_to_bashrc.sh
RUN /home/lchy0113/.ssh/add_script_to_bashrc.sh
RUN chown lchy0113:lchy0113 -R /home/lchy0113/
RUN ssh-agent > ~/.ssh-agent.sh

RUN git config --global user.email "lchy0113@gmail.com"
RUN git config --global user.name "Lee.C"

VOLUME "/tmp" "/run" "/var/run"


# replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
