# Objetivo: Entender y modificar permisos

# 1. Crear un archivo llamado secreto.txt con algún contenido
# 2. Quitar todos los permisos a group y others
# 3. Verificar los permisos
# 4. Crear un script que imprima la fecha
# 5. Intentar ejecutarlo (debería fallar, por qué?)
# 6. Darle permisos de ejecución y volver a intentar

#1
touch secreto.txt

#2
chmod 700 secreto.txt

#3
ls -l secreto.txt

#4
touch fecha.sh

echo '#!/bin/bash' > fecha.sh
echo 'fechaa=$(date)' >> fecha.sh
echo 'echo "$fechaa"' >> fecha.sh

#5
./fecha.sh

#6
chmod +x fecha.sh
./fecha.sh

