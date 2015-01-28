FROM jenkins

USER root

# Install Docker
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install PostgreSQL client
RUN apt-get install -y postgresql-client

# enable us to access host docker resources
VOLUME /var/lib/docker
