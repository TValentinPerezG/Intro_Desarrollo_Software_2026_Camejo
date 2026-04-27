-- Ejercicio 1: El nombre y ranking de las peores 5 canciones de la historia (según fulanito), ordenadas de peor a mejor ranking (¡la peor va primero!).

select nombre, ranking
from canciones
order by ranking desc
limit 5;

-- Ejercicio 2: El nombre de todos los albumes de la banda The Beatles.

select a.nombre from albumes a
join bandas b on a.banda_id = b.id
where b.nombre = 'The Beatles';

-- Ejercicio 3: El nombre de todas las bandas que tienen al menos un álbum lanzado antes o en el año 1980. (¡que no se repitan las bandas!)

select distinct b.nombre as banda from albumes a
join bandas b on a.banda_id = b.id
where a.lanzamiento <= 1980;

-- forma de la guia guia

select distinct b.nombre from bandas b
join albumes a on a.banda_id = b.id
where a.lanzamiento <= 1980;

-- Ejercicio 4: El nombre y la fecha de los conciertos que se realizaron en el país "Argentina" y que tuvieron lugar antes del año 2010.

select nombre, fecha from conciertos
where pais = 'Argentina'
and fecha < 2010;

-- Ejercicio 5: La suma de la duración de todas las canciones de la banda Queen.

select sum(c.duracion) as total_duracion from canciones c
join bandas b on b.id = c.banda_id
where b.nombre = 'Queen';

-- Ejercicio 6: La suma de la duración de todos los álbumes de la banda The Rolling Stones.

select sum(a.duracion) as total_duracion from albumes a
join bandas b on b.id = a.banda_id
where b.nombre = 'The Rolling Stones';

-- Ejercicio 7: El nombre de los conciertos a los cuales asistió la banda Dire Straits.

select c.nombre from conciertos c
join conciertos_musicos cm on cm.concierto_id = c.id
join bandas b on cm.banda_id = b.id
where b.nombre = 'Dire Straits';

-- Ejercicio 8: El nombre de las bandas que tienen al menos un álbum con una duración menor a 40 minutos (¡que no se repitan las bandas!).

select distinct b.nombre from bandas b
join albumes a on a.banda_id = b.id
where a.duracion < 40;
