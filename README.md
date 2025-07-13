# 🎮 Servidor Minecraft no Railway

Um servidor Minecraft 1.20.4 rodando no Railway usando Paper Server para melhor performance e recursos.

## 📋 Características

- **Versão**: Minecraft 1.20.4
- **Servidor**: Paper Server (otimizado)
- **Plataforma**: Railway
- **Java**: Eclipse Temurin 17 JRE
- **Porta**: 25565

## 🚀 Deploy Rápido

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/new)

## 📁 Estrutura do Projeto

```
minecraft-server/
├── Dockerfile              # Configuração do container Docker
├── server.properties       # Configurações do servidor Minecraft
├── eula.txt                # Aceite dos termos da Mojang
├── start.sh                # Script de inicialização
├── railway.json           # Configurações do Railway
└── README.md              # Este arquivo
```

## ⚙️ Configuração

### Server Properties

O arquivo `server.properties` contém as configurações principais do servidor:

- **Modo de jogo**: Survival
- **Dificuldade**: Normal
- **Max jogadores**: 20
- **View distance**: 10
- **Spawn protection**: 16

### Recursos do Paper Server

- Melhor performance comparado ao Vanilla
- Plugins compatíveis com Bukkit/Spigot
- Otimizações de rede e chunk loading
- Configurações anti-lag integradas

## 🔧 Personalização

### Modificar Configurações

1. Edite o arquivo `server.properties` conforme necessário
2. Faça commit das mudanças
3. O Railway fará redeploy automaticamente

### Adicionar Plugins

Para adicionar plugins:

1. Crie uma pasta `plugins/` no projeto
2. Adicione os arquivos `.jar` dos plugins
3. Modifique o `Dockerfile` para copiar a pasta plugins
4. Faça redeploy

### Modificar Versão do Minecraft

Para usar uma versão diferente:

1. Acesse [PaperMC Downloads](https://papermc.io/downloads)
2. Encontre o link de download da versão desejada
3. Substitua a URL no `Dockerfile`
4. Atualize as configurações se necessário

## 🌐 Conectando ao Servidor

1. Após o deploy, copie a URL fornecida pelo Railway
2. No Minecraft, vá em "Multiplayer" > "Add Server"
3. Cole a URL (sem `http://` ou `https://`)
4. Conecte-se e divirta-se!

## 📊 Monitoramento

O Railway fornece:
- Logs em tempo real
- Métricas de CPU e memória
- Status do serviço
- Histórico de deploys

## 🛠️ Desenvolvimento Local

Para testar localmente:

```bash
# Construir a imagem
docker build -t minecraft-server .

# Executar o container
docker run -p 25565:25565 minecraft-server
```

## 📝 Variáveis de Ambiente

Você pode configurar estas variáveis no Railway:

- `MEMORY`: Memória RAM para o servidor (padrão: 1G)
- `DIFFICULTY`: Dificuldade do jogo (peaceful, easy, normal, hard)
- `GAMEMODE`: Modo de jogo padrão (survival, creative, adventure)

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto segue os termos de uso do Minecraft da Mojang Studios.

## 🆘 Suporte

- **Documentação do Paper**: [https://docs.papermc.io/](https://docs.papermc.io/)
- **Railway Docs**: [https://docs.railway.app/](https://docs.railway.app/)
- **Minecraft Wiki**: [https://minecraft.wiki/](https://minecraft.wiki/)

## 🏷️ Tags

`minecraft` `paper-server` `railway` `docker` `java` `gameserver` `multiplayer`

---

⭐ **Gostou do projeto? Deixe uma estrela!** ⭐
