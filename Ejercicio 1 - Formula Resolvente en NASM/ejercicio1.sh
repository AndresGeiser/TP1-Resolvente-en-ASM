#!/bin/bash
echo "___________________________________________________"
echo ""
echo "TP1 - Organizacion del Computador 2 - Andres Geiser"
echo "Compilando Formula Resolvente..."
nasm -f elf32 resolvente.asm -o resolvente.o
gcc -m32 -o ejecutable resolvente.o input.c

echo "Compilación Exitosa"
echo "___________________________________________________"
echo "Ejecutando..."
echo ""

./ejecutable
while true 
do
echo "¿Desea volver a ejecutar? S/N"
read respuesta

if [[ $respuesta == S || $respuesta == SI || $respuesta == s ]]; then
            printf "\033c"
            sleep .25
            ./ejecutable
elif [[ $respuesta == N || $respuesta == NO || $respuesta == n ]]; then
            echo "___________________________________________________"
            echo ""
            echo "Finalizando Ejecución..."
            echo "___________________________________________________"

            sleep 1.5s
            printf "\033c"
            exit 
else 
            echo "Ingrese una opción correcta -> (S/N)"    
            echo ""           
fi
done                   
exit
