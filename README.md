# Generador de Reportes de Rendimiento en Bash - Debian 13

> Proyecto de Aula – Sistemas Operativos  
> Universidad Fundación Universitaria Compensar

Script automatizado desarrollado en Bash para la recolección, estructuración y exportación de métricas del sistema operativo (CPU, RAM y procesos activos) hacia archivos CSV, utilizando herramientas nativas de Unix/Linux como `top`, `vmstat`, `free`, `ps` y filtrado avanzado con `awk`.

---

## Tabla de Contenidos
- [Acerca del Proyecto](#-acerca-del-proyecto)
- [Características Principales](#-características-principales)
- [Prerrequisitos y Dependencias](#-prerrequisitos-y-dependencias)
- [Instalación](#-instalación)
- [Modo de Uso](#-modo-del-uso)
- [Estructura del Repositorio](#-estructura-del-repositorio)
- [Diseño Técnico y Arquitectura](#-diseño-técnico-y-arquitectura)
- [Resultados Esperados](#-resultados-esperados)
- [Autores](#-autores)

---

## Acerca del Proyecto
Este proyecto surge como una herramienta práctica para la asignatura de **Sistemas Operativos**. Su objetivo principal es monitorear el comportamiento del kernel y la asignación de recursos hardware en tiempo real. Permite automatizar la toma de muestras de rendimiento para su posterior análisis cuantitativo en hojas de cálculo (Excel, Google Sheets, Python/Pandas, etc.).

---

## Características Principales
* **Monitoreo Multicomponente:** Captura simultáneamente estadísticas de carga del CPU (usuario, sistema, inactivo), consumo de memoria RAM (usada/libre en MB) y el proceso con mayor demanda de recursos.
* **Portabilidad Lingüística:** Configurado con localización estándar (`LC_ALL=C`) para evitar fallos de sintaxis en comandos del sistema independientemente del idioma del sistema operativo.
* **Estructura CSV Limpia:** Exporta los datos con marcas de tiempo (`Timestamp`) separados por comas y delimitados por comillas para asegurar la integridad de las cadenas de texto.
* **Parámetros Dinámicos:** Permite configurar de forma personalizada el intervalo de tiempo entre muestras y el número total de iteraciones al ejecutar el script.

---

## Prerrequisitos y Dependencias
Para ejecutar este script de manera correcta, necesitas:
* Un entorno operativo basado en **Linux** o sistemas tipo UNIX con intérprete **Bash** instalado.
* Las siguientes utilidades del sistema (generalmente vienen preinstaladas en la mayoría de distribuciones):
  * `vmstat` (Virtual Memory Statistics)
  * `free` (Monitoreo de memoria)
  * `ps` (Estado de procesos)
  * `awk` (Procesamiento de texto y tabulación)

---

## Instalación
1. Clona este repositorio en tu máquina local:
   ```bash
   git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/tu-usuario/tu-repositorio.git)
   cd tu-repositorio

## Modo de Uso

1. **Otorga permisos de ejecución** al script principal (asegúrate de estar en la raíz del proyecto):
   ```bash
   chmod +x src/generador_reportes.sh

Se puede ejecutar el script de dos maneras:

2. **Con valores predeterminados**
Toma una muestra de cada 5 segundos, realizando un total de 12 iteraciones (equivalente a 1 minuto de monitoreo):
   ```bash
   ./src/generador_reportes.sh

3. Con parametros personalizados
Puedes especificar tu propio intervalo en segundos y la cantidad de muestras:
  ```bash
  # Sintaxis: ./generador_reportes.sh [intervalo_sengundos] [total_iteraciones]
  # Ejemplo: tomar una muestra cada 2 segundos, durante 30 iteraciones (1 minuto)
  ./generador_reportes.sh 2 30

## Estructura del Repositorio
```text
tu-repositorio-sistemas-operativos/
├── README.md                 # Documentación del proyecto
├── reports/                  # Carpeta de salida para los reportes CSV
│   └── (archivos generados automáticamente)
└── src/                      # Carpeta de código fuente
    └── generador_reportes.sh # Script principal en Bash

