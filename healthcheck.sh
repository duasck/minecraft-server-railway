#!/bin/bash
# Health check para verificar se o servidor Minecraft está rodando
# Verifica se a porta 25565 está ouvindo

if netstat -tuln | grep -q ":25565 "; then
    echo "Servidor Minecraft está rodando na porta 25565"
    exit 0
else
    echo "Servidor Minecraft não está respondendo"
    exit 1
fi
