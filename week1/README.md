# Week 1

> "Every hour, every day, digital databases quietly store, cross-reference, and return information on every aspect of our lives."

https://www.computerhistory.org/revolution/memory-storage/8/265

## Topics

- [What is a database?](#what-is-a-database-1)
- [SQL](#what-is-a-database-1)
- TBD

## What is a database? <sup>[1]</sup>

A database's primary purpose is to provide a mechanism for storing and retrieving information. There are many different types of databases but they all provides these two capabilities.

The easiest way to understand a database is as a collection of related files. Imagine a file (either paper or digital) of sales orders in a shop. Then there's another file of products, containing stock records. To fulfil an order, you'd need to look up the product in the order file and then look up and adjust the stock levels for that particular product in the product file. A database and the software that controls the database, called a database management system (DBMS), helps with this kind of task.

Most databases today are **relational databases**, named such because they deal with tables of data related by a common field. For example, [Table 1](#table-1---products) below shows the product table, and [Table 2](#table-2---orders) shows the orders table. As you can see, the relation between the two tables is based on the common field product_code. Any two tables can relate to each other simply by having a field in common.

#### Table 1 - Products
| `product_code` | `description`       | `price` |
|--------------|-------------------|-------|
| A416         | nails, box        | €0.14 |
| C923         | drawing pins, box | €0.08 |

#### Table 2 - Orders
| `order_code` | `order_item` | `product_code` | `quantity` |
|--------------|--------------|--------------|----------|
| 3804         | 1            | A416         | 10       |
| 3804         | 2            | C923         | 15       |

> [!IMPORTANT]
> Any two tables can relate to each other simply by creating a field they have in common. Table 1 and Table 2 share the `product_code` column.

Let's take a closer look at the previous two tables to see how they are organized:

- Each table consists of many **rows** and **columns**.
- Each new **row** contains data about one single entity (such as one product or one order line). This is also called a record. For example, the first row in Table 1 is a record; it describes the A416 product, which is a box of nails that costs fourteen cents. 
> [!NOTE] 
> The terms *row* and *record* are interchangeable.
- Each **column** (also called an attribute) contains one piece of data that relates to the record, called a tuple. Examples of attributes are the quantity of an item sold (`quantity`) or the price of a product (`price`). An attribute, when referring to a database table, is called a field. For example, the data in the `description` column in Table 1 are fields. 

> [!NOTE] 
> The terms *column*, *attribute* and *field* are interchangeable.

Given this kind of structure, the database gives you a way to manipulate this data: SQL. SQL (structured query language) is a powerful way to search for records or make changes. 

Relational databases go hand-in-hand with the development of SQL. The simplicity of SQL - where even a novice can learn to perform basic queries in a short period of time - is a large part of the reason for the popularity of the relational model.

Almost all DBMSs use SQL, although many have added their own enhancements to it. This means that when you learn using a specific DBMS like MySQL, almost all of it is not specific to MySQL and can be used with other relational databases as well, such as PostgreSQL, SQLite, MariaDB, and SQL Server. 

> [!TIP]
> SQL is pronounced "sequel"

There are many other types of databases besides relational databases, such as graph databases, non-relational databases (also called NoSQL databases), and key-value databases. In this module, we'll focus on relational databases (SQL), using MySQL for the exercises.

## SQL

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


## References

[1] Adapted from MariaDB's ["Introduction to Relational Databases"](https://mariadb.com/kb/en/introduction-to-relational-databases/)