-- Ejercicio 3: El nombre y la fecha de creación de todas las bandas, ordenadas por fecha de creación (de más reciente a más antiguo).

select nombre, fecha_creacion 
from bandas 
order by fecha_creacion desc;