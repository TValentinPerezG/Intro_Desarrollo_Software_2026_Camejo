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

# Revision en clase de respuestas

3. Pensando en el sistema que quieren construir, ¿qué tablas, campos y relaciones debería tener la base  
de datos?  
Explicá claramente:  
- qué entidades principales existirían (por ejemplo: jugadores, partidos, etc.)  
- qué relaciones hay entre ellas  
- cuáles serían las claves foráneas (foreign keys) y para qué sirven  
Se recomienda justificar todas las decisiones.  

R: Al ser un grupo de amigos, considero que normalmente no ha equipos fijos  
Por lo tanto, los jugadores van a ir mezclandose  

### jugadores(id, nombre_completo, posicion_preferida, fecha_nacimiento, nacionalidad, dni)

CREATE TABLE jugadores(  
    id SERIAL PRIMARY KEY,  
    nombre_completo VARCHAR(100) NOT NULL,  
    posicion_preferida VARCHAR(50),  
    fecha_nacimiento DATE,  
    nacionalidad VARCHAR(50) DEFAULT "Argentina",  
    dni INTEGER,  
    email VARCHAR(255) UNIQUE NOT NULL,
    clave VARCHR(255) NOT NULL
);  

### partidos (id, fecha_hora, lugar, goles_local, goles_visitante)

CREATE TABLE partidos(  
    id SERIAL PRIMARY KEY,  
    fecha_hora TIMESTAMP NOT NULL,  
    lugar VARCHAR(200) NOT NULL,  
    goles_local SMALLINT NOT NULL,  
    goles_visitante SMALLINT NOT NULL  

);  
En el caso de goles_* podria ser un tipo de dato que solo contemple numero >= 0  

### jugadores_partido (id_jugador, id_partido, equipo(local|visitante))
#### Si fuera solo de relacion, no seria una entidad porque solo seria un intermediario que relaciona a las otras 2, ahora, como tiene info especifica adentro, pasa a ser otra entidad mas

CREATE TABLE jugadores_partidos(
    id_jugador INT REFERENCES(jugadores) NOT NULL,
    id_partidos INT REFERENCES(partidos) NOT NULL,
    es_local BOOL NOT NULL,
    goles_anotados SMALLINT NOT NULL DEFAULT 0,
    asistencias SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_jugador, id_partido)
);

### inscripciones (id_partido, id_jugador, fecha_inscripcion)

CREATE TABLE inscripciones(
    id_jugador INT REFERENCES(jugadores),
    id_partido INT REFERENCES(partido),
    fecha_inscripcion TIMESTAMP NOT NULL
    PRIMARY KEY (id_jugador, id_partido)
);

- Tendriamos una tabla para los jugadores,la cual contrendria campos como un id autoincremental, el nombre del jugador, su email y contraseña para el sistema de registro como not null, y su edad, fecha de nacimiento y posicion preferida
- Tambien tendriamos una tabla con los partidos, donde tendriamos un id autoincremental, la fecha y hora donde tomo lugar, cuantos goles hicieron cada uno de los equipos, que distinguimos con local y visitante, o la direccion. Esta tabla nos da los datos del partido para el aspecto de registro que se menciono
- Tendriamos una tabla de inscripciones, la cual contiene una FK hacia un jugador y una FK hacia un partido, siendo la combinacion de estas 2 la Primary Key, donde vemos la fecha en la que se inscribio. En esta representa una relacion M:M entre los jugadores y los partidos, y es la que les permitira a los jugadores anotarse a los partidos a traves de la web.
- Finalmente, tendremos una tabla jugadores_partidos, que utiliza las mismas FK de la tabla inscripciones, y nos dara informacion especifica de cada jugador en el partido jugado, como los goles que hizo, en que equipo jugo, y sus asistencias. Su primary key tambien es la tupla de las Foreing Key.

Las entidades principales son los jugadores y los partidos  
Las relaciones que tenemos son desde jugadores_partidos e inscripciones hacia la tabla de jugadores y la tabla de partidos. Las FK sirven para referencias las primary key de otras tablas, relacionando a ambas  

4. Escribí una sentencia de SQL que muestre información de (al menos) 2 tablas, y esté ordenada.
Explicá en un párrafo qué es lo que se supone que la sentencia muestra.

Goles hechos por partido (fecha) por cada jugador (nombre completo)

