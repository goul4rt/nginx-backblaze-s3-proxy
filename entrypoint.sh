#!/bin/sh

# Substitui as variáveis no template e gera o arquivo de configuração final
envsubst '$B2_KEY_ID $B2_ACCESS_KEY $B2_BUCKET $B2_REGION $B2_AUTH_HEADER $ALLOWED_REFERER $ALLOWED_HEADER $CACHE_RAM $CACHE_DISK $CACHE_INACTIVITY $CACHE_MAX_AGE $DEBUG_UUID $MAX_CONNECTIONS_PER_IP $ALLOWED_HOST_REGEX' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Inicia o Fail2Ban
#service fail2ban start

# Inicia o Nginx
exec nginx -g 'daemon off;'
