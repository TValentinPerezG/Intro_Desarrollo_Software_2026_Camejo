# Docker
___
## ¿Que es Docker?

####  Docker es una herramienta que nos permite generar un empaquetado junto con nuestra app que nos permite tener nuestros programas y librerias necesarias.
####  Esto permite evitar problemas en cuanto a versiones de servicios externos, y es excelente para el desarrollo en equipo, evitando cambios de estado.
####  Si por ejemplo, nuestro compañero con una versión distinta de Pythom podria tener resultados distintos en nuestro programa, aqui entra Docker, que deja que nuestra versión de Python conectada a nuestro programa, evitando este tipo de problemas.

______

## Servicios y Puertos

*En esta materia vamos a ver una definicion especifica de servicio, pero en esta materia solo utilizaremos esta* 

#### Servicio es un programa que esta corriendo y esta esperando a recibir ordenes.
####  Ejemplos de estos pueden ser un servidor para un programa como Apache, MySQL, etc.

####  Un puerto es el numero de puerta donde escucha el servicio, esto para que un servicio no escuche lo que no era para este.
####  Le podemos definir un puerto especifico a nuestro servicio, y siempre que queramos contactar a este mismo, se usara ese puerto.
####  Algunas convenciones de puertos comunes son:
- :80 HTTP
- :443 HTTPS
- :5432 Postgres
- :3306 MySQL
- :6379 Redis
- :3000 Tu App
####  Se puede usar el puerto que se quiera, pero si se quiere hacer un cambio a puertos comunes, sistemas como Google no te van a tomar esto.
####  Si intentamos pedirle al S.O. un puerto ya usado, este no nos dejara y nos dira que ya esta en uso.

______

## Virtualizacion

####  Vitualizar es crear una version virtual (por software) de un elemento usualmente fisico.
####  Creamos lo que seria una computadoras independientes dentro de nuestra computadora.
####  Esto crea instancias virtualizadas unicas, separadas de las otras instacias virtualizadas y de nuestro propio sistema

####  Hay varios motivos por los que querriamos entornos aislados
- Conflictos de dependencias: Si una App A necesita Python 3.8 y otra que requiere Python 3.12, estas chocarian, tenerlas en entorno separado lo resuelve
- Seguridad: Si una app es comprometida, no puede afectar a las demas al estar en maquinas distintas
- Reproducibilidad: Nos deja tener un entorno consistente en todos lados, bueno para desarrollo, testing y produccion
- Testing: Levantar, probar, destruir y probar lo que se quiera sin generar consecuencias en el sistema principal.

#### Asignacion de recursos
#### Los servidores fisicos corren al 10-15% de utilización del sistema
#### Generar maquinas virtuales dentro de ese sistema, que se pueden usar aisladamente y trabajan a la vez, deja que saquemos mucho mayor provecho de un mismo Haardware
####  Asi es como funcionan los servidores en la Nube y por esto son economicamente viables.

_____

## VMs vs Contenedores

###  Arquitectura de una Maquina Virtual
-Tenemos el Hardware de mi equipo como base
- Luego tenemos el SO Host dde nuestro sistema
- Tenemos un Hypervisor, programa que instalamos para crear los S.O. invitados
- Isntalamos los SOs para cada guest
- En cada uno de estos SOs trabajamos las Apps
### Arquitectura de un Contenedor
- Hardware
- SO Host
- Tenemos un programa llamado Docker Engine, que utiliza el kernel de nuestro SO Host
- Tenemos cada uno de nuestros programas en equipos separados


#####  El utilizar el mismo kernel que el host nos permite no tener un SO guest por cada app. 
#####  Pero tenemos que tener acceso al Kernel, lo que hace que esto este limitado a Linux.
#####  Para otros SOs, se necesita un Hypervisor que tenga un SO guest con Kernel Linux para ejecutar la app de Docker Engine, que luego puede contener las otras apps.
#####  Basicamente, al no necesitar virtualizar todo un sistema para cada Programa separado, trabajamos de forma mucho mas liviana pero no tan aislada como una MV.

### Comparativa entre MV y Contenedor
Arraque: Mv: Minutos Contenedor: Segundos
Tamaño: MV: GBs (SO Comppleto) Contenedor: MBs (Solo app)
Aislamiento: MV: Fuerte (Kernel Separado) Contenedor: Bueno pero con kernel compartido
Rendimiento: MV: Overhead Contenedor: Casi nativo
Densidad: MV: Unas decenas por host Contenedor: Unos cientos por host

### Cuando usar VMs
- Necesitas utilizar un SO diferente al que tenes
- Se requiere aislamiento fuerte para la seguridad (Por ejemplo, con los servidores de Nube que deben separarse)
- Aplicacion legacy (Tenemos un kernel similar pero una version distinta)

###  Cuando usar un Contenedor
- Microservicios (Entornos de testing)
- Pipelines de CI/CD (En resumen, test automaticos y actualizaciones)
- Entornos de desarrollo
- Apps cloud-native

_____

## Contenedores

####  Los contenedores son un proceso aislado corriendo en tu maquina.
####  No es una maquina virtual liviana, es simplemente un proceso con distintos limites.
####  Cuentan con su propio:
- Sistema de Archivos (No puede acceder a los archivos del host)
- Interfaz de Red (No puede acceder a la red del host)
- Espacio de procesos (No puede ver los procesos de mi Host)

