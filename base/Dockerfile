FROM ubuntu:precise

MAINTAINER Edd Robinson github.com/e-dard

RUN apt-get update && apt-get install -y unattended-upgrades

# get latest security updates everytime we use this base image
ONBUILD RUN apt-get update && unattended-upgrades

VOLUME /var/log
