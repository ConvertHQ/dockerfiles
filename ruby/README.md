# Ruby Base Image

Provides a convenient base image for deploying Ruby applications.


## Usage

You're expected to use Bundler (i.e. `Gemfile` and `Gemfile.lock`) to manage
dependencies.

A `Dockerfile` for a Rails application expecting Ruby 2.1.0 might look something
like this:

```dockerfile
FROM quay.io/incisively/ruby:2.1.0
MAINTAINER Nathan Barley nathan@trashbat.co.ck

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-e", "production"]
```

Note that you need only specify the port and command to start the application -
installing Ruby, bundling and copying files is all handled for you. The bundle
will be automatically cached where possible.


## Building New Versions

If a base image for the version of Ruby you need doesn't already exist, just run
`./build.sh`.

This will prompt you for a Ruby version, build a tagged image, and push it to
quay.io automatically.