SELECT j.nombre_completo, p.fecha_hora, jp.goles_anotados FROM jugadores_partidos jp
JOIN jugadores j ON j.id = jp.id_jugador
JOIN partidos p ON p.id = jp.id_partidos
ORDER BY p.fecha_hora DESC, jp.goles_anotados DESC, j.nombre_completo;

Esta sentencia busca en 3 tablas distintas los datos del nombre del jugador, la fecha del partido, y la cantidad de goles anotados por ese jugador en ese partido

Se muestra para cada partido, su fehca y la cantidad de goles anotados por cada jugador, con el nombre de este mismo. Ordenada primero por fecha del partido de mas viejo a mas reciente, y dentro de este orden se ordena por goles anotados, de mas goles a menos, y si hay empate en esto, se muestra en orden alfabetico segun el nombre del jugador.

5. Respecto a la Ingeniería de Software ¿Qué etapas de la ingeniería de software se aplicaron hasta ahora?



6. Tomás leyó por ahí “Docker”, pero no entiende bien si le sirve o no “Los 3 tenemos compus con Linux”
piensa. ¿Crees que les serviría utilizar Docker en este proyecto? ¿Por qué?

### Por mas que tengamos el mismo sistema operativo, no significa que tengamos las mismas versiones de dependencias, y mas con linux ya que estas tienen muchas versiones con distintas dependencias y distintas versiones de estas mismas.
### Incluso con los beneficios de hacer un contenedor que sirven para trabajo individual, como el manternos consistentes con nuestras dependencias, y los testeos aislados de los elementos de nuestro sistema, el mejor componente es poner facilitar el trabajo grupal en el proyecto al trabajar todos con las mismas dependencias, mismas configuraciones, mismos puertos, mismas versiones, y en general nos aseguramos de que se va a comportar de la misma manera para los demas que en nuestro desarrollo local, evitando sorpresas indeseables en cuanto a problemas en el servidor o con el equipo.
### Utiliza el kernel y los nucleos de mi computadora, 

1. Lucas y Martín deciden que el lenguaje para hacer el sistema sea Bash, pero Tomás no está
convencido. ¿Creés que Bash es una buena opción para desarrollar una aplicación web como la
descripta? Justificá tu respuesta.

### Haciendo muchos malabares se podria conseguir que bash haga este sitio web, pero hay otras herramientas como javascript o python que estan pensadas para este tipo de sistemas web, por lo que bash, que se centra en automatizacion, scripts cortos, no para trabajar un servidor web al tener una naturaleza mas corta y menos teniendo disponibles herramientas mucho mas optimizadas para este trabajo.

2. Tomás propone utilizar GitHub para el desarrollo del proyecto.
¿Qué es GitHub y en qué aspectos creés que beneficiaría al equipo utilizarlo?

### GitHub es una plataforma para hostear repositorios de git, permitiendo trabajar las cualidades de git, como seria el mantener el registro de versiones y trabajar con versiones activas, las branches para que cada miembro trabaje en aspectos sin pisar el trabajo de sus compañeros, y siendo el aspecto mas beneficioso que permite tener estos en la nube, haciendo que estos cambios esten disponibles para todos los miembros en todo momento, y permitiendo hacer cosas como pull request para que todo los miembros puedan ver estos cambios y denotar problemas o cambios necesarios en estos.

## ejercicio extra:

Tomas recolectó un montón de equipos que podrían usar el sistema y los guardó en un archivo csv.  
El formato del archivo es   
NombreEquipo;PartidosPorSemana;TeléfonoContacto;MailContacto  
Quieren arrancar contactando a quienes jueguen 1 vez por semana y el Mail sea un gmail.  

Escribir una expresión regular que liste los equipos a contactar  

### R:
### ^[^;]+;1;[^;]+;[^@]+(@gmail\.com)$
comienza la linea (^)  
busca caracteres distintos a ; 1 o mas veces ([^;]+)  
busca ;1; (;1;)  
busca caracteres distintos a ; 1 o mas veces ([^;]+)  
busca ; (;)  
busca caracteres distintos a @ 1 o mas veces ([^@]+)  
busca exactamente @gmail.com, con una \ antes del . para que busque el caracter y no el uso de . de que sea cualquier caracter (@gmail\.com)  
esto ultimo tiene que ser al final de la linea ($)  