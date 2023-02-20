DROP TABLE IF EXISTS my_first_table;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS categorias;

CREATE TABLE my_first_table (
	first_column		text,
	second_column		integer
);

CREATE TABLE productos(
	num_producto  		serial,
	nombre		  		text,
	precio		  		numeric(6,2) DEFAULT 9.99,
	fecha_creacion		timestamp DEFAULT CURRENT_TIMESTAMP,
	descuento			numeric DEFAULT 0,
	precio_desc			numeric GENERATED ALWAYS AS (precio *(1 - descuento)) STORED
);

INSERT INTO 
		productos (nombre, precio)
VALUES ('iPhone 14 Pro', 499.99);

INSERT INTO
			productos (nombre)
VALUES ('Movil');

INSERT INTO
			productos (nombre, precio)
VALUES ('A tope',9999.99 );

INSERT INTO
			productos (nombre, precio)
VALUES ('A tope con decimales',1000.99 );

INSERT INTO
			productos (nombre, precio)
VALUES ('A tope 2',10000.01);

INSERT INTO
			productos (nombre, precio)
VALUES ('PC', 499.9);

INSERT INTO
			productos(nombre) 
VALUES ('Auriculares');

CREATE TABLE categorias (
	cod_categoria		smallserial,
	nombre				text
);


CREATE TABLE alumno(
	nombre					varchar(100),
	apellido1				varchar(200),
	apellido2				text,
	num_asign				smallint,
	nota_media				numeric (4,2),
	fecha_nacimiento		date,
	matricula				date,
	edad_31_dic				int2
);

INSERT INTO alumno(nombre, apellido1, apellido2, num_asign, nota_media, fecha_nacimiento, matricula, edad_31_dic)
VALUES ('Abdel', 'Hachim', 'Leftakh', 7, 8.52 );


SELECT *
FROM productos;

SELECT *
FROM alumnos;





SELECT *
FROM productos;


















































































