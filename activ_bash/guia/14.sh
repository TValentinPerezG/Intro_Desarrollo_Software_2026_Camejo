#Crear un script de Bash que solicite al usuario el ingreso de un 
#número par. En caso de que sea impar, solicitarlo nuevamente.

#!/bin/bash

read -p "Ingrese un numero par: " num

if [ $((num % 2)) -eq 0 ]; then
    echo "Es par"
else
    condi=1
    while [ $condi -ne 0 ]; do
        read -p "El numero no era par. Ingrese un numero par: " n
        if [ $((n % 2)) -eq 0 ]; then
            echo "Es par"
            condi=0
        fi
    done
fi