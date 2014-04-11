#!/bin/bash
nginx &
socat UNIX-LISTEN:/etc/nginx/reload.sock,fork EXEC:"kill -HUP $!"
