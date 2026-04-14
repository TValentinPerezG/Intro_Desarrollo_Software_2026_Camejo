#Crear un script de Bash que reciba un número entero e indique si el número es par o impar.

#!/bin/bash

ent=$1

if (( ent % 2 == 0 )); then
    echo "Es par"
else
    echo "Es impar"
fi