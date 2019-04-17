section .text
global _start
_start:
	xor ecx, ecx; Comenzamos haciendo ecx igual a 0
	jmp for     ; Saltamos al for
for:
	push ecx      ; Guardamos el valor del contador en la pila
	mov edx, len_p; Pasamos la longitud de la cadena a imprimir
	mov ecx, ms_p ; Pasamos el apuntador a la cadena a imprimir
	mov ebx, 1    ; Pasamos el valor del descriptor de archivo
	mov eax, 4    ; Syscall sys_write
	int 0x80      ; Hacemos la llamada al sistema
	pop ecx       ; Regresamos al contador el valor guardado en la pila
	inc ecx       ; Incrementamos el valor del contador
	cmp ecx, 10   ; Comparamos el contador con 10
	jl for        ; Si es menor a 10 repite lo de for, si no, continua
	mov eax, 1    ; sys_exit
	int 0x80      ; Se hace la llamada al sistema para salir

section .data
	ms_p: db "Esta cadena se debe repetir 10 veces.", 0xa
	len_p: equ $ - ms_p
