;Para compilar: 
;nasm -f elf32 resolvente.asm -o resolvente.o
;gcc -m32 -o ejecutable resolvente.o input.c

;Variables Globales externas (constantes), recibidas por parametro
    %define a qword [ebp+8]
    %define b qword [ebp+16]
    %define c qword [ebp+24]
    
    %define resultado1 dword [ebp+32]
    %define resultado2 dword [ebp+36]
    
    %define aux qword [ebp-8]
    %define dos_por_a qword [ebp-16]

section .data 
    menoscuatro: dw -4
   
section .text ;Codigo a ejecutar
global cuadratica
cuadratica:
    ;ebp(Base Pointer) y esp(StackPointer) son punteros a la pila
    
    push ebp        ;Subimos ebp a la pila
    mov ebp,esp     ;Movemos esp a ebp para no sobreescribir datos
    
    sub esp,16      ;Reservamos  16 bytes en la pila
    
    ;Calculo de la operacion -4*a*c
    push ebx
    
    fild word [menoscuatro] ;Subimos el -4 al tope de la pila ST(0)         estado de la pila: -4
    
    fld a                   ;Subimos a la pila 'a'                          estado de la pila: a, -4   
    fld c                   ;Subimos a la pila 'c'                          estado de la pila: c, a, -4
    fmulp st1               ;Multiplicamos c por el valor anterior a        estado de la pila: a*c, -4
    fmulp st1               ;Multiplicamos a*c por el valor anterior -4     estado de la pila: -4*a*c
    
   ;Calculo de la operacion b*b -4*a*c
    
    fld b                   ;Subimos a la pila 'b'                                         estado de la pila: b, -4*a*c
    fld b                   ;Subimos a la pila 'b' nuevamente para realizar el cuadrado    estado de la pila: b, b, -4*a*c
    
    fmulp st1               ;Multiplicamos b por b                          estado de la pila: b*b, -4*a*c
    faddp st1               ;Sumamos ambos terminos                         estado de la pila: b*b + (-4*a+c) = b*b -4*a*c
    
   ;Calculo de la raiz positiva
    
    fsqrt                   ;Calculamos la raiz cuadrada de b*b -4*a*c     estado de la pila: sqrt(b*b -4*a*c) 
    fstp aux                ;Subimos a la pila 'aux'                       estado de la pila: vacio y aux (resultado anterior)
    fld1                    ;Subimos 1 a la pila                           estado de la pila: 1
    fld a                   ;Subimos a la pila 'a'                         estado de la pila: a, 1
    fscale                  ;Duplicamos el valor de 'a'                    estado de la pila: 2*a, 1
    fdivp st1               ;Dividimos 1 por 2*a                           estado de la pila: 1/(2*a)
    fst dos_por_a           ;Subimos a la pila 'dos_por_a'                 estado de la pila: 1/(2*a)
    fld b                   ;Subimos a la pila 'b'                         estado de la pila: b, 1/(2*a)
    fld aux                 ;Subimos a la pila 'aux'                       estado de la pila: aux, b, 1/(2*a)
    fsubrp st1              ;Invertimos el orden de aux y b                estado de la pila: aux - b, 1/(2*a)
    fmulp st1               ;Multiplicamos aux - b por el termino 1/(2*a)  estado de la pila: (-b + aux)/(2*a)
    
    mov ebx,resultado1      
    fstp qword [ebx]        ;Almacenamos el primer resultado (positivo)
    
   ;Calculo de la segunda raiz
    
    fld b                   ;Subimos a la pila 'b'                         estado de la pila: b
    fld aux                 ;Subimos aux a la pila                         estado de la pila: aux, b
    fchs                    ;Cambiamos el signo de aux                     estado de la pila: -aux, b
    fsubrp st1              ;Invertimos el orden de aux y b                estado de la pila: -aux - b
    fmul dos_por_a          ;Subimos a la pila 'dos_por_a'                 estado de la pila: (-aux -b)/(2*a)
    
    mov ebx,resultado2
    fstp qword [ebx]        ;Almacenamos el segundo resultado (negativo)
    mov eax,1               ;Retornamos el valor 1 (Ejecucion exitosa)

    pop ebx
    mov esp,ebp
    pop ebp
    
    ret
