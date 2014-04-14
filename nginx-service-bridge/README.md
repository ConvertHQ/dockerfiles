# nginx-service-bridge

An ephemeral container for updating an nginx container with details of a
proxied service. It is currently tailored specifically for use with an
[`analytics-nginx`](https://github.com/ConvertHQ/dockerfiles/tree/master/analytics-nginx)
container.

## How to run

```sh
docker run --volumes-from A --link B:service -e "LOCATION=C" --rm nginx-service-bridge
```

Replacing the following:

- `A`: name of the analytics-nginx container to update
- `B`: name of the backend service to be proxied
- `C`: URI to match

## Example

Let's say we have the following containers running:

CONTAINER ID | IMAGE             | ... | PORTS                   | NAMES
-------------|-------------------|-----|-------------------------|----------------
230c477763c9 | analytics-nginx   | ... | 0.0.0.0:443->443/tcp    | insane_feynman
fd8d45641de1 | analytics-service | ... | 0.0.0.0:49161->8080/tcp | cocky_pike

`analytics-nginx` is configured to serve *example.org*, and we want to make
`analytics-service` available at *example.org/collect/v2*.

To do so, issue the following command:

```sh
docker run --volumes-from insane_feynman --link cocky_pike:service -e "LOCATION=/collect/v2" --rm nginx-service-bridge
```

Now a request for *example.org/collect/v2/foo* will be forwarded to
`analytics-service` on port 8080 as */foo*.

## Expectations

For the automatic configuration to work, the service you are proxying must
serve plain HTTP (i.e., not HTTPS) on port 80 or 8080. If no service is
exposed on either of these ports, the container will display an error message
and exit.

## Manually updating the nginx configuration

You can also use this container to manually update nginx's configuration:

```sh
docker run --volumes-from insane_feynman --rm -ti nginx-service-bridge bash
```

This will give you a bash prompt with access to `/etc/nginx` and all
configuration files within. Once you've made your changes, simply run
`nc -U /etc/nginx/reload.sock` to reload nginx.
