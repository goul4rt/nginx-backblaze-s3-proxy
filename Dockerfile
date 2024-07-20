FROM nginx:latest

RUN mkdir -p /var/cache/nginx && \
    chown -R nginx:nginx /var/cache/nginx

COPY nginx.conf.template /etc/nginx/nginx.conf.template

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
