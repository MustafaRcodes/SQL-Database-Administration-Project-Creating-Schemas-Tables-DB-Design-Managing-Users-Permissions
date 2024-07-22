-- Alter tables - Adding, updating & dropping columns using SQL code --

SELECT * FROM table1;

ALTER TABLE table1
ADD COLUMN purchase_amount DECIMAL(10,2) AFTER ID;

ALTER TABLE table1
DROP COLUMN purchase_amount; -- drop only when its really needed -- 

SELECT * FROM candy_products;

SELECT * FROM customer_reviews;

SELECT * FROM employees;

ALTER TABLE employees
DROP COLUMN hourly_wage;

ALTER TABLE employees
ADD COLUMN avg_customer_rating DECIMAL(10,1) AFTER position;

ALTER TABLE employees
MODIFY COLUMN avg_customer_rating DECIMAL(10,2) NOT NULL;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);
