#Crear un script de Bash que reciba las longitudes de los lados de un triángulo y que luego 
#indique si se trata de un triángulo equilátero, isósceles o escaleno.

#!/bin/bash

long1=$1
long2=$2
long3=$3

if [ $long1 -eq $long2 ] && [ $long2 -eq $long3 ]; then
    echo "Es un triangulo equilatero"
elif [ $long1 -ne $long2 ] && [ $long2 -ne $long3 ] && [ $long1 -ne $long3 ]; then
    echo "Es un triangulo escaleno"
else
    echo "Es un triangulo isoceles"
fi