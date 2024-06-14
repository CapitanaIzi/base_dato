/* Comandos que usemos en mysql */
/* -------------------------- CREATE ------------------------*/

/* Crea una base de datos*/

CREATE DATABASE primer_db;

USE primer_db;

/* Crear una tabla*/
CREATE TABLE productos(
    id INT PRIMARY KEY AUTO_INCREMENT, /* primary key nos indica q es algo importante*/
    precio FLOAT DEFAULT 9999999, /* hay q pensar bien el nro de defecto*/
    nombre VARCHAR (20) /*(20)longitud de caracteres limite*/
);
INSERT INTO productos (precio, nombre) VALUES (500000.123, "notebook"); /* INSERT INTO= Insertar en*/
INSERT INTO productos (precio, nombre) VALUES (0.230, "notebook ojala");

INSERT INTO productos () VALUES ();
INSERT INTO productos (nombre) VALUES ( "algo");

/* -------------------------- FIN CREATE ---------------------*/

/* -------------------------- READ ---------------------*/
/* Muestra las bases de datos existentes*/
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



/* - Encuentra todas las películas de Toy Story:
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
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;  (El OFFSET es no incluyente)

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
Encuentra las ventas nacionales e internacionales de cada película

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