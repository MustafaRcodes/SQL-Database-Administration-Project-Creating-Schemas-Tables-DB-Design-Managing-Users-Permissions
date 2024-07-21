-- Alter tables - Adding & dropping columns using SQL code --

SELECT * FROM table1;

ALTER TABLE table1
ADD COLUMN purchase_amount DECIMAL(10,2) AFTER ID;

ALTER TABLE table1
DROP COLUMN purchase_amount; -- drop only when its really needed -- 