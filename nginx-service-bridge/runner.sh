#!/bin/bash

BACKEND_PATTERN="PORT_(80|8080)_TCP="

if [ $(env | grep -E $BACKEND_PATTERN | wc -l) != 1 ]; then
  echo "You must link exactly 1 container that exposes port 80 or 8080"
  exit 1
fi

if [ -z "$LOCATION" ]; then
  echo "You must set a LOCATION environment variable for the virtual host"
  echo "e.g.: /collect/v2"
  exit 1
fi

NAME=$(echo $LOCATION | sed s:/:-:g | cut -c 2-)
BACKEND="$(env | grep -E $BACKEND_PATTERN | cut -d '=' -f 2 | sed 's/tcp/http/')/"
LOCATION="${LOCATION%/}/" # ensure trailing slash by stripping if present then adding

echo "Writing location..."
echo
sed -e s#BACKEND#$BACKEND# \
    -e s#NAME#$NAME# \
    -e s#LOCATION#$LOCATION# \
    ./location-template.conf > /etc/nginx/locations/$NAME.conf
cat /etc/nginx/locations/$NAME.conf

echo
echo "Triggering nginx reload..."
nc -U /etc/nginx/reload.sock

echo
echo "Done :)"
