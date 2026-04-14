#Crear un script de Bash que solicite el ingreso de un número n 
#y que luego calcule su factorial.

#!/bin/bash

read -p "Ingrese un numero para obtener su factorial: " n

cont=1
acu=1

while [ $cont -le $n ]; do
    acu=$(($acu * $cont))
    ((cont++))
    echo $acu
done

echo $acu