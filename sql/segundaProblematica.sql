-- TODO:

-- 5. Consultar sobre cuál es el tipo de préstamo de mayor importe

-- PUNTO 1 --
drop VIEW clienteview;
CREATE VIEW clienteview AS SELECT customer_id,branch_id ,customer_name, customer_surname, customer_DNI, CAST(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) AS INT) AS customer_edad
FROM cliente;

SELECT * 
FROM clienteview
WHERE customer_edad>40
ORDER BY customer_DNI;

SELECT * 
FROM clienteview
WHERE customer_name= "Anne" or customer_name= "Tyler"
ORDER BY customer_edad;

-- PUNTO 2 --

INSERT INTO cliente (customer_name, customer_surname, customer_DNI, branch_id, dob)
VALUES ("Lois", "Stout", 47730534, 80, 1984-07-07),
       ("Hall", "Mcconnell", 52055484, 45, 1988-04-30),
       ("Hilei", "Mclean", 43825213, 77, 1993-03-28),
       ("Jin", "Cooley", 21207908, 98, 1959-08-24),
       ("Gabriel", "Harmon", 57083950, 27, 1978-04-01);

-- PUNTO 3 --

UPDATE cliente
SET branch_id = 10
WHERE customer_id>500;

-- PUNTO 4 --

INSERT INTO cliente (customer_name, customer_surname, customer_DNI, branch_id, dob)
VALUES ("Noel", "David", 00000000, 00, 1984-07-07);
DELETE FROM cliente
WHERE customer_name= "Noel" and customer_surname= "David";

-- PUNTO 5 --

SELECT loan_type, max(loan_total)
FROM prestamo;



