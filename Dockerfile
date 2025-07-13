# Dockerfile para Servidor Minecraft no Railway
FROM openjdk:17-jre-slim

# Instalar wget e outras dependências
RUN apt-get update && apt-get install -y wget curl && rm -rf /var/lib/apt/lists/*

# Criar diretório do servidor
WORKDIR /minecraft

# Baixar Paper Server (otimizado)
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/497/downloads/paper-1.20.4-497.jar -O paper.jar

# Copiar arquivos de configuração
COPY server.properties .
COPY eula.txt .
COPY start.sh .

# Dar permissão de execução
RUN chmod +x start.sh

# Expor porta
EXPOSE 25565

# Comando de inicialização
CMD ["./start.sh"]