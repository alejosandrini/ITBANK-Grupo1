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
DROP TABLE IF EXISTS tipo_tarjeta;
CREATE TABLE tipo_tarjeta (
    id_tipo_tarjeta integer PRIMARY KEY,
    tipo text NOT NULL
);

DROP TABLE IF EXISTS tarjetas;
CREATE TABLE tarjetas (
    id_tarjeta integer PRIMARY KEY,
    id_marca_tarjeta integer NOT NULL,
    customer_id integer NOT NULL,
    numero integer NOT NULL UNIQUE,
    CVV integer NOT NULL, 
    fecha_otorgamiento text NOT NULL, 
    fecha_expiracion text NOT NULL, 
    tipo_tarjeta text NOT NULL,
    CONSTRAINT fk_tarjeta
        FOREIGN KEY (id_marca_tarjeta)
        REFERENCES marcas_tarjeta(id_marca_tarjeta), 
        FOREIGN KEY (customer_id)
        REFERENCES cliente(customer_id),
        FOREIGN KEY (tipo_tarjeta)
        REFERENCES tipo_tarjeta(tipo)
    );

--  5. Insertar 500 tarjetas con www.generatedata.com

--  6. 
DROP TABLE IF EXISTS direcciones;
CREATE TABLE direcciones (
    id_direccion integer PRIMARY KEY,
    calle text NOT NULL,
    numero integer NOT NULL,
    ciudad text NOT NULL, 
    provincia text NOT NULL,
    pais text NOT NULL,
    id_cliente integer,
    id_empleado integer,
    id_sucursal integer UNIQUE,
    CONSTRAINT fk_direcciones
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(customet_id), 
        FOREIGN KEY (id_empleado)
        REFERENCES empleado(employee_id),
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(branch_id)
    );

--  7. Pregunta: Para restringir la cantidad de direcciones usamos un trigger? no

--  8. y 9.
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


-- entregar generador de tarjetas y direcciones a parte
-- 1. Marca de tarjeta, al final es credito o debito?
-- rta: visa o mastercar por ej, hacer tabla tipo de tarjeta

-- 2. Direcciones, como hacemos para que cliente y empleado tengan múltiples 
-- direcciones y sucursal una. 
-- (se me ocurre agregar dirección a sucursal y armar una tabla para el resto)
-- rta:

-- 3. En la segunda problemática, punto 1 que significa número de sucursal 
-- es branch_id?
-- rta: si

-- 4. En la segunda problemática, dice eliminar noel david, pero no existe, 
-- que hacemos?
-- rta: agregar un noel david
--
-- 5. Tercera problemática, “recordar que en las bases de datos la moneda se 
-- guarda como integer, en este caso con 2 centavos”, es decir si tenemos 
-- 30641711 sería 306.417,11
-- rta: los ultimos dos numeros son los decimales
--
-- 6. Tercera problemática, Seleccionar los préstamos que tengan fecha en abril, 
-- junio y agosto, ordenándolos por importe, primero ordenar por mes o no?
-- rta: todo mezclado, solo por importe

-- 7. Cuarta problemática, Obtener el promedio de créditos otorgado por sucursal,
--  créditos se refiere a préstamos de los clientes de cada sucursal?
-- rta: si

-- 8. En la cuarta problemática, “Mediante índices mejorar la performance la 
-- búsqueda de clientes por DNI”
-- rta: solo crear el indice por dni
-- create UNIQUE index idx_contacts_email
-- on cliente (customer_DNI);
