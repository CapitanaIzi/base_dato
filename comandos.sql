/* Comandos que usemos en mysql */
/* -------------------------- CREATE ------------------------*/

/* Crea una base de datos*/

CREATE DATABASE primer_db;

USE primer_db;

/* Crear una tabla*/
CREATE TABLE productos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    precio FLOAT DEFAULT 9999999,
    nombre VARCHAR (20)
);
INSERT INTO productos (precio, nombre) VALUES (500000.123, "notebook");
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
ALTER TABLE productos ADD COLUMN tiene_oferta TINYINT (1) DEFAULT 0;
ALTER TABLE productos ADD COLUMN peso FLOAT;
ALTER TABLE productos ADD COLUMN tamanio FLOAT NOT NULL;


/* -------------------------- FIN UPDATE ---------------------*/
