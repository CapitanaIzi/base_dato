/* Comandos que usemos en mysql */
/* -------------------------- CREATE ------------------------*/

--Crea una base de datos

CREATE DATABASE primer_db;

USE primer_db;

-- Crear una tabla
CREATE TABLE productos(
    id INT PRIMARY KEY AUTO_INCREMENT, /* primary key nos indica q es algo importante y se pone para q cumpla ser una llave primaria y asi va a funcionar como identificador unico*/
    precio FLOAT DEFAULT 9999999, /* hay q pensar bien el nro de defecto*/
    nombre VARCHAR (20) /*(20)longitud de caracteres limite*/
);
INSERT INTO productos (precio, nombre) VALUES (500000.123, "notebook"); /* INSERT INTO= Insertar en*/
INSERT INTO productos (precio, nombre) VALUES (0.230, "notebook ojala");

INSERT INTO productos () VALUES ();
INSERT INTO productos (nombre) VALUES ( "algo");

---------------------------- FIN CREATE ---------------------
 
/* -------------------------- READ ---------------------*/
--Muestra las bases de datos existentes
SHOW DATABASES;

/* ver las tablas */
SHOW TABLES;

/* ver los productos de una tabla */
SELECT * FROM productos;

/* -------------------------- FIN READ ---------------------*/

/* -------------------------- UPDATE ---------------------*/
/* para agregar*/
ALTER TABLE productos ADD COLUMN tiene_oferta TINYINT (1) DEFAULT 0; /*ALTER TABLE= Modificar tabla. ADD= a. TINYINT =es para q sea 0 o 1. es como usar Boolaneos. DEFAULT 0= es 0 para q sea falso. xq todo nro Distinto a 0 es True */
ALTER TABLE productos ADD COLUMN peso FLOAT;
ALTER TABLE productos ADD COLUMN tamanio FLOAT NOT NULL;/*No puede ser Null*/

ALTER TABLE productos ADD COLUMN unidad VARCHAR(3) NOT NULL; /*No puede ser Null en este caso como es VARCHAR crea un Vacio que seria 0 y lo convierte en caracter vacio= "" que es False*/

UPDATE productos
SET peso= 2 WHERE id =1; /*Set= definir. El WHERE es muy importante, xq sino se agrega en todos los productos*/

UPDATE productos
SET peso= 4 WHERE id =2;

UPDATE productos
SET unidad= "KG" WHERE id =1;

/* -------------------------- FIN UPDATE ---------------------*/

/* -------------------------- DELETE ---------------------*/
DELETE FROM productos WHERE id= 3;
DELETE FROM productos WHERE id= 2; /* Sino ponemos WHERE se borra todo por completo para Siempre */

/* -------------------------- FIN DELETE ---------------------*/



