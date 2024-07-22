-- Inserting, updating and deleting record --

-- INSERTING DATA -- 

USE candystore;

SELECT * FROM inventory;

INSERT INTO inventory VALUES -- if inventory table no missing value in any column
(11,prodyct1, 2),
(12,product2, 3),
(13,product3, 4);

INSERT INTO inventory (product_ID, product_name) VALUES -- if missing value in any column, need to specify column names in which data is being loaded. 
(14,product5);

-- UPDATING DATA -- majority of time need to use WHERE to specify where to update record -- 

USE candystore;

SELECT * FROM inventory;

UPDATE inventory   -- work only when in WHERE primary key column is given -- 
SET number_in_stock = 0
-- WHERE inventory_id IN (1,9)
WHERE inventory_id = 9; -- always run UPDATE using primary key value in WHERE --

-- DELETING RECORD/ROW -- 

USE candystore;

SELECT * FROM inventory;

SELECT @@autocommit;

SET autocommit = 0 ; -- if planning to rollback deleted record or row-- (1,0 or ON, OFF)

DELETE FROM inventory
WHERE inventory_id = 7; -- always run DELETE using primary key column in WHERE

ROLLBACK;  -- retrieve deleted record or row after deleted. only works when autocommit is OFF or 0

COMMIT; -- If commit is written at the end, ROLLBACK won't work even autocommit is set to 0.


-- DELETING ALL RECORDS WITH TRUNCATE -- DDL Can't be roll back 
/* Truncate is used to preserve the table structure after we remove all records from a table 
When we use truncate table, the data is removed but the column names, data types, column order, 
and any contraints placed on the tabel are all preserved
*/
SELECT @@autocommit;

SET autocommit = 0 ;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

DELETE FROM customers
WHERE customer_id BETWEEN 1 AND 6;

ROLLBACK;

TRUNCATE TABLE customers; -- ROLLBACK command doesn't work with TRUNCATE. records will be deleted permanently from table even autocommit is set to 0.
