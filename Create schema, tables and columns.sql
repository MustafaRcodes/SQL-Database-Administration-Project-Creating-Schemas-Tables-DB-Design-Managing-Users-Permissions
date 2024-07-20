CREATE SCHEMA secondschema DEFAULT CHARACTER SET utf8mb4;

USE new_schema;

-- SELECT t.ID FROM table1 t;

CREATE TABLE table2 (
    ID BIGINT NOT NULL,
    my_character_field VARCHAR(50), -- will take both text and numbers -- 
    my_text_filed TEXT,
    my_created_at TIMESTAMP,
    PRIMARY KEY (ID)
);

