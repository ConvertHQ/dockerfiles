FROM ubuntu:precise
MAINTAINER Edd Robinson github.com/e-dard

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nginx

# ensure nginx runs in the foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# service base configuration
ADD default.base /etc/nginx/sites-available/default.base

# HTTPS only
EXPOSE 80

# will run script that identifies port linked service is running on, and
# creates appropriate nginx config
ADD setup.sh /bin/setup.sh
RUN chmod +x /bin/setup.sh
CMD ["setup.sh"]
