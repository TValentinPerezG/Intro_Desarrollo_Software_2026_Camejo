# Enunciado

Lucas y Martín juegan todas las semanas un partido de fútbol con su grupo de amigos. Para organizar  
quiénes juegan, utilizan un grupo de WhatsApp donde alguien envía una lista y los demás se anotan. Sin  
embargo, este sistema genera problemas frecuentes: la persona que envía la lista suele tener prioridad porque  
ya está anotada, y quienes ven el mensaje tarde muchas veces quedan afuera porque los cupos se llenan  
rápidamente.  
Cansados de esta situación, deciden crear un sistema que permita a todos anotarse de manera más  
ordenada y justa. La idea inicial es desarrollar una aplicación web donde cada jugador pueda registrarse y  
anotarse a los partidos semanales, evitando confusiones y mejorando la organización.   
Tomás, que no participa en los partidos pero tiene interés en el desarrollo de software, se suma al   
proyecto. Le entusiasma la idea y propone pensar el sistema con una visión más amplia, no solo para resolver   
el problema actual sino también para agregar nuevas funcionalidades en el futuro.  
A medida que avanzan las conversaciones, Tomás sugiere que el sistema podría incluir  
funcionalidades adicionales como carga de resultados, estadísticas de rendimiento por jugador, historial de  
partidos e incluso registro de lesiones. También plantea que, a largo plazo, podrían ofrecer la plataforma a  
otros grupos de jugadores o equipos, ampliando el alcance del sistema.  
El equipo decide comenzar con una aplicación web simple como primera versión, dejando abierta la  
posibilidad de desarrollar una aplicación móvil más adelante. Sin embargo, surgen diferencias en algunas  
decisiones técnicas clave que deberán resolver antes de comenzar a desarrollar.  
Por un lado, Lucas y Martín proponen desarrollar todo el sistema utilizando scripts en Bash, ya que es  
una herramienta que conocen. Por otro lado, Tomás no está convencido de que sea la mejor opción y sugiere  
evaluar alternativas más adecuadas para este tipo de aplicación.  



# Preguntas
1. Lucas y Martín deciden que el lenguaje para hacer el sistema sea Bash, pero Tomás no está
convencido. ¿Creés que Bash es una buena opción para desarrollar una aplicación web como la
descripta? Justificá tu respuesta.

### R: Creo que Bash no es recomendable, ya que no es una herramienta especializada en presentacion web ni bases de datos, si no que es mas optima para automatizacion, scripts cortos o instalaciones, y la aplicacion web no aprovecha ninguna de las particularidades que hacen a bash util como su capacidad de comunicarse directamente con el SO al ser shell y terminal.

2. Tomás propone utilizar GitHub para el desarrollo del proyecto.
¿Qué es GitHub y en qué aspectos creés que beneficiaría al equipo utilizarlo?

### R: GitHub es una herramienta que utiliza git, un sistema que mantiene registros de versiones de archivos dentro de repositorios, y permite trabajar con estos mismos de forma grupal y "a distancia" (planeo cambiar esto luego de repasar mejor), con el que se pueden enviar y traer lo que fue trabajando cada miembro del proyecto a este. Utilizar GitHub le daria al equipo un orden, les permitiria mantener un registro de todos los cambios que se fueron haciendo al proyecto, y les dejaria trabajar con branches que permiten hacer cambios de prueba al sistema sin alterar a la version principal ya disponible, ademas de poder poner estos cambios para que tus compañeros los vean y te den feedback en estos mismos. En general, GitHub facilita de gran manera el trabajo de varios miembros en un mismo proyecto a la vez, y permite el testing y prueba mas sencilla de funcionalidades o mejoras que aun no estan listas para ponerse en la version final.


3. Pensando en el sistema que quieren construir, ¿qué tablas, campos y relaciones debería tener la base
de datos?
Explicá claramente:
- qué entidades principales existirían (por ejemplo: jugadores, partidos, etc.)
- qué relaciones hay entre ellas
- cuáles serían las claves foráneas (foreign keys) y para qué sirven
Se recomienda justificar todas las decisiones.

