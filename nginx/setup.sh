#! /bin/bash

# Get IP address of linked container
# Assumes container link alias is "service"
ADDR=`echo $SERVICE_PORT | grep -P -o '(?<=tcp://).+'`

# inject port of linked service
sed s/SERVICE_ADDR/$ADDR/ /etc/nginx/sites-available/default.base > /etc/nginx/sites-available/default

nginx
