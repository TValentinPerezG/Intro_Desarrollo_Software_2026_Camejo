-- Ejercicio 1: El nombre y el país de origen de todas las bandas que tienen exactamente 5 integrantes

select nombre, pais_origen from bandas where cant_integrantes = 5;

-- Ejercicio 2: El nombre y la duración de todos los álbumes que tienen una duración mayor a 40 minutos.

select nombre, duracion from albumes where duracion > 40;

-- Ejercicio 3: El nombre y la duración de todas las canciones que tienen una duración menor o igual a 3 minutos.

select nombre, duracion from canciones where duracion <= 3;

-- Ejercicio 4: El nombre y la fecha de todos los conciertos que se realizaron en el país "Argentina".

select nombre, fecha from conciertos where pais = 'Argentina';

-- Ejercicio 5: El nombre y ranking de los mejores 7 álbumes de la historia (según fulanito), ordenados alfabéticamente por nombre (de A a Z).

select nombre, ranking from albumes where ranking <= 7 order by nombre;
