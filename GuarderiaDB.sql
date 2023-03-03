DROP TABLE IF EXISTS docentes;
DROP TABLE IF EXISTS actividades;
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS asignacion_act;
DROP TABLE IF EXISTS asistencia_act;



--DOCENTES (dni, Nombre, Teléfono, añoIngreso)
--Esta tabla contiene información acerca de los docentes que trabajan en la guardería. 
--Registra el dni del docente, su nombre, su teléfono y el año de ingreso al trabajo.
CREATE TABLE docentes(
	dni					VARCHAR,
	nombre				VARCHAR,
	telefono			VARCHAR,
	anioingreso			INTEGER,
	
	CONSTRAINT pk_dni PRIMARY KEY (dni)
);

--ACTIVIDADES (IdAct, Nombre, Duración)
--Esta tabla contiene información acerca de las actividades que se realizan en la guardería. 
--Registra el identificador de la actividad, el nombre (gimnasia, natación, artes plásticas, música, etc.) 
--y la duración (en minutos) de la misma en cada clase.

CREATE TABLE actividades(
	idact				INTEGER,
	nombre				VARCHAR,
	duracion			NUMERIC,
	
	CONSTRAINT pk_idact PRIMARY KEY (idact)
);

--ALUMNOS (cod_alumno, Nombre, Teléfono, Nivel)
--Esta tabla contiene información acerca de los alumnos de la guardería. 
--Registra el código de identificación del alumno, su nombre, su teléfono y el nivel (2 años, 3 años, etc.), al cual asiste el niño.

CREATE TABLE alumnos(
	codalumno			INTEGER,
	nombre				VARCHAR,
	telefono			VARCHAR,
	nivel				VARCHAR,
	
	CONSTRAINT pk_codalumno PRIMARY KEY (codalumno)
);


--ASIGNACIÓN_ACT (IdDoc, IdAct, DiaSemana, Hora)
--Esta tabla contiene la asignación de los docentes a las actividades dentro de la guardería.
--Cada docente puede ser asignado a varias actividades y además puede ser asignado a la misma actividad en varios horarios diferentes 
--en el mismo día o en distintos días.

CREATE TABLE asignacion_act(
	iddoc				SMALSERIAL,
	idact				SMALLINT,
	diasemana			VARCHAR,
	hora				DATE,
	
	CONSTRAINT pk_iddoc_idact_diasemana_hora PRIMARY KEY (iddoc, idact, diasemana, hora)
);



--ASISTENCIA_ACT (IdAlum, IdAct, IdDoc)
--Esta tabla contiene información acerca de los alumnos que asisten a cada actividad con el docente correspondiente. 
--Un alumno asiste a una actividad con un único docente. 

CREATE TABLE asistencia_act(
	idalum				INTEGER,
	idact				INTEGER,
	iddoc				SMALLINT,
	
	CONSTRAINT pk_idalum_idact PRIMARY KEY (idalum, idact)
);

ALTER TABLE 