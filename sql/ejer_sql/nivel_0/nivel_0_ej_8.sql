-- Ejercicio 8: El nombre y la duración de todas las canciones, ordenadas por duración (de más larga a más corta).

select nombre, duracion 
from albumes 
order by duracion desc;