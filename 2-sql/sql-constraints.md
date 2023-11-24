# SQL Constraints

SQL provides constraints to ensure data accuracy and integrity. Constraints are rules that dictate what type of data can be stored in a table. There are two primary types of constraints: column-level and table-level.

## NOT NULL Constraint

The NOT NULL constraint ensures that a column cannot contain null (empty) values. It specifies that a value must be provided for the column when inserting data into the table. This is particularly useful for fields that must always have a value, such as a customer's name or age.

Example:

```sql
CREATE TABLE Customers(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
address CHAR(25),
salary DECIMAL(18, 2)
);
```

## DEFAULT Constraint

The DEFAULT constraint provides a default value for a column if no value is explicitly specified during data insertion. It ensures that a specific value is used when none is provided.

Example:

```sql
CREATE TABLE Customers(
id INT NOT NULL PRIMARY KEY ,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
address CHAR(25),
salary DECIMAL(18, 2) DEFAULT 5000.00
);
```

## UNIQUE KEY Constraint

The UNIQUE KEY constraint enforces the uniqueness of values in a column. It ensures that no two rows in the table can have the same value in the specified column. This is commonly used for fields like email addresses or social security numbers, which should be unique for each record.

Example :

```sql
CREATE TABLE Employees (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10, 2)
);

```

## PRIMARY KEY Constraint

The PRIMARY KEY constraint is used to uniquely identify each row in a table. It enforces the uniqueness of values in the specified column and ensures that it is not null. A primary key is essential for identifying and linking records in different tables.

Example:

```sql
CREATE TABLE Customers(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
address CHAR(25),
salary DECIMAL(18, 2)
);
```

## FOREIGN KEY Constraint

A FOREIGN KEY constraint is used to establish relationships between tables. It links a column in one table to the primary key of another table, creating connections between related data.

Example:

```sql
CREATE TABLE Customers(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
address CHAR(25),
salary DECIMAL(18, 2)
);

CREATE TABLE Orders (
id INT NOT NULL PRIMARY KEY ,
date DATETIME,
customer_id INT REFERENCES Customers(id),
amount DOUBLE
);
```

## CHECK Constraint

The CHECK constraint is used to ensure that values in a column meet specific conditions. It allows you to specify a condition that must be satisfied for data to be inserted or updated in the table.

Example:

```sql
CREATE TABLE Customers (
   id INT NOT NULL PRIMARY KEY,
   name VARCHAR(20) NOT NULL DEFAULT 'John Doe',
   age INT NOT NULL CHECK(AGE >= 20),
   address CHAR(25),
   salary DECIMAL(18, 2)
);
```
