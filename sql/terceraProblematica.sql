-- 1. 
SELECT * FROM cuenta 
WHERE balance <0;

-- 2. 
SELECT customer_name, customer_surname, dob FROM cliente
WHERE instr(lower(customer_name),'z') OR instr (lower(customer_surname), 'z');

-- 3.
SELECT customer_name, customer_surname, sucursal.branch_name FROM cliente
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id 
WHERE customer_name = "Brendan";
-- 4. 
SELECT * FROM prestamo where loan_total > 8000000 
UNION
SELECT * from prestamo WHERE loan_type = 'PRENDARIO'; 

-- 5.
SELECT * from prestamo
WHERE loan_total > (SELECT avg (loan_total) FROM prestamo);

-- 6.
SELECT count(dob) as cantidad_clientes FROM cliente
    GROUP BY dob < 50;

-- 7.
SELECT * from cuenta
WHERE balance > 800000 
LIMIT 5 ;

-- 8.
SELECT * from prestamo
WHERE   strftime('%m', loan_date) = '04' OR  
        strftime('%m', loan_date) = '06' OR 
        strftime('%m', loan_date) = '08'
    ORDER BY loan_total;

-- 9.
SELECT loan_type, sum (loan_total) as loan_total_accu 
from prestamo
GROUP BY loan_type;