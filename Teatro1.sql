DROP TABLE IF EXISTS invitado CASCADE;
DROP TABLE IF EXISTS teatro CASCADE;
DROP TABLE IF EXISTS obra CASCADE;
DROP TABLE IF EXISTS exhibe CASCADE;
DROP TABLE IF EXISTS tipo_asiento CASCADE;
DROP TABLE IF EXISTS asiento_tipo CASCADE;
DROP TABLE IF EXISTS precio CASCADE;
DROP TABLE IF EXISTS entrada CASCADE;


CREATE TABLE invitado(
	nroInvitado			SMALLSERIAL,
	nombre				VARCHAR,
	categoria			VARCHAR,
	origen				TEXT,
	
	CONSTRAINT pk_invitado PRIMARY KEY (nroInvitado) 
);
INSERT INTO invitado VALUES
		('1', 'Abdel Hachim','Urbano', 'Marruecos' ),
		('2', 'Jose Carlos','Urbano', 'España' ),
		('3', 'Marco Pertegal','Urbano', 'España' ),
		('4', 'Miguel Ángel','Urbano', 'España' );

CREATE TABLE teatro(
	codTeat				SMALLSERIAL,
	nombre				VARCHAR,
	direccion			VARCHAR,
	cantAsientos		INT,
	
	CONSTRAINT pk_teatro PRIMARY KEY (codTeat)
);

CREATE TABLE obra(
	codObra				SMALLINT,
	nombreObra			VARCHAR,
	autor				VARCHAR,
	
	CONSTRAINT pk_obra PRIMARY KEY (codObra)
);

CREATE TABLE exhibe(
	codTeat				SMALLSERIAL,
	fecha				DATE,
	codObra				SMALLSERIAL,
	
	CONSTRAINT pk_exhibe PRIMARY KEY (codTeat, fecha)
);


CREATE TABLE tipo_asiento(
	tipo				VARCHAR,
	nombre				VARCHAR,
	descripcion			TEXT,
	
	CONSTRAINT pk_tipo_asiento PRIMARY KEY (tipo) 
);

CREATE TABLE asiento_tipo(
	nroAsiento			INT,
	tipo				VARCHAR,
	
	CONSTRAINT pk_asiento_tipo PRIMARY KEY (nroAsiento) 
);

CREATE TABLE precio(
	codTeat				SMALLINT,
	fecha				DATE,
	tipo				VARCHAR,
	precio				NUMERIC,
	
	CONSTRAINT pk_precio PRIMARY KEY (codTeat, fecha, tipo) 
);

CREATE TABLE entrada(
	codTeat				INT,
	fecha				DATE,
	nroAsiento			SMALLSERIAL,
	nroInvit			SMALLINT,
	
	CONSTRAINT pk_entrada PRIMARY KEY (codTeat, fecha, nroAsiento) 
);

ALTER TABLE exhibe
ADD CONSTRAINT fk_exhibe_teatro FOREIGN KEY (codTeat) REFERENCES teatro,
ADD CONSTRAINT fk_exhibe_obra FOREIGN KEY (codObra) REFERENCES obra;

ALTER TABLE asiento_tipo
ADD CONSTRAINT fk_asiento_tipo_tipo_asiento FOREIGN KEY (tipo) REFERENCES tipo_asiento;

ALTER TABLE precio
ADD CONSTRAINT fk_precio_exhibe FOREIGN KEY (codTeat, fecha) REFERENCES exhibe,
ADD CONSTRAINT fk_precio_tipo_asiento FOREIGN KEY (tipo) REFERENCES tipo_asiento;

ALTER TABLE entrada
ADD CONSTRAINT fk_entrada_exhibe FOREIGN KEY (codTeat, fecha) REFERENCES exhibe,
ADD CONSTRAINT fk_entrada_asiento_tipo FOREIGN KEY (nroAsiento) REFERENCES asiento_tipo,
ADD CONSTRAINT fk_entrada_tipo_asiento FOREIGN KEY (nroInvit) REFERENCES invitado;

UPDATE invitado SET nroInvitado = 
	'5', nombre = 'Pepe Segura', categoria = 'Urbano', origen = 'España' WHERE nroInvitado = '5';

INSERT INTO invitado VALUES
	('5', 'Pepe Segura', 'Urbano', 'España');
		

DELETE FROM invitado
		WHERE nroInvitado = '3'
		RETURNING*;

SELECT *
FROM invitado;




































































