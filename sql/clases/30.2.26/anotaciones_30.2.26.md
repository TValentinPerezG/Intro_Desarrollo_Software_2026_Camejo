Tablas maestras

tablas para guardar informacion que no cambia nunca o cambia muy poco

Estructura de creacion de tablas

Tenemos que crear primero las tablas si es que luego queremos crear otra tabla que tenga una foreing key de esta misma, entonces, si nuestro personaje tiene 

DEFINIR ID LLAVE PRIMARIA

Para definir una llave primaria podemos poner simplemente
id SERIAL PRIMARY KEY,

RELACION DE CLAVE FORANEA

ponemos el nombre de nuestra columna con INTEGER REFERENCES y el nombre de la otra tabla tal que asi:
id_otro INTEGER REFERENCES otra_tabla(id),

----

RELACIONAR MUCHOS A MUCHOS

creamos una tabla con un id y clave foranea de ambos casos

id

----

## Actividades en la clase

### Objetivo: Crear una base de datos de dragon ball
1. Definir un esquema de la base de datos
- Que tabla tenemos
- Que columna tiene cada tabla
- Como se relacionan entre ellas


2. Escribir sentencias de creacion de las tablas en SQL
- Hablar de ids autoincrementales y crearlos

3. Llenar de informacion las tablas

4. Hacer algunos querys simples

5. Ver JOINS 

Invertalo

- hacer consultas en multiples tablas

6. Funciones de agregacion 


1. Intentando hacer la idea de como lo vamos a hacer

Entidades

Personajes
- id
- nombre (varchar de 50)
- ki (entero)
- raza_id --> clave foranea
- planeta de origen_id --> clave foranea a planetas
- multiplicador de danio (entero)

Tecnicas
- id (entero)
- nombre (varchar de 50)
- descripcion (varchar 250)
- fuerte_contra_raza_id --> foreing key a razas
- tipo_id --> clave foranea a tipos
- danio base (entero)

Personajes y Tecnicas tienen relacion muchos a muchos  
un personaje tiene muchas tecnicas y una tecnica las pueden usar muchos personajes

Razas
- nombre 
- descripcion
- planeta de origen_id --> clave foranea a planetas

Vitacora de Tecnicas usadas
- personaje_id --> clave foranea a personajes
- tecnica_id --> clave foranea a tecnicas
- fecha_uso (date and time)
- impacto (bool si no)


Tablas Maestras 
Tipos
- nombre
- descripcion

Planeta de origen
- nombre
- descripcion


CREATE TABLE planetas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    nivel_gravedad INTEGER NOT NULL
);

CREATE TABLE tipos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250)
);

CREATE TABLE razas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    planeta_origen_id INTEGER REFERENCES planetas(id)
);

CREATE TABLE personajes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ki INTEGER NOT NULL,
    raza_id INTEGER REFERENCES razas(id),
    planeta_de_origen_id INTEGER REFERENCES planetas(id),
    multiplicador_danio INTEGER NOT NULL
);

CREATE TABLE tecnicas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    fuerte_contra_raza_id INTEGER REFERENCES razas(id),
    tipo_id INTEGER REFERENCES tipos(id),
    danio_base INTEGER NOT NULL
);

CREATE TABLE personaje_tecnica (
    id SERIAL PRIMARY KEY,
    personaje_id INTEGER REFERENCES personajes(id) NOT NULL,
    tecnica_id INTEGER REFERENCES tecnicas(id) NOT NULL
);

CREATE TABLE bitacora_tecnicas_usadas (
    id SERIAL PRIMARY KEY,
    personaje_id INTEGER  REFERENCES personajes(id) NOT NULL,
    tecnica_id INTEGER  REFERENCES tecnicas(id) NOT NULL,
    fecha_uso TIMESTAMP NOT NULL,
    impacto BOOLEAN NOT NULL
);

hacemos un docker en postgres, y en dbeaver abrimos este postgres y copiamos esto para que se creen las tablas

ahora vamos a hacer un insert para meter a goku

insert into personajes (nombre, ki, raza_id, planeta_origen_id, multiplicador_danio)
values ('Goku', 3000000, ??, ??, 10000)

vemos que si queremos crear a goku, primero tenemos uqe crear la raza

entonces primero hacemos planetas

insert into planetas (nombre, descripcion, nivel_gravedad)
values ('Planeta Vegeta', 'El planeta de los sayayines', 10);

