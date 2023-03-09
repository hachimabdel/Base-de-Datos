
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS trabajador CASCADE;
DROP TABLE IF EXISTS pedido CASCADE;
DROP TABLE IF EXISTS detalle_pedido CASCADE;
DROP TABLE IF EXISTS comprador CASCADE;

CREATE TABLE producto(
    cod_producto        VARCHAR,
    nombre              VARCHAR NOT NULL,
    descripcion         TEXT,
    pvp                 SMALLINT NOT NULL,
    categoria           TEXT,

    CONSTRAINT pk_producto PRIMARY KEY (cod_producto)
);

CREATE TABLE categoria(
    id_categoria        VARCHAR,
    nombre              VARCHAR NOT NULL,
    descripcion         TEXT,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)


);

CREATE TABLE trabajador(
    num_trabajador      VARCHAR,
    nombre_completo     VARCHAR NOT NULL,
    email               VARCHAR,
    cuenta_corriente    VARCHAR NOT NULL,
    pass                VARCHAR,

    --CONSTRAINT ck_trabajador CHECK (LENGHT (email) > 320),
    --CONSTRAINT ck_trabajador CHECK (email) ILIKE '%@%',
    --CONSTRAINT ck_trabajador CHECK (LENGHT (cuenta_corriente) = 24 ),
    --CONSTRAINT ck_trabajador CHECK (cuenta_corriente) ILIKE 'ES%',
    --CONSTRAINT ck_trabajador CHECK (pass) ILIKE '%@%',
    CONSTRAINT pk_trabajador PRIMARY KEY (num_trabajador)
);

CREATE TABLE pedido(
    cod_pedido          VARCHAR,
    fecha_pedido        DATE NOT NULL,
    num_trabajador      VARCHAR NOT NULL,
    dni_comprador       VARCHAR NOT NULL,

    CONSTRAINT pk_pedido PRIMARY KEY (cod_pedido)
);

CREATE TABLE detalle_pedido(
    cod_pedido         VARCHAR,
    num_detalle        SERIAL,
    cantidad           NUMERIC,
    cod_producto       VARCHAR,
    precio             NUMERIC,
    descuento          INT NOT NULL DEFAULT 0,

    CONSTRAINT pk_detallepedido PRIMARY KEY (cod_pedido, num_detalle)
    --CONSTRAINT ck_detalle_pedido CHECK (cantidad) > 0,

);

CREATE TABLE comprador(
    dni                 VARCHAR,
    nombre_completo     VARCHAR NOT NULL,
    email               VARCHAR,
    direccion           VARCHAR,
    fecha_alta          DATE,

    CONSTRAINT pk_comprador PRIMARY KEY (dni)
    --CONSTRAINT ck_comprador CHECK (LENGHT (email) < 320),
    --CONSTRAINT ck_comprador CHECK (email) ILIKE '%@%',
    --CONSTRAINT ck_comprador CHECK (LENGHT (direccion) < 100),
);

ALTER TABLE producto
ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria) REFERENCES categoria ;

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_trabajador FOREIGN KEY (num_trabajador) REFERENCES trabajador ON DELETE SET NULL,
ADD CONSTRAINT fk_pedido_comprador FOREIGN KEY (dni_comprador) REFERENCES comprador ON DELETE SET NULL;

ALTER TABLE detalle_pedido
ADD CONSTRAINT fk_detalle_pedido_producto FOREIGN KEY (cod_producto) REFERENCES producto ;


INSERT INTO comprador VALUES (nombre_completo, email)
		('Fernando Fanegas', 'fernando.fanegas@yahoo.com', );
		
INSERT INTO detalle_pedido VALUES ()















