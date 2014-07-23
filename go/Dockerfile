FROM quay.io/incisively/base:latest
MAINTAINER Edd Robinson github.com/e-dard

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libc6-dev \
    libc6-dev-i386 \
    python-software-properties

# git, mercurial, bazaar
RUN add-apt-repository -y ppa:git-core/ppa
RUN add-apt-repository -y ppa:mercurial-ppa/releases
RUN add-apt-repository -y ppa:bzr/ppa

RUN apt-get update && apt-get install -y git mercurial bzr

# Go
WORKDIR /usr/local/share
RUN hg clone -u release https://code.google.com/p/go

# Go 1.2 branch
RUN cd go && hg checkout release-branch.go1.2
RUN cd go/src && ./all.bash

ENV GOPATH /go
ENV PATH /go/bin:/usr/local/share/go/bin:$PATH
