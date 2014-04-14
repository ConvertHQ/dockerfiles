FROM quay.io/incisively/base:latest
MAINTAINER Richard Worrall github.com/skinnyfit

RUN apt-get update && apt-get install -y nginx socat
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# kill default host
RUN rm /etc/nginx/sites-*/default
RUN echo "" > /usr/share/nginx/www/index.html

RUN mkdir /etc/nginx/locations
ADD runner.sh /root/
ADD analytics.incisive.ly.conf /etc/nginx/sites-enabled/
ADD tags.conf /etc/nginx/locations/

VOLUME /etc/nginx
VOLUME /tags
EXPOSE 443

CMD ["/root/runner.sh"]
