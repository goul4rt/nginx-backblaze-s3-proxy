FROM nginx:latest

# Instala o Fail2Ban
RUN apt-get update && apt-get install -y fail2ban && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Criação do diretório de cache
RUN mkdir -p /var/cache/nginx && \
    chown -R nginx:nginx /var/cache/nginx

# Copia o arquivo de configuração do NGINX
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Copia o script de entrada
COPY entrypoint.sh /entrypoint.sh

# Copia o script de limpeza
COPY cleanup.sh /cleanup.sh

# Copia a configuração do Fail2Ban
COPY fail2ban/jail.local /etc/fail2ban/jail.local
COPY fail2ban/filter.d/nginx-dos.conf /etc/fail2ban/filter.d/nginx-dos.conf

# Modifica permissões
RUN chmod +x /entrypoint.sh /cleanup.sh

# Define a entrada do contêiner
ENTRYPOINT ["/entrypoint.sh"]
