FROM nginx:latest

# Copiar o template de configuração
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Copiar o script de inicialização
COPY entrypoint.sh /entrypoint.sh

# Tornar o script executável
RUN chmod +x /entrypoint.sh

# Definir o script de entrada
ENTRYPOINT ["/entrypoint.sh"]
