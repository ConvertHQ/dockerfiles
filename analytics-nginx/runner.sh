#!/bin/bash
mkdir -p /var/log/nginx # TODO: why?
nginx &
socat UNIX-LISTEN:/etc/nginx/reload.sock,fork EXEC:"kill -HUP $!"
