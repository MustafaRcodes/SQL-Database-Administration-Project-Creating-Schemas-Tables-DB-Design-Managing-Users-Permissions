CREATE SCHEMA secondschema DEFAULT CHARACTER SET utf8mb4; -- Creating schema

USE new_schema;

-- Checking columns from table1 under new_schema 
-- SELECT t.ID FROM table1 t;

-- Creating tables and columns under new_schema
CREATE TABLE table2 (
    ID BIGINT NOT NULL,
    my_character_field VARCHAR(50), -- will take both text and numbers -- 
    my_text_filed TEXT,
    my_created_at TIMESTAMP,
    PRIMARY KEY (ID)
);

-- We need to create schema, called 'marketing_project'
-- Need to add table called 'publisher' with two columns 'publisher_id' (Integer) and 'publisher_name' (up to 65 chars)
-- adding second table called 'publisher_spend' with columns 'publisher_id' (Integer), 'month'(date) and spend (decimal)

CREATE SCHEMA marketing_project DEFAULT CHARACTER SET utf8mb4;
USE marketing_project;
CREATE TABLE publisher (
    publisher_id INT NOT NULL,
    publisher_name VARCHAR(65),
    PRIMARY KEY (publisher_id)
);
CREATE TABLE publisher_spend (
    publisher_spend_id VARCHAR(45) NOT NULL,
    publisher_id INT NOT NULL,
    month DATE NOT NULL,
    spend DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (publisher_spend_id)
);
