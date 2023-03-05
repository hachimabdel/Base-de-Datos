DROP TABLE IF EXISTS invitados ;
DROP TABLE IF EXISTS teatros;
DROP TABLE IF EXISTS obras;
DROP TABLE IF EXISTS exhibe;
DROP TABLE IF EXISTS tipo_asientos;
DROP TABLE IF EXISTS asientos_tipo;
DROP TABLE IF EXISTS precio;
DROP TABLE IF EXISTS entradas;

--INVITADOS(NroInvitado, Nombre, Categoría, Origen)
CREATE TABLE invitados(
	nro_invitado			TEXT,
	nombre					VARCHAR NOT NULL,
	categoria				VARCHAR,				
	origen					VARCHAR			
);

--TEATROS(CodTeat, Nombre, Direccion, CantAsientos)
CREATE TABLE teatros(
	cod_teat 				SERIAL,
	nombre 					VARCHAR NOT NULL,
	direccion	 			VARCHAR,
	cant_asientos			INTEGER
);

--OBRAS(CodObra, NombreObra, Autor)
CREATE TABLE obras (
	cod_obra				SERIAL,
	nombre_obra				VARCHAR NOT NULL,
	autor					TEXT
);

--EXHIBE(CodTeat, Fecha, CodObra)
CREATE TABLE exhibe (
	cod_teatro 				SERIAL,
	fecha					VARCHAR NOT NULL,
	cod_obra				VARCHAR,
	CONSTRAINT fk_cod_teatro FOREIGN KEY (teatros) REFERENCES exhibe
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_cod_obra FOREIGN KEY (obras) REFERENCES exhibe
	ON DELETE CASCADE ON UPDATE CASCADE,
);

--TIPOS_ASIENTOS(Tipo, Nombre, Descripción)
CREATE TABLE tipos_asientos(
	tipo 					varchar(4),
	nombre					VARCHAR NOT NULL,
	descripcion 			TEXT
);

--ASIENTO_TIPOS(NroAsiento, Tipo).
CREATE TABLE asiento_tipos(
	nro_asiento				VARCHAR(4),
	tipo					DATE,
	
	CONSTRAINT fk_tipo FOREIGN KEY (tipo_asientos) REFERENCES asientos_tipo
	ON DELETE CASCADE ON UPDATE CASCADE
);

--PRECIO(CodTeat, Fecha, Tipo, Precio)
CREATE TABLE precio (
	cod_teatro 				SERIAL,
	fecha					DATE,
	tipo					VARCHAR,
	precio					VARCHAR,
	
	CONSTRAINT fk_cod_teatro_fecha FOREIGN KEY (exhibe) REFERENCES precio
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_tipo FOREIGN KEY (tipo_asientos) REFERENCES tipo_asientos
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE entradas (
	cod_teatro 				SERIAL,
	fecha					DATE,
	nro_asiento				VARCHAR(4),
	nro_invit				INTEGER,
	
	CONSTRAINT fk_cod_teatro_fecha FOREIGN KEY (exhibe) REFERENCES entradas
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_nro_asiento FOREIGN KEY (asientos_tipos) REFERENCES asientos_tipos
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_nro_invit FOREIGN KEY (invitados) REFERENCES entradas
	ON DELETE CASCADE ON UPDATE CASCADE
);







