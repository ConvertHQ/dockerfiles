# Ruby Base Image

Provides a convenient base image for deploying Ruby applications.

You're expected to use a `.ruby-version` to specify the required Ruby version,
and Bundler (i.e. `Gemfile` and `Gemfile.lock`) to manage dependencies.

A `Dockerfile` for a Rails application might look something like this:

```dockerfile
FROM quay.io/incisively/ruby
MAINTAINER Nathan Barley nathan@trashbat.co.ck

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-e", "production"]
```

Note that you need only specify the port and command to start the application -
installing Ruby, bundling and copying files is all handled for you.

The Ruby version and bundle will be automatically cached where possible.
