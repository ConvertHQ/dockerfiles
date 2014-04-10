### nginx

Provides a basic SSL-only nginx container, which will happily proxy HTTPS
requests to another web-service running in a linked Docker container.

Specifically:

 - it installs nginx 1.1.19 `TODO - upgrade this`;
 - it adds a simple default configuration which proxies requests on `443`;
 - it expects SSL certificates to be made available.

Regarding the last point, you must ensure that `server.crt` and
`server.key` are available under `/etc/nginx/ssl` within the container.
This can be achieved by using the `nginx` container as a base for
another, where you `ADD` the certificates, *or* by mounting a volume
from your host machine at runtime.

The `nginx` container must also be explicitly linked to the
container it will proxy, using the `-link` option, and ensuring the
*alias* is `service`. It uses the environment information Docker makes
available when containters are linked, to write a correct site
configuration.

Use the container as follows if you plan to provide SSL certificiates
by mounting a host volume:

```bash
$ docker run -d \
             -p 443:443 \
             -link othername:service \
             -v /path/to/cert/dir:/etc/nginx/ssl \
             nginx
```

Where `-link othername:service` refers to a container named `othername`
and aliased to `service`, and `/path/to/cert/dir` contains `server.crt`
and `server.key`, on the host.

