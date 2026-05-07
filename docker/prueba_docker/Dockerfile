FROM gcc:latest

# Copiar el archivo C
COPY prueba.c /app/prueba.c

WORKDIR /app

# Compilar el programa
RUN gcc prueba.c -o prueba

# Ejecutar el programa al iniciar el contenedor
CMD ["./prueba"]