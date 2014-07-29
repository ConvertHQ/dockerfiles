#!/bin/bash

read -p "Ruby version to build (e.g.: 2.1.0)? " RUBY_VERSION
echo

DOCKERFILE=Dockerfile.$RUBY_VERSION
DOCKER_IMAGE=quay.io/incisively/ruby:$RUBY_VERSION

sed s/RUBY_VERSION/$RUBY_VERSION/ Dockerfile.template > $DOCKERFILE
{
  docker build -t $DOCKER_IMAGE - < $DOCKERFILE
  docker push $DOCKER_IMAGE
}
rm $DOCKERFILE
