#!/bin/bash

# Define o tempo em segundos entre as limpezas (ex: 1 hora)
CLEANUP_INTERVAL=3600

while true; do
    echo "Iniciando limpeza de cache..."
    
    # Comando para remover arquivos mais antigos que 72 horas (ou ajuste conforme necessário)
    find /var/cache/nginx -type f -mtime +3 -exec rm -f {} \;

    echo "Limpeza de cache concluída. Próxima execução em $CLEANUP_INTERVAL segundos."
    sleep $CLEANUP_INTERVAL
done
