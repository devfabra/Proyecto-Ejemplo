#!/bin/bash

# ==============================================================================
# Script: Generador de reportes de rendimiento (Robusto para cualquier idioma)
# Descripción: Recopila métricas de CPU, RAM y procesos, exportándolas a CSV.
# Uso: ./generador_reportes.sh [intervalo_segundos] [total_iteraciones]
# ==============================================================================

# Forzar idioma inglés para que las salidas de vmstat, free y ps sean estándar
export LC_ALL=C

# Nombre del archivo CSV de salida con marca de tiempo
OUTPUT_FILE="reporte_rendimiento_$(date +%Y%m%d_%H%M%S).csv"

# Parámetros configurables (por defecto: 5 segundos de intervalo, 12 iteraciones = 1 minuto total)
INTERVALO=${1:-5}
ITERACIONES=${2:-12}

echo "=================================================="
echo " Iniciar Recopilación de Métricas de Rendimiento"
echo "=================================================="
echo " Intervalo: ${INTERVALO}s | Muestras: ${ITERACIONES}"
echo " Archivo de salida: $OUTPUT_FILE"
echo "--------------------------------------------------"

# Escribir la cabecera del archivo CSV
echo "Timestamp,CPU_Usr,CPU_Sys,CPU_Idle,RAM_Used_MB,RAM_Free_MB,Top_Process" > "$OUTPUT_FILE"

for ((i=1; i<=ITERACIONES; i++)); do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    
    # 1. Recopilar métricas de CPU usando vmstat
    VMSTAT_OUT=$(vmstat 1 2 | tail -1)
    CPU_USR=$(echo "$VMSTAT_OUT" | awk '{print $13}')
    CPU_SYS=$(echo "$VMSTAT_OUT" | awk '{print $14}')
    CPU_IDLE=$(echo "$VMSTAT_OUT" | awk '{print $15}')
    
    # 2. Recopilar métricas de memoria RAM usando free
    RAM_INFO=$(free -m | awk '/Mem:/ {print $3, $4}')
    if [ -z "$RAM_INFO" ]; then
        # Plan de respaldo por si la variante de 'free' usa formato diferente
        RAM_INFO=$(free -m | awk 'NR==2 {print $3, $2-$3}')
    fi
    RAM_USED=$(echo "$RAM_INFO" | awk '{print $1}')
    RAM_FREE=$(echo "$RAM_INFO" | awk '{print $2}')

    # 3. Identificar el proceso con mayor consumo de CPU usando ps
    TOP_PROC=$(ps -eo comm,%cpu --sort=-%cpu | head -n 2 | tail -n 1 | awk '{print $1 " (" $2 "%)"}')

    # Escribir la línea formateada en el CSV
    echo "\"$TIMESTAMP\",$CPU_USR,$CPU_SYS,$CPU_IDLE,$RAM_USED,$RAM_FREE,\"$TOP_PROC\"" >> "$OUTPUT_FILE"

    echo "[$i/$ITERACIONES] Datos registrados a las $TIMESTAMP"
    
    # Esperar el intervalo especificado antes de la siguiente muestra (excepto en la última)
    if [ "$i" -lt "$ITERACIONES" ]; then
        sleep "$INTERVALO"
    fi
done

echo "--------------------------------------------------"
echo "¡Proceso finalizado! Reporte guardado en: $OUTPUT_FILE"
echo "=================================================="
