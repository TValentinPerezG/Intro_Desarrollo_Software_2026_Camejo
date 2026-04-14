#Crear un script de Bash que solicite la edad del usuario y determine si es mayor o menor de edad.

#!/bin/bash

echo "Ingrese un edad: "
read edad

if [ $edad -lt 18 ]; then
    echo "Usted es menor de edad"
else
    echo "Usted es mayor de edad"
fi