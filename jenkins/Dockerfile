FROM jenkins

USER root

RUN curl -sSL https://get.docker.com/ubuntu/ | sh
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
# RUN sh -c "echo deb https://get.docker.com/ubuntu docker main /etc/apt/sources.list.d/docker.list"
# RUN apt-get update
# RUN apt-get install -y lxc-docker

# enable us to access host docker resources
VOLUME /var/lib/docker

# add jenkins user to docker group
RUN usermod -a -G docker jenkins

# drop back to jenkins
USER jenkins
