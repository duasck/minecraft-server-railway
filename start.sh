#!/bin/bash
echo "Iniciando servidor Minecraft..."
echo "Configurado para jogadores originais e piratas"
echo "Servidor otimizado para Railway"

# Configurações otimizadas para container
exec java -Xms256M -Xmx1G \
  -XX:+UseG1GC \
  -XX:+UnlockExperimentalVMOptions \
  -XX:MaxGCPauseMillis=100 \
  -XX:+DisableExplicitGC \
  -XX:TargetSurvivorRatio=90 \
  -XX:G1NewSizePercent=50 \
  -XX:G1MaxNewSizePercent=80 \
  -XX:G1MixedGCLiveThresholdPercent=35 \
  -XX:+AlwaysPreTouch \
  -XX:+ParallelRefProcEnabled \
  -Dusing.aikars.flags=mcflags.emc.gs \
  -jar paper.jar nogui