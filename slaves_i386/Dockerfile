from 32bit/ubuntu:16.04

RUN echo "install console-setup" && \
    echo "console-setup   console-setup/codeset47 select  # Latin1 and Latin5 - western Europe and Turkic languages" | debconf-set-selections && \
    echo "console-setup   console-setup/fontface47        select  Fixed" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize-text47   select  16" | debconf-set-selections && \
    echo "console-setup   console-setup/charmap47 select  UTF-8" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/detect    detect-keyboard" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/detected  note" | debconf-set-selections && \
    echo "console-setup   console-setup/codesetcode       string  Lat15" | debconf-set-selections && \
    echo "keyboard-configuration  console-setup/ask_detect        boolean false" | debconf-set-selections && \
    echo "console-setup   console-setup/store_defaults_in_debconf_db      boolean true" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize-fb47     select  16" | debconf-set-selections && \
    echo "console-setup   console-setup/fontsize  string  16" | debconf-set-selections

RUN LANGUAGE=ko_KR.UTF-8 LANG=ko_KR.UTF-8 locale-gen ko_KR ko_KR.UTF-8 
ENV LANGUAGE ko_KR.UTF-8
ENV LANG ko_KR.UTF-8 
ENV LC_ALL ko_KR.UTF-8 

ARG user=lchy0113
ARG group=lchy0113
ARG uid=1000
ARG gid=1000

RUN adduser --disabled-password --gecos "" lchy0113 \
    && echo 'lchy0113:lchy0113' | chpasswd \
    && adduser lchy0113 sudo \
    && echo 'lchy0113 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& mkdir /var/run/sshd

#RUN echo "root:1234" | chpasswd
#RUN echo "lchy0113:1234" | chpasswd

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y subversion git vim cscope tree
RUN apt-get install -y net-tools
RUN apt-get install -y make
RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y openssh-server

RUN apt-get install -y gcc ncurses-dev bc

RUN sudo apt-get install -y zlib1g-dev
COPY openssl-1.1.1g.tar.gz /root/
RUN cd /root && tar zxvf openssl-1.1.1g.tar.gz && cd openssl-1.1.1g && ./Configure  linux-x86 -DL_ENDIAN no-idea no-md2 no-mdc2 no-rc5 no-rc4 zlib &&  make && make install

RUN sudo apt-get install -y g++

RUN sudo apt-get install -y software-properties-common

RUN sudo add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update
RUN apt-get -y upgrade

COPY repo /usr/bin/repo

COPY cmake-3.18.2.tar.gz /root/
RUN cd /root && tar zxvf cmake-3.18.2.tar.gz && cd cmake-3.18.2 && ./configure && make && make install

RUN sudo apt-get install -y pkg-config

ARG LCHY0113_AGENT_HOME=/home/${user}

ENV LCHY0113_AGENT_HOME ${LCHY0113_AGENT_HOME}

# setup SSH server
#RUN apt-get update \
#    && apt-get install --no-install-recommends -y openssh-server \
#    && rm -rf /var/lib/apt/lists/*
#RUN sed -i /etc/ssh/sshd_config \
#        -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
#        -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
#        -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
#        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
#        -e 's/#LogLevel.*/LogLevel INFO/' && \
#    mkdir -p /var/run/sshd

WORKDIR "${LCHY0113_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

#RUN  mkdir -p /home/lchy0113/.ssh/
#COPY .ssh/* /home/lchy0113/.ssh/
#RUN chown lchy0113:lchy0113 -R /home/lchy0113/.ssh/

USER lchy0113

#RUN ssh-keygen -A
#CMD ["/usr/sbin/sshd", "-D"]
#CMD ["/bin/bash"]

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
