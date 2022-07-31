--  1.
-- Creacion tabla de tipos cliente y su insert
DROP TABLE IF EXISTS tipos_cliente;
CREATE TABLE tipos_cliente (
    id_tipo_cliente integer PRIMARY KEY,
    tipo text NOT NULL,
    max_chequeras integer NOT NULL,
    max_tarjetas_credito integer NOT NULL,
    max_tarjetas_debito integer NOT NULL
    );
INSERT INTO tipos_cliente (tipo, max_chequeras, max_tarjetas_credito, max_tarjetas_debito)
VALUES ("CLASSIC", 0, 0, 1),
    ("GOLD", 1, 1, 1),
    ("BLACK", 2, 5, 1);

-- Creacion tabla de tipos cuenta y su insert
DROP TABLE IF EXISTS tipos_cuenta;
CREATE TABLE tipos_cuenta (
    id_tipo_cuenta integer PRIMARY KEY,
    tipo text NOT NULL
    );
INSERT INTO tipos_cuenta (tipo)
VALUES  ("Caja ahorro pesos"),
        ("Caja ahorro dolares"),
        ("Cuenta corriente");

-- Creacion tabla de restricciones tipo cliente y su insert
DROP TABLE IF EXISTS restricciones_tipo_cliente;
CREATE TABLE restricciones_tipo_cliente (
    id_tipo_cliente integer NOT NULL UNIQUE,
    limite_extraccion_diario decimal NOT NULL,
    limite_transferencia_recibida decimal,
    monto decimal NOT NULL,
    costo_transferencias decimal NOT NULL,
    saldo_descubierto_disponible decimal NOT NULL,
    CONSTRAINT fk_restricciones_tipo_cliente
        FOREIGN KEY (id_tipo_cliente)
        REFERENCES tipos_cliente(id_tipo_cliente)
    );
INSERT INTO restricciones_tipo_cliente (id_tipo_cliente, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible)
VALUES  (1, 10000,150000,0,0.1,0),
        (2,20000,500000,0,0.05,10000),
        (3, 100000, NULL, 0, 0, 10000);

-- Creacion tabla de marcas tarjeta y su insert
DROP TABLE IF EXISTS marcas_tarjeta;
CREATE TABLE marcas_tarjeta (
    id_marca_tarjeta integer PRIMARY KEY,
    marca text NOT NULL
    );
INSERT INTO marcas_tarjeta (marca)
VALUES ('VISA'), ('MASTERCARD'), ('AMERICAN EXPRESS');

--  3. y 4.
-- Creacion tabla de tipo tarjeta y su insert
DROP TABLE IF EXISTS tipo_tarjeta;
CREATE TABLE tipo_tarjeta (
    id_tipo_tarjeta integer PRIMARY KEY,
    tipo text NOT NULL
);
INSERT INTO tipo_tarjeta (tipo)
VALUES ('CREDITO'), ('DEBITO');

-- Query para contar cuantas tarjetas hay de cada marca (VISA, MASTERCARD, AMERICAN EXPRESS)
SELECT t.id_marca_tarjeta, marca, count(t.id_marca_tarjeta) 
FROM tarjetas as t
INNER JOIN marcas_tarjeta as mt
WHERE t.id_marca_tarjeta = mt.id_marca_tarjeta
GROUP by t.id_marca_tarjeta;

-- Query para contar cuantas tarjetas hay de cada tipo (CREDITO, DEBITO)
SELECT t.tipo_tarjeta, tipo, count(t.tipo_tarjeta) 
FROM tarjetas as t
INNER JOIN tipo_tarjeta
WHERE t.tipo_tarjeta = id_tipo_tarjeta
GROUP by t.tipo_tarjeta;

--  2. y 5. Insertar 500 tarjetas con www.generatedata.com
--  Realizado en data-tarjetas.sql
-- Query para contar cantidad personas que tienen X cantidad de tarjetas
SELECT cantidad_tarjetas, count(cantidad_tarjetas) as cantidad_personas
FROM(SELECT count(customer_id) as cantidad_tarjetas
	FROM tarjetas
	GROUP BY (customer_id))
