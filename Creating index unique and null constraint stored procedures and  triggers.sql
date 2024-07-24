/* USING INDEXES:
The best way to improve the perfromance of SELECT operations is to create indexes on one or more of the 
columns that are tested in the query. The index entries act like pointers to the table rows, allowing the 
query to quickly determine which rows match a condition in the WHERE clause, and retrieve the other column
values for those rows. All MySQL data type can be indexed.alter
*/

/* CREATE AN INDEX:
We can add and delete indexes through the UI or with SQL code
In MySQL, the primary key and foreign key we create on a table is always an index automatically.
*/
-- ADDING INDEX -- 
ALTER TABLE customer_reviews
ADD INDEX employee_id (employee_id ASC) VISIBLE;  -- need to specity column name in parentheses 
;

-- OR can write 

CREATE INDEX employee_id ON customer_reviews (employee_id);

-- DROPPING INDEX -- 
ALTER TABLE customer_reviews
DROP INDEX employee_id;  -- need to specity on INDEX name which is inventory_id. no need to use parentheses


-- ADDING UNIQUE CONSTRAINTS -- 
/* We can decide which columns in our table we allow to have repeating values and which column must be
unique.
Adding a unique constraints via UI or SQL code
including a unique contraint on column that should not repeat is a good way to ensure data integrity and
is a good best practice. 
*/
-- ADDING UNIQUE -- 
ALTER TABLE inventory
ADD UNIQUE (inventory_id); -- need to specify column name in parentheses 
;

-- OR 

ALTER TABLE inventory
ADD CONSTRAINT unique_inventory_id UNIQUE (inventory_id);
;


-- DROPPING UNIQUE CONSTRAINTS -- 
ALTER TABLE inventory
DROP INDEX inventory_id; -- need to specify on INDEX name which is inventory_id. no need to use parentheses
;

-- OR 

ALTER TABLE inventory
DROP INDEX unique_inventory_id; -- need to specify on INDEX name which is unique_inventory_id. no need to use parentheses
;

-- NON NULL CONSTRAINT -- 
/* We may want certain columns to be populated with a value for every single record.
we can apply NON-NULL contraints to a certain column, which requires all records to have a value 
in that column. Without including a value for the column, the INSERT will fail.
*/

ALTER TABLE inventory
CHANGE COLUMN number_in_stock 
number_in_stock BIGINT(20) NOT NULL;

-- OR

ALTER TABLE inventory
MODIFY COLUMN number_in_stock BIGINT(20) NOT NULL;

-- REMOVE NOT NULL -- 
ALTER TABLE inventory
MODIFY COLUMN number_in_stock BIGINT(20);


-- STORED PROCEDURES -- 
/* -- STORED PROCEDURES-- 
MySQL gives us the ability to store and call frequently used queries on the server. These are then referred
to as commonly known stored procedures.
Benefits include more efficient query writing and query performance, and ability to share more complex 
procedures more easily.
*/

-- changing the delimiter 
DELIMITER //
-- creating the procedure 
CREATE PROCEDURE Store_procedure_selectalldata()
BEGIN
    SELECT * FROM data;
END //
-- changing the delimiter back to default 
DELIMITER ;

-- calling the procedure that we have created
call Store_procedure_selectalldata();

-- we can also drop it later 
DROP PROCEDURE IF EXISTS Store_procedure_selectalldata ;

-- Triggers -- 
/* Through triggers we can prescribe certain actions on a table to trigger one or more other actions to 
occur. 
We may prescribe that our triggered action occurs either BEFORE or AFTER an INSERT, UPDATE or a DELETE
Triggers are a very common way to make sure related tables remain in sync as they are updated over time.
*/
SELECT * FROM inventory;

SELECT * FROM customer_purchases;	
-- DROP TRIGGER IF EXISTS PurchaseUpdateInventory;
-- Substracting 
CREATE TRIGGER PurchaseUpdateInventory
AFTER INSERT ON customer_purchases
FOR EACH ROW 
    UPDATE inventory 
       -- substracting an item for eachpurchase
        SET number_in_stock = number_in_stock - 1
	WHERE inventory.inventory_id = NEW.inventory_id;

-- Checking if it works
    INSERT INTO customer_purchases VALUES
    (25,0,8), -- inventory_id = 3
    (26,0,9); -- inventory_id = 4
    

SELECT * FROM staff;

-- Adding 
CREATE TRIGGER updatedordersserved
AFTER INSERT ON customer_orders
FOR EACH ROW
    UPDATE staff
     SET orders_served = orders_served + 1
     WHERE staff.staff_id = NEW.staff_id;
     
     -- Checking if it works
     INSERT INTO customer_orders VALUES
     (21,1,10.98),
     (22,2,5.99),
     (23,2,7.99),
     (24,2,12.97);
     
