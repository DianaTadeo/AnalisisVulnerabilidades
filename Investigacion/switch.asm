section .text
global _start
_start:
	mov eax, 7; Se coloca el valor que va a revisar, en este caso puede ser cualquier entero
	cmp eax, 0; Realiza la primera comparacion (primer case del switch).
	je case0  ; Si el valor es 0, aplica la funcion de case0 como en un switch, si no, continua con los otros casos.
	cmp eax, 1; Realiza la segunda comparacion (segudo caso del switch).
	je case1  ; Si el valor es 1, realiza la accion de case1, si no, continua.
	cmp eax, 2; Realiza la tercera comparacion (tercer caso del switch).
	je case2  ; Si el valor es 2, realiza la accion de case2, si no, continua.
	jmp def   ; Si no fue ninguna de las anteriores realiza la accion por defecto (default en switch).
salir:
	mov eax, 1; syscall 1, sys_exit
	int 0x80  ; se hace la llamada al sistema para la terminacion de programa
case0:
	mov edx, len_c0 ; Guarda en edx la longitud del mensaje ms_0.
	mov ecx, ms_0   ; Guarda en ecx el apuntador a ms_0.
	mov ebx, 1      ; Se guarda el valor del file descriptor.
	mov eax, 4      ; sys_write.
	int 0x80	; Se hace la llamada al sistema.
	jmp salir       ; Salta a la funcion que termina el programa
case1:
	mov edx, len_c1 ; Guarda en edx la longitud del mensaje ms_1.
        mov ecx, ms_1   ; Guarda en ecx el apuntador a ms_1.
        mov ebx, 1      ; Se guarda el valor del file descriptor.
        mov eax, 4      ; sys_write.
        int 0x80        ; Se hace la llamada al sistema.
        jmp salir       ; Salta a la funcion que termina el programa
case2:
	mov edx, len_c2 ; Guarda en edx la longitud del mensaje ms_2.
        mov ecx, ms_2   ; Guarda en ecx el apuntador a ms_2.
        mov ebx, 1      ; Se guarda el valor del file descriptor.
        mov eax, 4      ; sys_write.
        int 0x80        ; Se hace la llamada al sistema.
        jmp salir       ; Salta a la funcion que termina el programa

def:
	mov edx, len_def ; Guarda en edx la longitud del mensaje ms_def.
        mov ecx, ms_def   ; Guarda en ecx el apuntador a ms_def.
        mov ebx, 1      ; Se guarda el valor del file descriptor.
        mov eax, 4      ; sys_write.
        int 0x80        ; Se hace la llamada al sistema.
        jmp salir       ; Salta a la funcion que termina el programa

section .data

	ms_0: db "Entra al caso 0", 0xa
	len_c0: equ $ - ms_0
	ms_1: db "Entra al caso 1", 0xa
        len_c1: equ $ - ms_1
	ms_2: db "Entra al caso 2", 0xa
        len_c2: equ $ - ms_2
	ms_def: db "Realiza accion por defecto.", 0xa
        len_def: equ $ - ms_def
