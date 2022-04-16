FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install wget git curl

# Install Golang 1.14.4
RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
RUN tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
RUN mkdir -p ~/go/{bin,pkg,src}

ENV GOPATH=$HOME/go
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOPATH/bin:$GOROOT/bin
ENV GO111MODULE=auto

# Install networking toolkit
RUN apt-get -y install iputils-ping tcpdump iptables net-tools

# TODO: Download and build free5GC NFs and WebConsole
# Required packages for user plane
RUN apt-get -y install git gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev
RUN go get -u github.com/sirupsen/logrus

# Required packages for WebConsole
RUN apt-get -y remove cmdtest yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get -y update
RUN apt-get -y install nodejs yarn

# Build all NFs at once
WORKDIR /root
RUN git clone --recursive -b v3.1.0 -j `nproc` https://github.com/free5gc/free5gc.git
WORKDIR /root/free5gc
RUN make

# Build WebConsole
WORKDIR /root/free5gc/webconsole
RUN git checkout v1.1.0
WORKDIR /root/free5gc
RUN make webconsole

