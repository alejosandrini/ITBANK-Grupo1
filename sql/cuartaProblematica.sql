-- TODO:
-- 2. Revisar, esperar respuesta
-- 7. Crear tabla movimientos, campos: identificación del movimiento,
-- número de cuenta, monto, tipo de operación y hora
--  Mediante el uso de transacciones, hacer una transferencia de 1000$
-- desde la cuenta 200 a la cuenta 400
-- Registrar el movimiento en la tabla movimientos
-- En caso de no poder realizar la operación de forma completa, realizar un ROLLBACK

-- 1. Listar cantidad de clientes por sucursal descendiente
SELECT c.branch_id, s.branch_name as Sucursal,
    count(c.branch_id) as Cantidad_clientes
FROM cliente as c
INNER JOIN sucursal as s
ON c.branch_id = s.branch_id
GROUP BY c.branch_id
ORDER BY Cantidad_clientes DESC;

-- 2. Obtener cantidad de empleados por cliente por sucursal
SELECT e.branch_id, s.branch_name as Sucursal,
    count(e.branch_id) as Cantidad_empleados
FROM empleado as e
INNER JOIN sucursal as s
ON e.branch_id = s.branch_id
GROUP BY e.branch_id
ORDER BY Cantidad_empleados DESC;

-- 3. Obtener cantidad de tarjetas de credito por tipo por sucursal
SELECT c.branch_id, s.branch_name as Sucursal, 
    mt.marca, count(t.id_marca_tarjeta) as Cantidad_tarjetas
FROM tarjetas as t
INNER JOIN marcas_tarjeta as mt
ON t.id_marca_tarjeta = mt.id_marca_tarjeta
INNER JOIN cliente as c
ON t.customer_id = c.customer_id
INNER JOIN sucursal as s
ON c.branch_id = s.branch_id
WHERE tipo_tarjeta = 1
GROUP BY t.id_marca_tarjeta, c.branch_id
ORDER BY c.branch_id, Cantidad_tarjetas DESC;

-- 4. Obtener promedio de creditos(prestamos) otorgados por sucursal
SELECT c.branch_id, s.branch_name, 
    count(*) as Cantidad_prestamos, 
    CAST(sum(p.loan_total) as REAL)/100 as Total,
    ROUND(avg(loan_total)/100, 2) as Promedio
FROM prestamo as p
INNER JOIN cliente as c
ON p.customer_id = c.customer_id
INNER JOIN sucursal as s
ON c.branch_id = s.branch_id
GROUP BY c.branch_id
ORDER BY c.branch_id;

-- 5. Crear tabla auditoria_cuenta y trigger cuando se modifique tabla cuenta
DROP TABLE IF EXISTS auditoria_cuenta;
CREATE TABLE auditoria_cuenta (
    old_id integer, 
    new_id integer, 
    old_balance integer,
    new_balance integer, 
    old_iban text, 
    new_iban text, 
    old_type integer, 
    new_type integer, 
    user_action text,
    created_at date
);

CREATE TRIGGER IF NOT EXISTS cuenta_registro_cambios
AFTER UPDATE ON cuenta
WHEN old.balance <> new.balance or old.iban <> new.iban or old.id_tipo_cuenta <> new.id_tipo_cuenta
BEGIN
    INSERT INTO auditoria_cuenta(old_id, new_id, old_balance, new_balance, old_iban, 
            new_iban, old_type, new_type, user_action,created_at)
    VALUES (old.customer_id, new.customer_id, old.balance, new.balance, old.iban,
            new.iban, old.id_tipo_cuenta, new.id_tipo_cuenta, 'UPDATE', DATETIME('NOW'));
END;

UPDATE cuenta
SET balance = balance - 100
WHERE account_id BETWEEN 10 AND 14;

-- 6. Indice de DNI en cliente
create UNIQUE index idx_contacts_email
on cliente(customer_DNI);

-- 7. 
