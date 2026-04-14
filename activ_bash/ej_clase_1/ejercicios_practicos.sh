# 1. Averiguar cuál es tu directorio home
# 2. Listar todos los archivos (incluyendo ocultos) en tu home
# 3. Andar al directorio /var/log
# 4. Contar cuántos archivos hay
# 5. Volver a tu home con un solo comando
# 6. ¿En qué directorio estamos ahora?
# 1. 
echo $HOME 
# /home/valen
# cd /home
# 2
ls -a
# 3
cd /var/log
# 4
ls | wc -l
# 5
cd /home
# 6
pwd