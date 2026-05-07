-- Ejercicio 1: El nombre de las bandas cuyos álbumes (todos) duran más de 50 minutos.

select b.nombre from bandas b
where not exists(
  select 1 from albumes a
  where a.banda_id = b.id
  and a.duracion <= 50
);

-- Ejercicio 2: El nombre de las canciones (con el nombre de su álbum) que pertenecen a álbumes lanzados después del año 2000. Ordenarlas por nombre de álbum (de A a Z), y por cada álbum, por nombre de canción (de Z a A).

select c.nombre as cancion, a.nombre as album from canciones c
join albumes a on c.album_id = a.id
where a.lanzamiento > 2000
order by a.nombre asc, c.nombre desc;

-- Ejercicio 3: El nombre de las bandas con menos de 5 integrantes y de género "Rock Alternativo", cuyas canciones duran 4 o más minutos (todas ellas).

select b.nombre from bandas b
where b.cant_integrantes < 5 
and b.genero = 'Rock Alternativo'
and not exists(
  select 1 from canciones c
  where c.banda_id = b.id
  and c.duracion < 4
);

-- Ejercicio 4: El concierto con más bandas participantes, mostrando el nombre del concierto y la cantidad de bandas que participaron.

select c.nombre, count(*) as bandas_participantes from conciertos
join conciertos_musicos cm on c.id = cm.concierto_id
group by c.id
order by bandas_participantes desc
limit 1;

-- Ejercicio 5: El nombre de los álbumes cuyas bandas fueron al menos a un concierto en el país "Argentina", ordenados por ranking de mejor a peor.

select a.nombre from albumes
join 

-- Ejercicio 6: La cantidad de canciones que tiene cada banda, ordenadas de mayor a menor cantidad de canciones. Mostrar el nombre de la banda y la cantidad de canciones.

