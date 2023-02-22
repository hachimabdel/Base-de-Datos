DROP TABLE IF EXISTS libro;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS editorial;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS edicion;


CREATE TABLE libro(
	isbn		  		varchar(15),
	titulo		  		text NOT NULL,
	dni_autor		  	varchar(10) NOT NULL,
	cod_genero			integer NOT NULL,
	cod_editorial		integer NOT NULL,
	CONSTRAINT pk_isbn PRIMARY KEY (isbn),
	CONSTRAINT fk_libro_autor FOREIGN KEY(dni_autor) REFERENCES autor(dni)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_libro_genero FOREIGN KEY(cod_genero) REFERENCES genero
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_libro_editorial FOREIGN KEY(cod_editorial) REFERENCES editorial
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE autor(
	dni		  			text,
	nombre		  		text NOT NULL,
	nacionalidad		text,
	CONSTRAINT pk_dni PRIMARY KEY (dni)
);

CREATE TABLE editorial(
	cod_editorial		integer,
	nombre		   		text NOT NULL,
	direccion			text,
	poblacion			text,
	CONSTRAINT pk_cod_editorial PRIMARY KEY (cod_editorial)
);

CREATE TABLE genero(
	id_genero			integer,
	nombre		  		text NOT NULL,
	descripcion			text,
	CONSTRAINT pk_id_genero PRIMARY KEY (id_genero)
);

CREATE TABLE edicion(
	isbn		  		varchar(15),
	fecha_publicacion	date,
	cantidad			integer,
	CONSTRAINT pk_edicion PRIMARY KEY (isbn),
	CONSTRAINT fk_edicion_libro FOREIGN KEY (isbn) REFERENCES libro(isbn) 
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT ck_cantidad_positiva CHECK (cantidad > 0)
);


select *
from edicion;

select *
from genero;

select *
from autor;