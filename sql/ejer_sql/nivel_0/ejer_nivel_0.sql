-- Ejercicio 1: Todas las bandas musicales con sus respectivos campos (todos).

select * from bandas;

-- Ejercicio 2: Solo el nombre y el país de origen de todas las bandas.

select nombre, pais_origen from bandas;

-- Ejercicio 3: El nombre y la fecha de creación de todas las bandas, ordenadas por fecha de creación (de más reciente a más antiguo).

select nombre, fecha_creacion from bandas order by fecha_creacion desc;

-- Ejercicio 4: El nombre y el país de origen de todas las bandas que son del género "Rock".

select nombre, pais_origen from bandas where genero = 'Rock';

-- Ejercicio 5: Todos los álbumes con sus respectivos campos (todos)

select * from albumes;

-- Ejercicio 6: Solo el nombre y la duración de todos los álbumes, ordenados por orden alfabético de nombre (de A a Z).

select nombre, duracion from albumes order by nombre;

-- Ejercicio 7: El ranking y el nombre de todos los álbumes, ordenados de mejor (1) a peor ranking.

select ranking, nombre from albumes order by ranking;

-- Ejercicio 8: El nombre y la duración de todas las canciones, ordenadas por duración (de más larga a más corta).

select nombre, duracion from albumes order by duracion desc;

-- Ejercicio 9: El nombre y fecha de todos los conciertos, ordenados por fecha (de más antiguo a más reciente).

select nombre, fecha from conciertos order by fecha;
