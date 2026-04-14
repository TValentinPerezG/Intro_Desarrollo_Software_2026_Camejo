# 1. Crear esta estructura de carpetas:
#    proyecto/
#    ├── src/
#    ├── docs/
#    └── data/

# 2. Crear 3 archivos .py vacíos en src/
# 3. Crear un archivo README.md en docs/ con algún contenido
# 4. Copiar el README.md a la raíz del proyecto
# 5. Renombrar uno de los archivos .py
# 6. Borrar la carpeta data/

# 1
mkdir proyecto2

cd ./proyecto2

mkdir src
mkdir docs
mkdir data

# # 2
cd ./src

touch vacio1.py
touch vacio3.py
touch vacio2.py

# # 3
cd ../docs

touch README.md

echo "Hola Mundo" > README.md

# 4
cd ./proyecto2/docs

cp ./README.md ../

#5
cd ../src

mv ./vacio1.py ./renombre.py

#6
cd ../

rmdir ./data

