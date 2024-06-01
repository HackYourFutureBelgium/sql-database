# SQL 

## Introduction

SQL (Structured Query Language) is a standard programming language designed for managing and manipulating relational databases. It provides a powerful set of commands for querying, updating, and managing data stored in a relational database management system (RDBMS). This comprehensive guide aims to provide a detailed understanding of SQL, covering its syntax, data manipulation capabilities, data definition commands, advanced querying techniques, and more.

## Basic SQL Commands

### SELECT Statement

The SELECT statement is used to retrieve data from one or more tables in a database. It allows you to specify the columns you want to retrieve and filter the rows based on certain criteria.

Example:

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

### INSERT Statement

The INSERT statement is used to add new rows of data into a table. It specifies the values to be inserted into each column.

Example:

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

### UPDATE Statement

The UPDATE statement is used to modify existing data in a table. It allows you to change the values of one or more columns in one or more rows.

Example:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
```

### DELETE Statement

The DELETE statement is used to remove one or more rows from a table based on a specified condition.

Example:

```sql
DELETE FROM table_name
WHERE condition;
```

## Data Definition Language (DDL)

### CREATE TABLE

The CREATE TABLE statement is used to create a new table in the database. It specifies the table name and the columns it will contain, along with their data types and any constraints.

Example:

```sql
CREATE TABLE table_name (
    column1 datatype1,
    column2 datatype2,
    ...
);
```

### ALTER TABLE

The ALTER TABLE statement is used to modify an existing table structure. It allows you to add, modify, or drop columns, as well as add or remove constraints.

Example:

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

### DROP TABLE

The DROP TABLE statement is used to delete an existing table from the database. It permanently removes all data and structure associated with the table.

Example:

```sql
DROP TABLE table_name;
```

## Data Manipulation Language (DML)

### INSERT INTO

The INSERT INTO statement is used to add new rows of data into a table. It specifies the values to be inserted into each column.

Example:

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

### UPDATE

The UPDATE statement is used to modify existing data in a table. It allows you to change the values of one or more columns in one or more rows.

Example:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
```

### DELETE FROM

The DELETE FROM statement is used to remove one or more rows from a table based on a specified condition.

Example:

```sql
DELETE FROM table_name
WHERE condition;
```

## Advanced SQL Queries

### Joins

Joins are used to combine rows from two or more tables based on a related column between them. Common types of joins include INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.

Example:

```sql
SELECT *
FROM table1
INNER JOIN table2 ON table1.column_name = table2.column_name;
```

### Subqueries

Subqueries are nested SELECT statements that can be used within another SQL statement. They can be used to filter, aggregate, or perform calculations on data.

Example:

```sql
SELECT *
FROM table_name
WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);
```

### Aggregation Functions

Aggregation functions are used to perform calculations on sets of data. Common aggregation functions include SUM, AVG, COUNT, MIN, and MAX.

Example:

```sql
SELECT AVG(column_name)
FROM table_name;
```

## Data Control Language (DCL)

### GRANT

The GRANT statement is used to give specific privileges to users or roles in a database. Privileges include SELECT, INSERT, UPDATE, DELETE, and more.

Example:

```sql
GRANT SELECT, INSERT ON table_name TO user_name;
```

### REVOKE

The REVOKE statement is used to revoke previously granted privileges from users or roles in a database.

Example:

```sql
REVOKE INSERT ON table_name FROM user_name;
```

## Data Querying Techniques

### Filtering Data

Filtering data involves selecting only the rows that meet specific criteria using the WHERE clause in a SELECT statement.

Example:
```sql
SELECT * FROM table_name WHERE column_name = value;
```

### Sorting Data

Sorting data involves arranging the rows of a result set in a specified order using the ORDER BY clause in a SELECT statement.

Example:

```sql
SELECT * FROM table_name ORDER BY column_name ASC;
```

### Grouping Data

Grouping data involves aggregating rows of a result set based on one or more columns using the GROUP BY clause in a SELECT statement.

Example:

```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;
```

### Transactions

### ACID Properties

Transactions in SQL adhere to the ACID properties: Atomicity, Consistency, Isolation, and Durability. Atomicity ensures that a transaction is treated as a single unit, Consistency ensures that the database remains in a consistent state before and after the transaction, Isolation ensures that multiple transactions can occur concurrently without interfering with each other, and Durability ensures that the changes made by a committed transaction are permanent and survive system failures.

### Transaction Control Commands

SQL provides commands for controlling transactions:

- **BEGIN TRANSACTION**: Starts a new transaction.
- **COMMIT**: Saves the changes made by a transaction to the database.
- **ROLLBACK**: Undoes the changes made by a transaction and restores the database to its previous state.
- **SAVEPOINT**: Sets a named point in a transaction to which you can later roll back.

Example:

```sql
BEGIN TRANSACTION;

-- SQL statements

COMMIT;
```

## SQL Best Practices

### Use of Indexes

Indexes are used to improve the performance of queries by allowing the database to quickly locate rows based on the indexed columns. It's important to create indexes on columns frequently used in WHERE clauses or JOIN conditions, but over-indexing should be avoided as it can degrade performance during data modifications.

Example:

```sql
CREATE INDEX index_name ON table_name (column_name);
```

### Normalization

Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves breaking down large tables into smaller, related tables and establishing relationships between them using foreign keys. This helps to minimize data duplication and ensures consistency throughout the database.

### Avoiding SQL Injection

SQL injection is a common security vulnerability that occurs when an attacker is able to manipulate SQL queries through user input. To prevent SQL injection, it's important to use parameterized queries or prepared statements, which separate SQL code from user input and sanitize input data before executing it.

Example (using parameterized query):

```sql
SELECT * FROM users WHERE username = ? AND password = ?;
```
