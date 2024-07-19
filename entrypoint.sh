#!/bin/sh

# Just replace the variables in the template and generate the final configuration file
envsubst '$B2_KEY_ID $B2_ACCESS_KEY $B2_BUCKET $B2_REGION $B2_AUTH_HEADER' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'
