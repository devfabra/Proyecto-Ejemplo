# Generador de Reportes de Rendimiento en Bash - Debian 13

> Proyecto de Aula – Sistemas Operativos  
> Universidad Fundación Universitaria Compensar

Este proyecto consiste en un generador de reportes de rendimiento orientado a entornos Linux. La herramienta recopila y monitorea métricas clave del sistema como el uso de CPU, memoria RAM y el estado de los procesos del sistema operativo en intervalos de tiempo predefinidos.

Utilizando herramientas nativas de administración del sistema como 'top', 'vmstat' y 'ps', junto con la potencia de 'awk' para el procesamiento y la tabulación de datos, el script tranforma la métrica en bruto en un archivo estructurado en formato CSV ('.csv') listo para su posterior análisis cuantitativo y visualización.

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

## 🚀 Acerca del Proyecto
Este proyecto surge como una herramienta práctica para la asignatura de **Sistemas Operativos**. Su objetivo principal es monitorear el comportamiento del kernel y la asignación de recursos hardware en tiempo real. Permite automatizar la toma de muestras de rendimiento para su posterior análisis cuantitativo en hojas de cálculo (Excel, Google Sheets, Python/Pandas, etc.).

---

## ✨ Características Principales
* **Monitoreo Multicomponente:** Captura simultáneamente estadísticas de carga del CPU (usuario, sistema, inactivo), consumo de memoria RAM (usada/libre en MB) y el proceso con mayor demanda de recursos.
* **Portabilidad Lingüística:** Configurado con localización estándar (`LC_ALL=C`) para evitar fallos de sintaxis en comandos del sistema independientemente del idioma del sistema operativo.
* **Estructura CSV Limpia:** Exporta los datos con marcas de tiempo (`Timestamp`) separados por comas y delimitados por comillas para asegurar la integridad de las cadenas de texto.
* **Parámetros Dinámicos:** Permite configurar de forma personalizada el intervalo de tiempo entre muestras y el número total de iteraciones al ejecutar el script.

---

## 🛠 Prerrequisitos y Dependencias
Para ejecutar este script de manera correcta, necesitas:
* Un entorno operativo basado en **Linux** o sistemas tipo UNIX con intérprete **Bash** instalado.
* Las siguientes utilidades del sistema (generalmente vienen preinstaladas en la mayoría de distribuciones):
  * `vmstat` (Virtual Memory Statistics)
  * `free` (Monitoreo de memoria)
  * `ps` (Estado de procesos)
  * `awk` (Procesamiento de texto y tabulación)

---

## 📥 Instalación
1. Clona este repositorio en tu máquina local:
   ```bash
   git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/tu-usuario/tu-repositorio.git)
   cd tu-repositorio