DROP TABLE IF EXISTS empresas CASCADE;
DROP TABLE IF EXISTS alumno CASCADE;
DROP TABLE IF EXISTS alumno_asisten CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS tipo_curso CASCADE;



CREATE TABLE empresas(
	cif			VARCHAR,	
	nombre		VARCHAR,
	direccion	VARCHAR,
	telefono	VARCHAR,

	CONSTRAINT pk_empresa PRIMARY KEY (cif)
);

CREATE TABLE alumno(
	dni 		VARCHAR,
	nombre		VARCHAR,
	direccion	VARCHAR,
	telefono	VARCHAR,
	edad 		VARCHAR,
	empresa		VARCHAR,
	
	CONSTRAINT pk_alumno PRIMARY KEY (dni)
);

CREATE TABLE alumno_asisten(
	dni 			VARCHAR,
	n_concreto		int,
	
	CONSTRAINT pk_alumnoasiten PRIMARY KEY (dni,n_concreto)
	
);

CREATE TABLE curso(
	n_concreto		int,
	fecha_inicio	DATE,
	fecha_fin		DATE,
	dni_profesor	VARCHAR,
	tipo_curso		int,
	
	CONSTRAINT pk_curso	primary key(n_concreto)
);

CREATE TABLE profesor(
	dni			VARCHAR,
	nombre		VARCHAR,
	apellido	VARCHAR,
	telefono	VARCHAR,
	direccion	VARCHAR,
	
	constraint pk_profesor primary key (dni)
);

CREATE TABLE tipo_curso(
	cod_curso	SMALLINT,
	duracion	SMALLINT,
	programa	VARCHAR,
	titulo		VARCHAR,
	
	CONSTRAINT pk_tipocurso primary key (cod_curso)
);

ALTER TABLE alumno
ADD CONSTRAINT fk_empresa foreign key (empresa)
REFERENCES empresas ;

ALTER TABLE alumno_asisten
ADD CONSTRAINT fk_dni foreign key(dni)
REFERENCES alumno;

ALTER TABLE alumno_asisten
ADD CONSTRAINT fk_nconcreto foreign key(n_concreto)
REFERENCES curso;

ALTER TABLE curso
ADD CONSTRAINT fk_dniprofesor foreign key (dni_profesor)
REFERENCES profesor;

ALTER TABLE curso 
ADD CONSTRAINT fk_codcurso foreign key (tipo_curso)
REFERENCES tipo_curso;

INSERT INTO alumno (dni, nombre, direccion, telefono, edad, empresa)
			VALUES ('123456789Q', 'Abdel', 'Calle Condes De Bustillo', '654988321', '20', 'Amazon'),
					('635465465W', 'Marco', 'Calle Condes De Bustillo', '321654987', '21', 'Andaluza Programacion');
			
SELECT *
FROM alumno;

DELETE FROM alumno
		WHERE dni ILIKE '%Q%'
		RETURNING*;
		
DELETE FROM alumno
		WHERE  ILIKE '%Q%'
		RETURNING*;







































