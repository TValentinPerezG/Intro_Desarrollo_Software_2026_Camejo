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

