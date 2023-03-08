 DROP TABLE IF EXISTS empresas CASCADE;
 DROP TABLE IF EXISTS alumnos CASCADE;
 DROP TABLE IF EXISTS alumnos_asisten CASCADE;
 DROP TABLE IF EXISTS cursos CASCADE;
 DROP TABLE IF EXISTS profesores CASCADE;
 DROP TABLE IF EXISTS tiposcurso CASCADE;
 
 CREATE TABLE empresas (
	 cif 			VARCHAR(9),
	 nombre			VARCHAR,
	 direccion		VARCHAR,
	 telefono		INT(9),
	 
	 CONSTRAINT pk_cif PRIMARY KEY (cif)
 );
 
  CREATE TABLE alumnos (
	 dni 			VARCHAR(10),
	 nombre			VARCHAR,
	 direccion		VARCHAR,
	 telefono		NUMERIC,
	 edad 			INT2,
	 empresa		TEXT,
	  
	 CONSTRAINT pk_dni PRIMARY KEY (dni)

 );
 
  CREATE TABLE alumnos_asisten (
	 dni			VARCHAR(10),
	 nconcreto		INTEGER,
	 direccion		VARCHAR,
	 telefono		NUMERIC(9),
	  
	 CONSTRAINT pk_dni PRIMARY KEY (dni)

 );
 
  CREATE TABLE cursos (
	 nconcreto		INTEGER,
	 fechainicio	DATE,
	 fechafin		DATE,
	 dni_profesor	VARCHAR(10),
	 tipocurso		INTEGER,
	  
	 CONSTRAINT pk_nconcreto PRIMARY KEY (nconcreto)
 );
 
  CREATE TABLE profesores (
	 dni 			VARCHAR(10),
	 nombre			VARCHAR,
	 apellidos		VARCHAR,
	 direccion		VARCHAR,
	  
	 CONSTRAINT pk_dni PRIMARY KEY (dni)
 );
 
  CREATE TABLE tipos_cursos (
	 codcursos 		INTEGER,
	 duracion		INTEGER,
	 programa		TEXT,
	 titulo			TEXT,
	  
	 CONSTRAINT pk_codcursos PRIMARY KEY (codcursos)
 
 );
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 