#!/bin/bash

# Limites de uso de I/O e banda (em % e KB/s)
MAX_IO=80
MAX_BANDWIDTH=10000  # Exemplo: 10MB/s

# Função para monitorar I/O
check_io_usage() {
    io_usage=$(iostat -d | awk '/^sda/ {print int($6)}')
    if [ "$io_usage" -gt "$MAX_IO" ]; then
        echo "Uso de I/O alto: $io_usage%. Ignorando cache."
        disable_nginx_cache
    else
        enable_nginx_cache
    fi
}

# Função para monitorar largura de banda de rede
check_bandwidth_usage() {
    bandwidth_usage=$(vnstat --oneline | awk -F\; '{print $9}' | sed 's/[^0-9]//g')
    if [ "$bandwidth_usage" -gt "$MAX_BANDWIDTH" ]; then
        echo "Uso de banda alto: $bandwidth_usage KB/s. Ignorando cache."
        disable_nginx_cache
    else
        enable_nginx_cache
    fi
}

# Desativa cache no NGINX
disable_nginx_cache() {
    if grep -q "proxy_cache my_cache" /etc/nginx/nginx.conf; then
        sed -i 's/proxy_cache my_cache;//g' /etc/nginx/nginx.conf
        nginx -s reload
    fi
}

# Reativa o cache no NGINX
enable_nginx_cache() {
    if ! grep -q "proxy_cache my_cache" /etc/nginx/nginx.conf; then
        sed -i '/location \/ {/a \\tproxy_cache my_cache;' /etc/nginx/nginx.conf
        nginx -s reload
    fi
}

# Loop infinito para monitoramento contínuo
while true; do
    check_io_usage
    check_bandwidth_usage
    sleep 10  # Intervalo de checagem a cada 10 segundos
done
