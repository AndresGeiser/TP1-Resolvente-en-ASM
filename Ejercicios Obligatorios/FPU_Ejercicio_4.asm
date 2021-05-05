%include "io.inc"

section .data

    vector dd 1.5,2.5,3.5,2.5 ;Declaramos el vector de numeros en punto flotante simple (4 bytes por elemento)
    limite equ ($ - vector)  ;Declaramos el limite del vector (es decir, para un vector de 4 elementos dd, 4 elementos * 4 bytes = 16)

section .text

global CMAIN
CMAIN:

    mov ebp, esp; for correct debugging
    
    mov esi,vector          ;Movemos el vector a esi
    mov ebx,vector+limite   ;Movemos el limite del vector 

    fldz                    ;Seteamos el valor de st0 en 0
    
ciclo:  
    fadd dword[esi]
    add esi,4
    
    cmp esi,ebx
    JE fin

    loop ciclo  
    
fin:

       
    
    
       