#Crear un script de Bash que le solicite al usuario 
#el ingreso de un número e indicar si el número es mayor, menor o igual a 0. Imprimir por pantalla.

#!/bin/bash

echo "Ingrese un numero: "
read num

if [ $num -lt 0 ]; then
    echo "El numero es menor a 0"
elif [ $num -gt 0 ]; then
    echo "El numero es mayor a 0"
else
    echo "El numero es igual a 0"
fi