####  Son efímeros por naturaleza, están pensados para destruirlos y recrearlos fácilmente.
####  No guardan estado valioso, hay que tratarlos como descartables (Frase no tratarlo como mascotas, sino como ganado)

####  Los contenedores tienen 4 etapas de ciclo de vida
- Creado (docker create --name myapp nginx)
- Corriendo (docker start myapp)
- Detenido (docker stop myapp)
- Eliminado (docker rm myapp)
####  No es un ciclo de vida lineal, puede detenerse e iniciarse constantemente.

_____

## ¿Qué es una Imagen?

####  La imagen es como la plantilla de nuestro Contenedor. La imagen es una receta, y cada vez que la reproducimos estamos creando un contenedor
####  La imagen no es un archivo en si, es un concepto que creamos a traves de un archivo de configuracion especial, donde establecemos configuraciones, procesos, etc.
####  Ese archivo crea lo que queremos que tenga la imagen, y si compilamos este mismo archivo con las instrucciones de como debe ser la imagen, congela un contenedor de como debe ser el archivo.
####  Siempre necesitamos una imagen para un contenedor.
####  Un ejemplo seria un molde de herreria, en el que podemos probar distintos metales para ver cuales se rompen y cuales funcionan.

### Caracteristicas de la Imagen
- Una plantilla
- Solo se lee
- Puedo crear varios contenedores en base a la misma imagen

## Docker Hub
#### Docker Hub es un registro publico con imagenes preconstruidas que ya vienen con versiones especificas de programas
####  Algunos ejemplos son:
- docker pull nginx:latest
- docker pull python:3.12
- docker pull postgres:16
- docker pull node:20-alpine

####  imagen:tag - El tag nos dice la version de la imagen.
####  las variantes alpine son imagenes minimas con menor tamaño.
####  Si quiero un docker con distintos programas especificos, tenemos que crear una imagen personalizada con la combinacion de los programas
####  Si no usamos el :, se descarga la version mas nueva (latest)

_____

##  Docker CLI

####  Docker Inc: La empresa que creo Docker y ofrece servicios
####  Docker Engine: Herramienta gratuita
####

###  Creemos nuestro primer contenedor

####  Comando basico de docker: docker run [opciones] imagen [command]
####  cuando hacemos docker run, me queda agarrada la terminal al proceso
- #####  docker run nginx
####  no nos deja interactuar
####  -d --> corre en segundo plano
- #####  docker run -d nginx
####  actualmente no puedo hacer nada con el sistema porque esta aislado si no
####  -p 8080:80 --> mapeamos un puerto (8080) del host a un puerto (80) de nuestro contenedor
####  --name web --> le da un nombre que yo le puse a un contenedor, para no tener que llamarlo por su ID en los comandos
- #####  docker run -d -p 8080:80 --name web 
####  descargamos y ejecutamos Nginx (nginx es un contenedor web)

####  ahora, si ingreso al localhost:8080 a traves de la web, podria ver nginx desde el navegador

##  Comandos Utiles de Docker

- docker container ls, docker ps ---> nos deja ver una tabla con nuestros contenedores corriendo en el momento, con -a nos muestra detenidos
- docker stop (contenedor) --> el contenedor sigue existiendo pero no esta corriendo en el momento
- docker start (contenedor) --> inicia el contenedor
- docker rm (contnedor) --> borra un contenedor si es que este esta detenido (si no esta detenido va a dar error)
- docker rm -f (contenedor) --> fuerza a borrar un contenedor, incluso si esta corriendo
- docker logs (contenedor) --> nos devuelve los logs que habia hasta ese momento en el sistema
- docker logs -f (contenedor) --> te muestra los logs nuevos que se van generando
- docker exec (contenedor) (comando) --> nos permite ejecutar un comando dentro de un contenedor
- docker exec web ls --> hace un ls dentro del contenedor "web"
- ddocker exec -it web bash --> nos deja abrir bash dentro de nuestro contenedor, con el -it es lo que hace nuestro comando interactivo y hace que lo reconozca.
- docker pull python:3.12 --> nos descarga la imagen de la que dimos el nombre, en este caso descarga una version de python
- docker images --> nos muestra la lista de imagenes descargadas
- docker rmi (imagen):(tag) --> elimina la imagen
- docker build -t myapp:1.0 --> construir una imagen nosotros mismos

###  Como funciona si tengo un contenedor y una PC al azar quiere interactuar con este

####  El equipo mandara una peticion a un puerto del servidor, en este caso al puerto :80, y este mismo puerto nos redigire al puerto :8080 de nuestro contenedor.
####  Nuestro contenedor tiene un servicio escuchando el puerto 8080, para procesar lo que se recibio y despues regirigir la respuesta a la PC inicial.
####  Como cada contenedor es unico, ambos servidores pueden estar escuchando el puerto 8080 del contenedor, pero no el mismo puerto en el host
####  Osea, el segundo contenedor debe estar conectado a un puerto distinto del host, por ejemplo :81 en lugar de :80
####  Ejemplo, 80:8080 y 81:8080 pueden convivir, porque son peticiones desde un puerto distintos del host a 2 contenedores distintos, pero 80:8081 y 80:8080 no, porque el primero es del host y en el host no puede llevarnos de una misma peticion a varios puertos
