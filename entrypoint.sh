#!/bin/sh

# Just replace the variables in the template and generate the final configuration file
envsubst '$B2_KEY_ID $B2_ACCESS_KEY $B2_BUCKET $B2_REGION $B2_AUTH_HEADER $ALLOWED_REFERER $ALLOWED_HEADER $CACHE_RAM $CACHE_DISK $CACHE_INACTIVITY $CACHE_MAX_AGE $DEBUG_UUID $MAX_CONNECTIONS_PER_IP $ALLOWED_HOST_REGEX' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'
