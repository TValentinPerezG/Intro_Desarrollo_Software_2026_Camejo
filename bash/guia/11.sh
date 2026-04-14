#Crear un script de Bash que realice las 4 operaciones básicas (suma, resta, multiplicación y división) 
#a dos números enteros ingresados por el usuario. Crear una función para cada una de las operaciones.

#!/bin/bash

sumar() {
    sum=$(($1 + $2))
    echo "$1 + $2 = $sum"
}

restar() {
    rest=$(($1 - $2))
    echo "$1 - $2 = $rest"
}

multiplicar() {
    mult=$(($1 * $2))
    echo "$1 * $2 = $mult"
}

dividir() {
    div=$(($1 / $2))
    echo "$1 / $2 = $div"
}

read -p "Ingrese el primer numero: " num1
read -p "Ingrese el segundo numero: " num2

sumar $num1 $num2
restar $num1 $num2
multiplicar $num1 $num2
dividir $num1 $num2
