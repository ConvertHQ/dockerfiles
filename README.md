# Incisively Dockerfiles!

This repo contains all of Incisively's public Dockerfiles.

Each Dockerfile can be used as useful base images for more specific
applications.


### Go Services

`go/Dockerfile` provides a convenient base image for deploying Go
applications.

It provides the following:
 - `git`, `mercurial` and `bazaar`, so `go get` can fetch everything it needs;
 - The Go 1.2.1 environment for building your go apps within a container;
 - a `GOPATH` set to `/go`.

A simple Go service utilising `go/Dockerfile` might look something like
the following:

```dockerfile
FROM quay.io/incisively/goapp
MAINTAINER Alice alice@alice.io

# add project
RUN mkdir -p /go/src/github.com/foo/service
WORKDIR /go/src/github.com/foo/service

# add your source, get all deps and install
ADD . /go/src/github.com/foo/service
RUN go get ./...
RUN go install

EXPOSE 8080

CMD ["service"]
```
