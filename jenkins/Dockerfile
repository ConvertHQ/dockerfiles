FROM jenkins

USER root

# Install Docker
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client

# enable us to access host docker resources
VOLUME /var/lib/docker
