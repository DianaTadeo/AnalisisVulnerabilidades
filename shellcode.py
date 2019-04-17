"""
Programa que obtiene el shellcode de un archivo ejecutable

Autor: Diana Tadeo
"""
import os
import re
import argparse

ap= argparse.ArgumentParser()
ap.add_argument("-e", "--ejecutable", required=True, help="Archivo ejecutable.")
ap.add_argument("-n", "--numerico", required=False, help="Imprime solo los valores numericos.", action='store_true')
ap.add_argument("-u", "--unicoder", required=False, help="Imprime los caracteres en unicode.", action='store_true')
args=ap.parse_args()

command="objdump -d "+ args.ejecutable # Comando de llamada al sistema ejecutado por python

f = os.popen(command) #Se realiza la llamada al sistema

"""Guardamos la salida del comando anterior y nos preparamos para tratarla"""
salida = f.read()
lineas= salida.split("\n")
ree=r'.*\t(.*)\t.*'

shellcode=""
""" Se revisa cada linea de la salida y se obtiene solo el opcode"""
for l in lineas:
	z = re.match(ree, l)
	if z:
		shellcode+=  z.group(1).strip()+" "# El opcode se guarda en la cadena 'shellcode'
		
"""Lo pasamos a little endian"""
conjbytes=shellcode.split(" ")
shellcode=""	
for b in conjbytes:
	shellcode = b + " " +shellcode
	
"""De acuerdo a los argumentos, imprimimos la salida"""
if(args.numerico): # Si esta activada la bandera '-n'
	shellcode3=re.sub("\s","",shellcode.strip())
	print shellcode3
elif(args.unicoder): # Si esta activada la bandera '-u'
	shellcode2="\\u00"+re.sub("\s","\\u00",shellcode.strip())
	print shellcode2
else: # Salida por defecto
	shellcode1="\\x"+re.sub("\s","\\x",shellcode.strip())
	print shellcode1

