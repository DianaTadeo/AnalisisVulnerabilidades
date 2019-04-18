# Analisis de Vulnerabilidades

Aqui se encontraran las tareas y examenes del curso de análisis de vulnerabilidades

## Tareas

### Investigación

[Investigacion](Investigacion)

+ Significado de la “R” en los registros de proposito general  de 64 bits.
+ Generar el código ensamblador de las sentencias `switch`,  y `for` (comentadas línea por línea).
+ Investigar tipos de datos en ensamblador y su tamaño.

### Ensamblador
+ Generar un programa que cifre una cadena con al menos  5 instrucciones de ensamblador distintas, al menos una de  las instrucciones debe ser `SHR` o `SHL` con un corrimiento  mínimo de 3.
+ Generar un programa que descifre la cadena previamente  cifrada.

**Referencia**: [https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf](https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf) 

### shell

[bindshell.asm](bindshell.asm)

Generar un programa en ensamblador que abra un puerto, al  conectarse al puerto debe devolver una *shell*, haciendo uso de  la llamada al sistema `execve`.

### shellcode

[shellcode.py](shellcode.py)

Generar un programa para obtener *shellcode*, similar a  `getshcode`, pero implementado en cualquier lenguaje de alto nivel, que por defecto imprima la cadena en formato `\x90\x90`, con el parámetro `-u` debe imprimirlo en formato  *unicode* `\u9090\u9090` y con el parámetro `-n` debe imprimir sólo los valores numéricos `9090`.

### dnstracer

[dnstracer.pdf](dnstracer.pdf)

Explotar la vulnerabilidad de `dnstracer` versión 1.8. Documentar los pasos seguidos e incluir prueba de concepto. 

### Funciones vulnerables

Elaborar una tabla comparativa con las funciones vulnerables a *buffer overflow* de C contra sus versiones seguras e indicar qué hace cada función.

### PoC

Desarrollar una prueba de concepto utilizando algún programa de la carrera o alguna herramienta encontrada en internet, la vulnerabilidad tiene que haber sido reportada como mínimo en 2016.

**Nota**: Los documentos deben contener las siguientes secciones: Objetivos, Introducción, Resumen ejecutivo, Desarrollo y Conclusiones. La conclusión debe tener una extensión mínima de media cuartilla.

**Nota**: Se recomienda explotarlo dentro de `gdb` para evitar contratiempos.

### Reverse shell

Generar un *reverse shell* y codificarlo con `msfvenom`. Subir ambos archivos ejecutables a `Virus Total` y comparar cuántos motores los detectan como maliciosos. Documentar pasos seguidos, incluir los ejecutables comprimidos, así como capturas de pantalla de las búsquedas en `Virus Total`. 
