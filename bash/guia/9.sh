#Crear un script de Bash que reciba un nombre. Si el nombre ingresado es “Manu” imprimir por pantalla “Hola, profe”, 
#de no ser así imprimir por pantalla “Hola, (nombre)”

#!/bin/bash

nom=$1

if [ "$nom" = "Manu" ]; then
    echo "Hola, profe"
else   
    echo "Hola, $nom"
fi