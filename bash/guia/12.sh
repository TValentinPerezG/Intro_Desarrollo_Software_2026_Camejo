#Crear un script de Bash que imprima los primeros n números naturales. 
#Solicitar al usuario el ingreso de n.

#!/bin/bash

read -p "Elije que cantidad de numeros naturales mostrar: " n

con=1

while [ $con -le $n ]; do
    echo $con
    ((con++))
done