FROM quay.io/incisively/base:latest
MAINTAINER Richard Worrall github.com/skinnyfit

RUN apt-get update && apt-get install -qy curl ca-certificates git-core \
  build-essential autoconf libssl-dev libreadline6-dev libpq-dev

# Install ruby-build & configure
RUN git clone https://github.com/sstephenson/ruby-build.git /tmp/ruby-build
RUN /tmp/ruby-build/install.sh
RUN rm -r /tmp/ruby-build
ENV CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# Install specified Ruby version
ONBUILD ADD .ruby-version /tmp/
ONBUILD RUN ruby-build `cat /tmp/.ruby-version` /usr/local
ONBUILD RUN gem install bundler

# Create application user
RUN useradd -m -s /bin/bash app
ONBUILD WORKDIR /home/app

# Install any OS-level deps, e.g., required for native extensions
ONBUILD ADD .apt-packages /tmp/
ONBUILD RUN [ ! -f /tmp/.apt-packages ] || apt-get update
ONBUILD RUN [ ! -f /tmp/.apt-packages ] || apt-get install $(cat /tmp/.apt-packages)

# Install dependencies
ONBUILD ADD Gemfile /home/app/
ONBUILD ADD Gemfile.lock /home/app/
ONBUILD RUN bundle install

# Add application
ONBUILD ADD . /home/app/
ONBUILD RUN chown -R app:app /home/app
ONBUILD USER app
ONBUILD ENV HOME /home/app