vamos haciendo estos insert para cada cosa que necesitamos y despues le mandamos a claude para que nos genere una bocha de ejemplos

un caso que necesita una llamada especifica es:
si queremos una foreing key y no sabemos el numero, podemos poner una condicion

insert into personaje_tecnica (personaje_id, tecnica_id)



veamos unos querys de prueba

- queremos ver quienes tienen mas de 1000000 de ki:
select *
from personajes
where ki > 1000000

- sin usar join, ver que personajes tienen el kamehameha (tecnica 3)
select * from personaje_tecnica
where pt.tecnica_id = 3

nos da el id de todos los personajes (en este caso, 1, 3, 4, 16, 20, 40), y ahora hacemos :  

select * from personajes 
where id in (1, 3, 4, 16, 20, 40)

- queremos ver, sin join, que personajes vienen de la tierra

select * from razas  

select * from personajes p  
where p.planeta_de_origen_id = 2  

- queremos contar cuantos personajes tienen mas de 1000000 de ki
select count(*)
from personajes
where ki > 1000000

- queremos ver el promedio de ki de personajes de la tierra
select avg(ki) from personajes p
where p.planeta_de_origen_id = 2;

podemos usar estas para sacar suma, maximo, min, etc.
- personaje con mayor ki, personaje con menos ki, etc


### JOINS

- quiero listas todas las tecnicas que tiene goku
sin joins
1. ver id de goku
2. ir a tabla intermedia y ver cuales son los ids de las tecnicas con el id de goku
3. ir a la tabla tecnicas y listas las que coinciden con lo de arriba
select * from personaje p, tecnicas t, personaje_tecnica pt  
where p.id = pt.personaje_id  
and t.id = pt.tecnicas_id  
and p.nombre = 'Goku'  
o  
select * from personajes p  
join personajes_tecnica pt on pt.personaje_id = p.id  
join tecnicas t on t.id = pt.tecnica_id  
where p.nombre = 'Goku' 

- quiero listas los personajes y sus razas (ej: goku saiyajin mr satan humano etc)
select p.nombre, r.nombre from personaje p, razas r  
where p.raza_id = r.id 


- quiero listar todos los personajes con cierta tecnica  

select p.nombre from personaje p, tecnicas t, personaje_tecnica pt  
where p.id = pt.personaje_id  
and t.id = pt.tecnicas_id  
and t.nombre = 'Nombre'

- queremos listas los personajes y la tecnica que usaron solo los que impacataron
select p.nombre, t.nombre, btu.fecha_uso   
from personaje p, tecnicas t, bitacora_tecnicas_usadas btu  
where p.id = btu.personaje_id  
and t.id = btu.tecnica_id  
and btu.impacto = true  
o  
select p.nombre, t.nombre, btu.fecha_uso  
from bitacora_tecnicas_usadas btu  
join personajes p on p.id = btu.personajes_id  
join tecnicas t on t.id = btu.tecnica_id  
where btu.impacto = true  

##### Tenemos distintos tipos de Joins, y nos vamos a centrar en el Inner Join

suponiendo que:
Tabla A -> personajes
Tabla B -> raza
- Left Join: tenes un left join, osea que te pide que traigas todos los que tengan registros en la tabla a aunque no tengan tabla b
por ejemplo
 goku----saiyajin    
 krillin----()     
 majin boo----()   
 mr satan-----humano  
 trae todos los personajes incluso si no tienen raza, pero no traera razas sin personajes.
- Right Join: el inverso del anterior
 ej:  
 goku-----saiyajin   
 mr satan----humano   
 ()-----mago   
 nos trae argumentos que tengan un valor en la tabla b, aunque la tabla a en ese caso este vacia.  
- Inner Join: El que mas se va a usar, solo te va a traer casos donde ambos coinciden
- Full Join: te trae todo de ambas tablas donde se conecten, donde esta la tabla b y no la a, y viceversa  

ej de left join:   
select * from personajes p    
left join razas r on p.razas_id = r.id  
se muestran todos los personajes, incluso los que no tienen razas  
ej de right join:  


el inner join tiene una sintaxis mas comoda:  
select * from personaje p, razas r  
where p.raza_id = r.id  

tenemos que tener cuidado de siempre especificar de que tabla estamos tomando cada dato, por ejemplo, no podemos poner nombre asi simplemente porque la raza y los humanos tienen nombres, asi que debemos poner r.nombre o p.nombre