#!/bin/bash
echo "==================================="
echo "  Servidor Minecraft Railway      "
echo "==================================="
echo "Iniciando servidor Minecraft..."
echo "Configurado para jogadores originais e piratas"
echo "Servidor otimizado para Railway"
echo "==================================="

# Verificar se já existe um servidor rodando
if pgrep -f "paper.jar" > /dev/null; then
    echo "AVISO: Servidor já está rodando!"
    exit 1
fi

# Criar lock file para evitar múltiplas instâncias
LOCK_FILE="/tmp/minecraft.lock"
if [ -f "$LOCK_FILE" ]; then
    echo "AVISO: Lock file existe. Removendo..."
    rm -f "$LOCK_FILE"
fi
echo $$ > "$LOCK_FILE"

# Limpeza na saída
trap 'rm -f "$LOCK_FILE"; exit' INT TERM EXIT

# Configurações otimizadas para container Railway
# Detectar memória disponível automaticamente
MEMORY=$(cat /proc/meminfo | grep MemTotal | awk '{print int($2/1024)}')
if [ $MEMORY -lt 1024 ]; then
    MAX_MEM="512M"
    MIN_MEM="256M"
elif [ $MEMORY -lt 2048 ]; then
    MAX_MEM="1536M"
    MIN_MEM="512M"
else
    MAX_MEM="2G"
    MIN_MEM="1G"
fi

echo "Memória detectada: ${MEMORY}MB"
echo "Configurando JVM: Min=${MIN_MEM}, Max=${MAX_MEM}"

# Flags otimizadas do Aikar para servidores pequenos
exec java -Xms$MIN_MEM -Xmx$MAX_MEM \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -Dusing.aikars.flags=https://mcflags.emc.gs \
  -Daikars.new.flags=true \
  -jar paper.jar nogui