/* https://sqlbolt.com/
https://eufacoprogramas.com/sql-consultas-com-join/

- Encuentra todas las películas de Toy Story:
SELECT * FROM movies WHERE title LIKE ("%Toy Story%") ;
ejemplo: (nombre de la columna) LIKE "%AT%"
(coincide con "AT", "ATTIC", "CAT" o incluso "BATS")

- Encuentra todas las películas dirigidas por John Lasseter:
SELECT * FROM movies WHERE director="John Lasseter";

Encuentra todas las películas (y directores) no dirigidas por John Lasseter:
SELECT * FROM movies WHERE director !="John Lasseter";

Encuentra todas las películas de WALL- 
SELECT * FROM movies WHERE title LIKE "Wall-_"; 
ejemplo: col_name LIKE "AN_"
(coincide con "AND", pero no "AN")
Se usa en cualquier parte de una cadena para que coincida un solo carácter (solo con LIKE o NOT LIKE)

Filtrado y ordenación de los resultados de la consulta:
- Enumerar todos los directores de películas de Pixar (alfabéticamente), sin duplicado
SELECT DISTINCT Director FROM movies ORDER BY director ASC; 

- Enumere las últimas cuatro películas de Pixar estrenadas (ordenadas de la más reciente a la menos)
SELECT  title FROM movies ORDER BY year DESC LIMIT 4; 

- Enumera las siguientes cinco películas de Pixar ordenadas alfabéticamente
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;  (El OFFSET es no incluyente) offset es Punto de inicio.

Consultas SELECT simples:
- Enumere todas las ciudades canadienses y sus poblaciones
SELECT city,population FROM north_american_cities WHERE Country= "Canada" ORDER BY city ASC;

 - Ordena todas las ciudades de los Estados Unidos por su latitud de norte a sur
 SELECT city FROM north_american_cities WHERE country= "United States"  ORDER BY latitude DESC; 

 - Enumera todas las ciudades al oeste de Chicago, ordenadas de oeste a este
 SELECT * FROM north_american_cities WHERE longitude <-87.629798 ORDER BY longitude ASC;

 - Listar las dos ciudades más grandes de México (por población)
 SELECT city FROM north_american_cities WHERE country="Mexico" ORDER BY population DESC LIMIT 2;

 - Enumere la tercera y cuarta ciudades más grandes (por población) de los Estados Unidos y su población
 SELECT * FROM north_american_cities WHERE country="United States"  ORDER BY population DESC LIMIT 2 OFFSET 2 ;


Consultas de varias tablas con JOIN: Me quede en la leccion 6

Para combinar datos de fila en dos tablas separadas usando esto clave única. La primera de las uniones que presentaremos es la .JOININNER JOIN

- Encuentra las ventas nacionales e internacionales de cada película:
SELECT * FROM movies INNER JOIN boxoffice ON movie_id=movies.id;

- Muestre las cifras de ventas de cada película a la que le fue mejor a nivel internacional que a nivel nacional
SELECT * FROM movies INNER JOIN boxoffice ON movie_id=movies.id WHERE International_sales>Domestic_sales;
 
-Enumere todas las películas por sus clasificaciones en orden descendente 
SELECT * FROM movies INNER JOIN boxoffice ON movie_id=movies.id ORDER BY rating DESC;

Lesson 7: UNIONES EXTERNAS
- Encuentra la lista de todos los edificios que tienen empleados 
SELECT DISTINCT building_name FROM Buildings  JOIN Employees ON building_name=building;
- Encuentra la lista de todos los edificios y su capacidad
SELECT * FROM Buildings;
- Enumere todos los edificios y los distintos roles de los empleados en cada edificio (incluidos los edificios vacíos)
 SELECT DISTINCT building_name,role FROM Buildings LEFT JOIN Employees ON Building_name= building;
 
 Lesson 8: Una breve nota sobre los valores NULL
 - Encuentre el nombre y la función de todos los empleados que no han sido asignados a un edificio ✓
 SELECT * FROM employees WHERE building is null;
 - Encuentre los nombres de los edificios que no tienen empleados
 SELECT * FROM buildings LEFT JOIN Employees ON building_name=building WHERE building is null;
 
 
 Lesson 9: Consultas con expresiones
 - Enumere todas las películas y sus ventas combinadas en millones de dólares
 SELECT title,(Domestic_sales + International_sales)/1000000 AS total FROM movies JOIN Boxoffice ON movie_id=movies.id;
 
 - Enumere todas las películas y sus calificaciones en porcentaje
  SELECT title,rating * (100/10) AS rating_porcentaje FROM movies JOIN boxoffice ON movies.id = movie_id;  // aca tambien podria ser rating * 10 y daba el porcentaje sin decimal
 
 - Enumere todas las películas que se estrenaron en años pares
 SELECT title,year FROM movies WHERE year %2=0;
  
  Lesson 10: Consultas con agregados (Pt. 1)
 - Encuentre el tiempo más largo que un empleado ha estado en el estudio
  SELECT MAX(Years_employed) FROM employees;

 - Para cada puesto, encuentre el número promedio de años empleados por los empleados en ese puesto.
 SELECT *, AVG(Years_employed) AS promedio_anios FROM employees GROUP BY role;
 - Encuentre el número total de años de empleados trabajados en cada edificio.
 SELECT *,SUM(Years_employed) AS suma_empleados FROM employees GROUP BY Building;
 
 Lección SQL 11: Consultas con agregados (Parte 2)
 - Encuentra el número de artistas en el estudio (sin cláusula HAVING )
  SELECT role, COUNT(role)AS Numero_de_artistas FROM employees WHERE role = "Artist";

 - Encuentra el número de empleados de cada rol en el estudio.
  SELECT role, COUNT(role)AS Numero_de_empleados FROM employees Group by role; 
 - Encuentre el número total de años empleados por todos los ingenieros.
  SELECT *, SUM(Years_employed) AS años_empleados FROM employees Group by role HAVING role="Engineer"; 
 Lección 12 de SQL: Orden de ejecución de una consulta
 - Calcula el número de películas que ha dirigido cada director.
SELECT director, COUNT(title) AS peli_dirigidas FROM movies Group by director; 
 - Encuentre las ventas totales nacionales e internacionales que se pueden atribuir a cada director
SELECT director, SUM (Domestic_sales + International_sales) AS ventas_por_director FROM movies JOIN boxoffice ON movie_id=movies.id  Group by director;
 


 Lección 13 de SQL: Inserción de filas
 - Agrega la nueva producción del estudio, Toy Story 4 a la lista de películas (puedes usar cualquier director)
 INSERT INTO movies (title, director) VALUES ("Toy Story 4","Lee Unkrich"); 
 - ¡Toy Story 4 ha sido lanzado con gran éxito de crítica! Tenía una calificación de 8,7 y ganó 340 millones a nivel nacional y 270 millones a nivel internacional . Agregue el registro a la BoxOfficetabla.
 INSERT INTO boxoffice ( movie_id,rating, Domestic_sales, International_sales ) VALUES (15, 8.7, 340000000, 270000000);  pero al modificarse todo tambien se puede poner solo: INSERT INTO boxoffice VALUES (15, 8.7, 340000000, 270000000);

Lección 14 de SQL: Actualización de filas
 - El director de Bichos está equivocado, en realidad fue dirigida por John Lasseter
 - El año en que se estrenó Toy Story 2 es incorrecto, en realidad se estrenó en 1999
 - ¡Tanto el título como el director de Toy Story 8 son incorrectos! El título debería ser "Toy Story 3" y fue dirigida por Lee Unkrich
 */

