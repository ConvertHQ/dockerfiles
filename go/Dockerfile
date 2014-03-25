FROM ubuntu:precise
MAINTAINER Edd Robinson github.com/e-dard

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y gcc libc6-dev libc6-dev-i386 python-software-properties

# git, mercurial, bazaar
RUN add-apt-repository -y ppa:git-core/ppa
RUN add-apt-repository -y ppa:mercurial-ppa/releases
RUN add-apt-repository -y ppa:bzr/ppa

RUN apt-get update
RUN apt-get install -y git mercurial bzr

# Go 1.2
WORKDIR /usr/local/share
RUN hg clone -u release https://code.google.com/p/go
RUN cd go/src && ./make.bash

ENV PATH /usr/local/share/go/bin:/usr/bin:/usr/sbin
