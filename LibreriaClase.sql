DROP TABLE IF EXISTS libro CASCADE;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS editorial;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS edicion;

CREATE TABLE autor(
	dni 			VARCHAR(10),
	nombre 			TEXT NOT NULL,
	nacionalidad 	TEXT,

	CONSTRAINT pk_dni PRIMARY KEY (dni)
);

CREATE TABLE genero (
	id_genero		SMALLSERIAL,
	nombre			VARCHAR NOT NULL,
	descripcion		TEXT,
	CONSTRAINT pk_genero PRIMARY KEY (id_genero)
);

CREATE TABLE editorial (
	cod_editorial 		SERIAL,
	nombre				VARCHAR NOT NULL,
	direccion			VARCHAR,
	poblacion			VARCHAR,
	CONSTRAINT pk_editorial PRIMARY KEY (cod_editorial)
);

CREATE TABLE libro(
	isbn 			varchar(15),
	titulo 			TEXT NOT NULL,
	dni_autor 		VARCHAR(10) NOT NULL,
	cod_genero 		INT NOT NULL,
	cod_editorial 	INT NOT NULL,

	CONSTRAINT pk_libro PRIMARY KEY (isbn),

);


CREATE TABLE edicion (
	isbn					VARCHAR(15),
	fecha_publicacion		DATE,
	cantidad				INTEGER,
	CONSTRAINT pk_edicion PRIMARY KEY (isbn, fecha_publicacion),
	CONSTRAINT ck_edicion_cantidad CHECK (cantidad > 0),
)
ALTER TABLE edicion
ADD CONSTRAINT fk_edicion_libro FOREIGN KEY (isbn) REFERENCES libro ON DELETE CASCADE;

ALTER TABLE libro
ADD CONSTRAINT fk_dni_autor FOREIGN KEY (dni_autor) REFERENCES autor,
ADD	CONSTRAINT fk_cod_genero FOREIGN KEY (cod_genero) REFERENCES genero,
ADD	CONSTRAINT fk_cod_editorial FOREIGN KEY (cod_editorial) REFERENCES editorial;




































