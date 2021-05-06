# TP1 "Resolvente en ASM" Organizacion del Computador-II
Resolución del primer trabajo practico individual


**Consigna**: Realizar un programa para la arquitectura IA32 que calcule las raíces de una función
cuadrática a través de la fórmula resolvente. Los coeficientes a, b y c de la función
deben ser recibidos por parámetro. Considerar que estos podrían tomar valores de
punto flotante o no.

**Resolución**: Para la ejecución de la resolución del ejercicio se realizó un script bash que se encarga de compilar el código y enlazar el código de los archivos .c y .asm de manera automática, generando un archivo ejecutable en el cual se realiza un pasaje de parámetros de los valores ingresados a una función desarrollada en lenguaje ensamblador **NASM** y luego son mostrados por pantalla los resultados obtenidos desde **C**.

**Ejecutar el programa mediante Bash**:
Para ejecutar el programa mediante el script bash es importante asignar permisos al archivo. Para ello debemos ingresar por terminal ```chmod +x /ejercicio1.sh``` de esta forma podremos ejecutarlo mediante el comando ```./ejercicio1.sh```. 

![image](https://user-images.githubusercontent.com/54609896/116950958-f908bc00-ac5c-11eb-9bb1-3cbdf86d83a4.png)
Seguido de ello se nos mostrará el siguiente menú donde podemos ingresar los valores numéricos para obtener las raices de la función requerida (el formato de los números de punto flotante es, por ejemplo **1.5**), como primer prueba ingresaremos numeros enteros (**1**, **-9** y **8**):

![image](https://user-images.githubusercontent.com/54609896/117231824-62700280-adf6-11eb-85b7-da64e98cb239.png)