### R: Tomando las ideas que se mencionan en el enunciado, deberian tener las siguientes entidades 
#### jugadores, con los campos dni, nombre, apellido, numero, posicion_id 
#### partido, con los campos id, fecha, hora y cancha_id 
#### cancha con id, nombre y direccion 
#### posicion con id, nombre 
#### lesiones con id, jugador_dni, lugar de lesion y partido_id (el partido en el que se lesiono), tiempo lesionado 
#### partido jugado, tabla intermedia entre partido y jugadores, con id, partido_id, jugador_dni y rendimiento 
### las relaciones entre las tablas son 
#### jugadores y posicion 1:M, los jugadores tienen 1 posicion y las posiciones muchos jugadores, (aunque se podria hacer de N:M y hacer otra tabla intermedia mas, no me parece necesario pero podria ser) 
#### partido y cancha: 1:M un partido tiene una sola cancha, una cancha tiene muchos partidos 
#### lesion y jugador: 1:M un lesion tiene un solo jugador, un jugador puede lesionarse mucho 
#### jugador y partido N:M un jugador juega muchos partidos, y un partido tiene muchos jugadores
### Las claves foraneas sirven para vincular las entidades entre si, evitando ingreso de datos repetitivos y manteniendo la integridad de estos, y se utilizan para todas las relacion dichas antes. 
#### posicion_id en jugadores 
#### cancha_id en partido 
#### jugador_dni y partido_id en lesiones 
#### jugador_dni y partido_id en jugador_partido

4. Escribí una sentencia de SQL que muestre información de (al menos) 2 tablas, y esté ordenada.
Explicá en un párrafo qué es lo que se supone que la sentencia muestra.

### R: 
#### select j.nombre, j.apellido, p.fecha, l.lugar from lesiones l 
#### join jugadores j on j.dni = l.jugador_dni 
#### join partido p on p.id = l.partido_id 
#### where l.lugar = 'rodilla'
#### order by apellido desc;
### La sentencia muestra el nombre y apellido de todos los jugadores que se lesionaron alguna vez la rodilla, en que fecha ocurrio, y los ordena por apellido. Conecta las tablas de lesiones, jugadores y partidos.

5. Respecto a la Ingeniería de Software ¿Qué etapas de la ingeniería de software se aplicaron hasta
ahora?

### R: Tomando las 6 etapas que vimos en la clase, creo que esta en la tercera, implementacion. Ya se paso la primer etapa, requerimiento, al definir como trabajaria la web, que funcionalidades se quieren y que cosas se desean abarcar, y se comprende el alcance a uno menor de un grupo de amigos. Tambien se completo la segunda fase, diseño, al tener ya los requerimientos funcionales de que cosas tendra nuestra web, y los requerimientos no funcionales de con que se trabajara para este proyecto (SQL, GitHub, etc). Por lo que considero que estamos en la etapa de implementacion, en la que estamos utilizando metodologias y haciendo modelos de lo que seran las features de nuestro sistema, exactamente lo que abarca la fase de modelo. Para la siguiente fase, testing, ya tenemos que tener un sistema con base y construido para poder hacer pruebas, verificaciones, etc, que todavia no podemos hacer con este sistema.

6. Tomás leyó por ahí “Docker”, pero no entiende bien si le sirve o no “Los 3 tenemos compus con Linux”
piensa. ¿Crees que les serviría utilizar Docker en este proyecto? ¿Por qué?

### R: Si, Docker seria ideal para este proyecto. Docker permite crear contenedores temporales y aislados con versiones especificas de servicios como python o sql, evitando asi que se generen problemas a causa de diferencias de versiones. El tener todos computadoras Linux hace que el uso de docker sea mas sencillo ya que no es necesaria la instalacion de Docker Desktop, y se sigue recomendando incluso en estos sistemas porque siguen existiendo diferentes versiones de muchos programas incluso si el Linux es el mismo
### Ademas, el ser temporales permite que estos contenedores sean excelentes para el testeo del funcionamiento optimo de cualquier funcionalidad que se quiera integrar en el sistema.