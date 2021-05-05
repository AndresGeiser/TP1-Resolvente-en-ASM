%include "io.inc"
extern printf
section .data

    vector dd 1.5,2.5,3.5,2.0 ;Declaramos el vector de numeros en punto flotante simple (4 bytes por elemento)
    limite equ ($ - vector)   ;Declaramos el limite del vector (es decir, para un vector de 4 elementos dd, 4 elementos * 4 bytes = 16)
    msg db 'La sumatoria de todos los elementos del arreglo es: ',0xa,0 
    resultado db '%f', 0xA, 0
        
section .text

global main
main:
    mov ebp, esp; for correct debugging ;borrar
    push ebp
    mov ebp, esp; for correct debugging
    push ebx
    
    mov esi,vector          ;Movemos el vector a esi
    mov ebx,vector+limite   ;Movemos el limite del vector 

    fldz                    ;Seteamos el valor de st0 en 0
           
ciclo:  
    fadd dword[esi]         ;Sumamamos a st0 el valor del elemento actual
    add esi,4               ;Apuntamos al siguiente elemento
    cmp esi,ebx             ;Comparamos la posicion actual con el limite
    JE fin                  ;Si ambos coinciden, se recorrieron todos los elementos, por lo tanto cortamos el ciclo

    loop ciclo  
    
fin:
    push msg
    call printf
    fstp qword [esp]
    mov ebx,[resultado]
    push resultado
    call printf
    
    pop ebx
    mov esp,ebp
    pop ebp
    
    ret
    
    
    
