### Casos de Uso
- Para usar servicios utiles como servidores, gitlab, etc
- Si estoy desarrollando algo con varios servidores y puedo ver

### Imagen vs Contenedor  
- Punto de partida con unas instrucciones para la creacion de contenedores  
- Utilizamos esta imagen para crear cada uno de los contenedores, se puede usar varias veces, y tiene varios parametros y demas  
- Cuando compilo una imagen, ahi se ejecutan ciertas acciones, y con esas acciones ya ejecutadas en ese estado se crea nuestros contenedores  
- Una distribucion   
  
### Dockerfile  
- Del FROM ponemos de que imagen partimos, usando imagenes previas generales, tomando los archivos y programas instalados de esa, por ejemplo,   
si usamos la imagen de Ubuntu, partimos de los archivos y programas que trae Ubuntu, junto a todo lo que le quiera agregar yo  
- No se deberia usar de base varios FROM, si queremos distintos servicios tenemos que usar distintos contenedores para cada servicio  
- Siempre empieza con un from (Por ej, FROM ubuntu:24-04), donde se le da que programa y version usar, si no se le da version usara latest   
- Tu imagen es solo el kernel del Linux que tiene disponible, con el FROM le estamos diciendo que archivos y programas va a tener  
- Para un from "vacio", podrianmos FROM scratch  
- COPY . . nos deja agarrar un archivo de una carpeta y copiarlo a cierto lugar dentro de nuestra imagen
- ENV nos deja tener crear variables de entorno para cuando corramos el contenedor
- WORKDIR nos permite elegir a que directorio dirigirnos actualmente
- RUN me deja hacer un comando en medio de la compilacion de nuestra imagen
- Casi siempre termina con un CMD o entrypoint (por ej: CMD ["bash"])  
- No se pueden usar varios CDM, pero si se pueden usar varios archivos con distintos comandos dentro de ese CMD para que haga las acciones
- El CMD se ejecuta solo cuando se crea nuestro contenedor, no cuando cada vez que lo detengamos y comencemos de nuevo
- Para convertir este dockerfile en una imagen, tenemos que usar docker build para compilar la imagen en base a nuestro dockerfile
- Si copio un archivo en una imagen y luego la creo, el archivo ya quedo en esa imagen, por lo que si se lo pasamos a alguien mas
- Cuando ya queremos crearlo, debemos hacer "docker build -t [nombre]:[tag] [direccion de dockerfile]", por ej docker build -t web:v1 .

### Contenedor  
- Si agrego -it no se cierra apenas lo creamos, haciendolo interactivo
- Si agrego -rm se remueve apenas se termina de usar
- Docker exec ejecuta cosas dentro de un contenedor actualmente corriendo (por ej: docker exec -it [ID] bash) ejecutaria bash desde nuestro contenedor

### Puertos
- Tengo que linkear un puerto mio con el puerto en el que escuche nuestro servicio (por ejemplo, 80 para nginx, 5432 para postgres) (ej de clase: 8080:80)
- Seria como la entrada para acceder a nuestro
- Del 3000 para arriba suelen ser puertos libres, por lo que es recomendable usar estos
- Dependiendo del servicio es el puerto que usaremos, esto se puede ver en EXPOSE de la imagen, o en la documentacion.
- Si no linkeo el puerto, no tengo forma de acceder a esta puerta del contenedor

### Volumen
- Nos sirven si nuestro contenedor hace cosas sofisticadas, por las que requerimos que lo que editemos de nuestros archivos en el contenedor no se pierdan
- En principio pueden ser carpetas o archivos
- Para declarar un archivo agrego -v ./nombre/carpetas:/destino/contenedor
- esto nos creara una carpeta en el contenedor, y esta conectada a nuestra computadora, se la estamos prestando a nuestro contenedor
- si creo un archivo en ./nombre/carpetas, entonces en nuestro contenedor aparecera el archivo, porque estan conectados
- Si cambio los contenidos en nuestro archivo ya sea desde el contenedor o mi sistema, mi archivo va a aparecer igualemente en ambos casos
- Incluso si nuestro contenedor se borra, vamos a mantener los archivos y cambios en nuestro equipo
- El volumen son solo para los contenedores
- Se tiene que declarar el volumen cuando hacemos docker run o docker create, no se puede declarar mas tarde
- Si creamos nuestro volumen dentro de un directorio que ya viene con la imagen, pisa el contenido de ese mismo
- Si hacemos esto mismo de un archivo a otro dentro del contenedor, va a pisar el contenido de este archivo y mostrarnos el contenido de lo que tenemos nuestro equipo
- No puedo linkear un archivo del contenedor a otro que no exista, pero si un directorio del contenedor a un directorio en nuestro equipo
- Siempre tiene prioridad lo que esta en mi computadora, y si no esta me lo crea y le da prioridad
- Si vamos a pasarle el archivo a alguien mas como imagen, conviene no usar volumenes, en cambio, conviene para trabajo en el momento

### Docker Compose
- Es un orquestador de contenedores
- Es una forma de correr muchos contenedores a la vez
- docker-compose es la sintaxis vieja, intentar no usar
- para usarlo creo un archivo docker-compose.yml, compose.yml, compose.yaml, etc.
- dentro de este archivo tenemos que tener los servicios que vamos a tener, que van a cumplir y que contenedor actua con cada uno de ellos
  
services:  
  webserver:  
    image: nginx  
    ports:  
      \- 8000:80 
    volumes:
      \- ./mi_index.html:/user/share/nginx/html/index.html

- una vez iniciado, esto es lo mismo que poner docker run -p 8000:80 -name webserver -v ./mi_index.html:/user/share/nginx/html/index.html
 nginx
- ahora, si hacemos docker compose up va a buscar nuestro archivo y levantar nuestro nginx junto con todos los otros servicios que hayan
- si ponemos docker compose down, nos remueve todos los contenedores que nos creo
- ahora si pruebo esto:  
  
services:  
  webserver:  
    image: nginx  
    ports:  
      \- 8000:80  
    volumes:  
      \- ./mi_index.html:/user/share/nginx/html/index.html  
  webserver2:  
    image: nginx  
    prots:  
      \-8080:88  
- esto nos dara 2 archivos, uno que muestre exactamente lo de la imagen y uno que nos muestre lo que esta en la imagen que usamos
- si en lugar de usar una imagen general y queremos usar un dockerfile para nuestra propia imagen, tenemos que darle la localizacion de este mismo dockerfile:  
services:  
  webserver:    
    build: .  
    image: web:v2 //esto le cambia el nombre a nuestra imagen que se crea con el dockerfile  
    ports:  
      \- 8000:80  
- entonces, ahora hacemos docker compose build para que se compile nuestra imagen, y luego docker compose up
- si hacemos docker compose ps nos muestra los contenedores de nuestro archivo
- si hacemos docker compose exec [nombre] nos ejecuta algo en ese servicio en especifico, por ejemplo "docker compose exec webserver bash"
- Por defecto el docker compose me crea una red con todos los contenedores, por lo que si se levantan de esta manera se pueden comunicar

### Explicacion codigo ejemplo  

FROM ubuntu:24-04 //traigo la imagen de ubuntu a mi imagen  

COPY ./src/hello /hello //copio el archivo hello de la carpeta src y lo pego en la raiz de mi futuro contenedor  

CDM ["/hello"] //apenas se haga el run/start de nuestro contenedor, se ejecutara el archivo hello  
