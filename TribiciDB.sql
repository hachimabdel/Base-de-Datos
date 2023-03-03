 DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS estaciones CASCADE;
DROP TABLE IF EXISTS bicicletas CASCADE;
DROP TABLE IF EXISTS uso CASCADE;


CREATE TABLE usuarios(
	dni 				VARCHAR (10),
	nombre 				VARCHAR NOT NULL,
	apellidos			VARCHAR (20) NOT NULL,
	direccion			VARCHAR,
	telefono			VARCHAR NOT NULL,
	email				VARCHAR NOT NULL,
	passw				VARCHAR NOT NULL,
	saldodisponible		NUMERIC NOT NULL DEFAULT 0,
	
	CONSTRAINT pk_dni PRIMARY KEY (dni),
	CONSTRAINT ck_usuarios_sin_espacios CHECK (passw NOT LIKE '% %'),
	CONSTRAINT ck_usuarios_longitud CHECK (LENGTH(passw) BETWEEN 4 AND 8)

);

CREATE TABLE estaciones(
	codestacion 		VARCHAR(10) CHECK (codestacion ILIKE 'E%',
	nombrenumestacion 	INTEGER NOT NULL,
	direccion			TEXT NOT NULL,
	latitud				NUMERIC NOT NULL,
	longitud			NUMERIC NOT NULL,
	latlng VARCHAR GENERATED ALWAYS AS (latitud || longitud)

	CONSTRAINT pk_codestacion PRYMARY KEY (estaciones) 
);

CREATE TABLE bicicletas(
	codbicicletas 		SERIAL,
	marca 				VARCHAR NOT NULL,
	modelo				VARCHAR NOT NULL,
	fechaalta			DATE NOT NULL,
	
	CONSTRAINT pk_codbicicleta PRIMARY KEY (bicicletas) 
);

CREATE TABLE uso(
	estacionsalida 		VARCHAR,
	fechasalida 		DATE,
	dniusuario			VARCHAR,
	codbicicleta		INT,
	estacionllegada		TEXT,
	fechallegada		DATE NOT NULL,
	
	CONSTRAINT pk_estacionsalida_fechasalida_dniusuario_codbicicleta_estacionllegada
	PRIMARY KEY (uso),
	CONSTRAINT fk_estacionsalida
);



ALTER TABLE 




























