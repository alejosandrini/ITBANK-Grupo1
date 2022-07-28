-- TODO:
-- Listo 1. Crear tabla tipos cliente, tipos cuenta y marcas tarjera
-- Listo 2. Tarjeta tiene: Numero, CVV, fecha otorgamiento, fecha exporacion, tipo tarjeta
-- Listo 3. Relacionar tarjetas con marca de tarjera (Primary key en marca)
-- Listo 4. Relacionar tarjetas con cliente (Primary key en cliente)
--  5. Insertar 500 tarjetas de credito
--  6. Crear tabla direcciones, relacionarla con cliente, empleado, sucursal
--  7. Insertar 500 direcciones (cliente y empleado pueden tener muchas direcciones, sucursal una)
-- Listo 8. Ampliar cuenta para que tenga tipo de cuenta
-- Listo 9. Asignar tipos de cuenta
-- Listo 10. Cambiar formato fecha (employee_hire_date en tabla empleado) a YYYY-MM-DD

--  1.
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

DROP TABLE IF EXISTS tipos_cuenta;
CREATE TABLE tipos_cuenta (
    id_tipo_cuenta integer PRIMARY KEY,
    tipo text NOT NULL,
    id_tipo_cliente integer NOT NULL,
    limite_extraccion_diario decimal NOT NULL,
    limite_transferencia_recibida decimal,
    monto decimal NOT NULL,
    costo_transferencias decimal NOT NULL,
    saldo_descubierto_disponible decimal NOT NULL,
    CONSTRAINT fk_cuenta
        FOREIGN KEY (id_tipo_cliente)
        REFERENCES tipos_cliente(id_tipo_cliente)
    );
INSERT INTO tipos_cuenta (tipo, id_tipo_cliente, limite_extraccion_diario, limite_transferencia_recibida, monto, costo_transferencias, saldo_descubierto_disponible)
VALUES ("Caja ahorro pesos", 1, 10000,150000,0,0.1,0),
    ("Caja ahorro pesos", 2, 20000,500000,0,0.05,10000),
    ("Caja ahorro pesos", 3, 100000, NULL, 0, 0, 10000),
    ("Caja ahorro dolares", 2, 20000,500000,0,0.05,10000),
    ("Caja ahorro dolares", 3, 100000, NULL, 0, 0, 10000),
    ("Cuenta corriente", 2, 20000,500000,0,0.05,10000),
    ("Cuenta corriente", 3, 100000, NULL, 0, 0, 10000);

DROP TABLE IF EXISTS marcas_tarjeta;
CREATE TABLE marcas_tarjeta (
    id_marca_tarjeta integer PRIMARY KEY,
    marca text NOT NULL
    );

--  2. 3. y 4.
DROP TABLE IF EXISTS tarjetas;
CREATE TABLE tarjetas (
    id_tarjeta integer PRIMARY KEY,
    id_marca_tarjeta integer NOT NULL,
    customer_id integer NOT NULL,
    numero integer NOT NULL UNIQUE,
    CVV integer NOT NULL, 
    fecha_otorgamiento text NOT NULL, 
    fecha_exporacion text NOT NULL, 
    tipo_tarjeta text NOT NULL,
    CONSTRAINT fk_tarjeta
        FOREIGN KEY (id_marca_tarjeta)
        REFERENCES marcas_tarjeta(id_marca_tarjeta), 
        FOREIGN KEY (customer_id)
        REFERENCES cliente(customer_id)
    );

--  5. Insertar 500 tarjetas con www.generatedata.com

--  6. Pregunta: Como relacionar con cliente, empleado o sucursal? 
--     Poner tres columnas de id?
DROP TABLE IF EXISTS direcciones;
CREATE TABLE direcciones (
    id_direccion integer PRIMARY KEY,
    calle text NOT NULL,
    numero integer NOT NULL,
    ciudad text NOT NULL, 
    provincia text NOT NULL,
    pais text NOT NULL
    );

--  7. Pregunta: Para restringir la cantidad de direcciones usamos un trigger?

--  8. 9.
-- PRAGMA table_info(cuenta);
-- SELECT name
-- FROM pragma_table_info('cuenta')
-- WHERE name = 'id_tipo_cuenta';
-- IF EXISTS (
--     SELECT name
--     FROM pragma_table_info('cuenta')
--     WHERE name = 'id_tipo_cuenta'
-- )
-- BEGIN
--     ALTER TABLE cuenta
--     DROP COLUMN id_tipo_cuenta
-- END;

-- ALTER TABLE cuenta
-- ADD COLUMN id_tipo_cuenta integer NOT NULL default(1);
-- Se debe ejecutar solo una vez ya que no se puede hacer drop column if exists
-- Ver https://www.sqlitetutorial.net/sqlite-alter-table/

UPDATE cuenta
SET id_tipo_cuenta = 3
WHERE balance < 0;

UPDATE cuenta
SET id_tipo_cuenta = 2
WHERE length(iban) > 22 AND balance > 0;

SELECT id_tipo_cuenta, count(id_tipo_cuenta)
FROM cuenta
GROUP BY (id_tipo_cuenta);

-- 10.
-- UPDATE empleado
-- SET employee_hire_date = SUBSTR(employee_hire_date,7,4) || '-' ||
--                          SUBSTR(employee_hire_date,4,2) || '-' || 
--                          SUBSTR(employee_hire_date,1,2);