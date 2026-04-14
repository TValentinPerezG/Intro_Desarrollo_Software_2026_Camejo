# Crear un script que:
# 1. Pedir el nombre del usuario
# 2. Pedir su edad
# 3. Calcular en qué año nació (aproximado)
# 4. Mostrar un mensaje personalizado con toda la info

#!/bin/bash

echo "Ingrese su nombre: "
read nombre
echo "Ingrese su edad: "
read edad

anio=$(( 2026 - $edad ))

echo "Te llamas $nombre, tenes $edad años, y por lo tanto naciste aprox en el año $anio"