-- Una función común que se utiliza para contar el número de filas del grupo si no se especifica ningún nombre de columna. De lo contrario, cuente el número de filas del grupo con valores no NULL en la columna especificada.   COUNT(column)
-- Encuentra el valor numérico más pequeño en la columna especificada para todas las filas del grupo.  MIN(column)
-- Encuentra el valor numérico más grande en la columna especificada para todas las filas del grupo.  MAX(column)
-- Encuentra el valor numérico promedio en la columna especificada para todas las filas del grupo.  AVG(column)
-- Encuentra la suma de todos los valores numéricos en la columna especificada para las filas del grupo.   SUM(column)
/* SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column; 
-------------------
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;


*/



CREATE TABLE electrodomesticos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    precio FLOAT DEFAULT 9999999,
    nombre VARCHAR (20)
);
INSERT INTO electrodomesticos (precio, nombre) VALUES (500000.123, "notebook");
INSERT INTO electrodomesticos (precio, nombre) VALUES (0.230, "jarra ojala");
INSERT INTO electrodomesticos () VALUES ();
INSERT INTO electrodomesticos (nombre) VALUES ( "licuadora");

ALTER TABLE electrodomesticos ADD COLUMN tiene_oferta TINYINT (1) DEFAULT 0;
ALTER TABLE electrodomesticos ADD COLUMN peso FLOAT;
ALTER TABLE electrodomesticos ADD COLUMN tamanio FLOAT NOT NULL;