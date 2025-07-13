# Dockerfile para Servidor Minecraft no Railway
FROM eclipse-temurin:17-jre-jammy

# Instalar wget, net-tools e outras dependências
RUN apt-get update && apt-get install -y wget curl net-tools && rm -rf /var/lib/apt/lists/*

# Criar diretório do servidor
WORKDIR /minecraft

# Baixar Paper Server (otimizado)
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/497/downloads/paper-1.20.4-497.jar -O paper.jar

# Copiar arquivos de configuração
COPY server.properties .
COPY eula.txt .
COPY start.sh .
COPY healthcheck.sh .

# Dar permissão de execução
RUN chmod +x start.sh healthcheck.sh

# Expor porta
EXPOSE 25565

# Comando de inicialização
CMD ["./start.sh"]