GROUP BY (cantidad_tarjetas);

--  6. y 7. Insertar 500 direcciones con www.generatedata.com
--  Realizado en data-direcciones.sql

-- Query para saber cuantas combinaciones hay de direcciones
SELECT 
	combinaciones, texto as "tipo de combinacion"
	FROM (
		SELECT 
		count(*) as combinaciones
		FROM direcciones
		GROUP by 
		(id_cliente ISNULL AND id_empleado ISNULL AND id_sucursal IS NOT NULL), -- 1
		(id_cliente ISNULL AND id_empleado IS NOT NULL AND id_sucursal ISNULL), -- 80
		(id_cliente IS NOT NULL AND id_empleado ISNULL AND id_sucursal ISNULL), -- 39
		(id_cliente IS NOT NULL AND id_empleado ISNULL AND id_sucursal IS NOT NULL), -- 24
		(id_cliente IS NOT NULL AND id_empleado IS NOT NULL AND id_sucursal ISNULL), -- 281
		(id_cliente ISNULL AND id_empleado IS NOT NULL AND id_sucursal IS NOT NULL), -- 11
		(id_cliente IS NOT NULL AND id_empleado IS NOT NULL AND id_sucursal IS NOT NULL) --64
	)
	INNER JOIN tipo_combinacion
	WHERE CAST(combinaciones as INTEGER) = cantidad;

DROP TABLE IF EXISTS tipo_combinacion;
CREATE TABLE tipo_combinacion (
    texto text NOT NULL,
    cantidad integer NOT NULL
);
INSERT INTO tipo_combinacion (texto, cantidad)
VALUES  ('Un cliente, un empleado y una sucursal conocen la dirección', 64),
        ('Ningún cliente conoce la dirección', 11),
        ('Ninguna sucursal conoce la dirección', 281),
        ('Ningún empleado conoce la dirección', 24),
        ('Sólo un cliente conoce la dirección', 39),
        ('Sólo un empleado conoce la dirección', 80),
        ('Sólo un sucursal conoce la dirección', 1);

--  8. y 9.
ALTER TABLE cuenta
ADD COLUMN id_tipo_cuenta integer NOT NULL default(1);
ALTER TABLE cliente
ADD COLUMN id_tipo_cliente integer NOT NULL default(1);

-- Dos updates a cuenta para que haya distintos tipos de cuentas
UPDATE cuenta
SET id_tipo_cuenta = 3
WHERE balance < 0;

UPDATE cuenta
SET id_tipo_cuenta = 2
WHERE length(iban) > 22 AND balance > 0;

-- Query para contar cuantos tipo de cuenta hay (Caja ahorro pesos, Caja ahorro dolares O Cuenta corriente)
SELECT c.id_tipo_cuenta, tipo, count(c.id_tipo_cuenta)
FROM cuenta as c
INNER JOIN tipos_cuenta as tc
WHERE c.id_tipo_cuenta = tc.id_tipo_cuenta
GROUP BY (c.id_tipo_cuenta);

-- Dos updates a cliente para que haya distintos tipos de cliente
UPDATE cliente
SET id_tipo_cliente = 3
WHERE CAST(SUBSTR(dob,1,4) as INT) <= 1955;

UPDATE cliente
SET id_tipo_cliente = 2
WHERE CAST(SUBSTR(dob,1,4) as INT) < 1985 AND CAST(SUBSTR(dob,1,4) as INT) > 1955;

-- Query para contar cuantos clientes hay de cada tipo (CLASSIC, GOLD O BLACK)
SELECT c.id_tipo_cliente, tipo, count(c.id_tipo_cliente)
FROM cliente as c
INNER JOIN tipos_cliente as tc
WHERE c.id_tipo_cliente = tc.id_tipo_cliente
GROUP BY (c.id_tipo_cliente);


-- 10.
UPDATE empleado
SET employee_hire_date = SUBSTR(employee_hire_date,7,4) || '-' ||
                         SUBSTR(employee_hire_date,4,2) || '-' || 
                         SUBSTR(employee_hire_date,1,2);
