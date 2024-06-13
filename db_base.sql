/* El conjunto de comandos para reiniciar la base de datos */
CREATE DATABASE primer_db;
USE primer_db;
CREATE TABLE productos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    precio FLOAT DEFAULT 9999999, 
    nombre VARCHAR (20),
    tiene_oferta TINYINT (1) DEFAULT 0,
    peso FLOAT,
    unidad VARCHAR(3) NOT NULL,
    tamanio FLOAT NOT NULL
    );
INSERT INTO productos (precio, nombre,unidad,tamanio) VALUES (500000.123, "notebook","KG",500);
INSERT INTO productos (precio, nombre,unidad,tamanio) VALUES (0.230, "notebook ojala","KG",500);
INSERT INTO productos (unidad,tamanio) VALUES ("KG",500);
INSERT INTO productos (nombre,unidad,tamanio) VALUES ( "algo","KG",500);
SELECT * FROM productos;
