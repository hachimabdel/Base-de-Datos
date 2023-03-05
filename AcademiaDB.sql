 DROP TABLE IF EXISTS empresas CASCADE;
 DROP TABLE IF EXISTS alumnos CASCADE;
 DROP TABLE IF EXISTS alumnos_asisten CASCADE;
 DROP TABLE IF EXISTS cursos CASCADE;
 DROP TABLE IF EXISTS profesores CASCADE;
 DROP TABLE IF EXISTS tiposcurso CASCADE;
 
 CREATE TABLE empresas (
	 cif 			text,
	 nombre			text,
	 direccion		text,
	 telefono		text,
 );
 
  CREATE TABLE alumnos (
	 dni 			text,
	 nombre			text,
	 direccio		numeric,
	 telefono		text,
	 edad 			text,
	 empresa		text,
 );
 
  CREATE TABLE alumnos_asisten (
	 dni			text,
	 nconcreto		integer,
	 direccion		text,
	 telefono		text,
 );
 
  CREATE TABLE cursos (
	 nconcreto		text,
	 fechainicio	date,
	 fechafin		date,
	 dni_profesor	text,
	 tipocurso		INTEGER
 );
 
  CREATE TABLE profesores (
	 dni 			text,
	 nombre			text,
	 apellidos		text,
	 direcccion		text,
	  
	 CONSTRAINT pk_dni PRIMARY KEY ()
 );
 
  CREATE TABLE tipos_cursos (
	 codcursos 		INTEGER,
	 duracion		INTEGER,
	 programa		text,
	 titulo			text,
	  
	 CONSTRAINT pk_dni PRIMARY KEY ()
 
 );
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 