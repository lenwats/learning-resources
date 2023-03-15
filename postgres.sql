psql --username=freecodecamp --dbname=postgres 

\l /* list */
\d /* display */
\c /* connect */

\c database_name 

CREATE DATABASE database_name;

CREATE TABLE table_name();
CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);
DROP TABLE table_name;

ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
ALTER TABLE table_name ADD UNIQUE(column_name);
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name); /* create foreign key */
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column); /* create foreign key on existing column */
ALTER TABLE table_name ADD PRIMARY KEY(column1, column2); /* create composite key */

INSERT INTO table_name(column_1, column_2) VALUES(value1, value2); /* INSERT for one record */
INSERT INTO characters(name, homeland, favorite_color) VALUES('Mario', 'Mushroom Kingdom', 'Red'), ('Luigi', 'Mushroom Kingdom', 'Green'), ('Peach', 'Mushroom Kingdom', 'Pink'); /* INSERT for multiple records */

SELECT columns FROM table_name;
SELECT columns FROM table_name ORDER BY column_name;

DELETE FROM table_name WHERE condition;

ALTER DATABASE database_name RENAME TO new_database_name;

UPDATE table_name SET column_name=new_value WHERE condition;

SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column; /* FULL JOIN */

SELECT columns FROM junction_table FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column; /* FULL JOIN on table with composite key */