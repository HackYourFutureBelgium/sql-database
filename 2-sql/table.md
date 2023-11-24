# SQL Table

## Introduction

In SQL, tables are the core components for storing and organizing data. This document provides a comprehensive guide on how to create, drop, truncate, rename, and manipulate tables in SQL.

## Creating a Table

To create a new table in SQL, you can use the `CREATE TABLE` statement. You need to specify the table's name and define the columns it will contain, along with their data types.

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);
```

In this example, a new table named "employees" is created with columns for employee details such as ID, first name, last name, hire date, and salary.

## Dropping a Table

To delete a table and all its data, you can use the `DROP TABLE` statement. Be cautious when using this statement, as it permanently removes the table and all its records.

```sql
DROP TABLE employees;
```

This command deletes the "employees" table along with all its data.

## Truncating a Table

Truncating a table is different from dropping it. The `TRUNCATE TABLE` statement removes all rows from a table but keeps the table structure intact.

```sql
TRUNCATE TABLE employees;
```

This command deletes all rows in the "employees" table, effectively resetting it, but the table itself remains.

## Renaming a Table

Example:

```sql
RENAME TABLE <old_table_name> TO <new_table_name>
```

## Modifying a Table

You can modify an existing table in SQL using the `ALTER TABLE` statement. You can add or drop columns, change data types, or apply constraints.

Example:

```sql
-- Add a new column
ALTER TABLE employees
ADD COLUMN department VARCHAR(50);

-- Modify data type of an existing column
ALTER TABLE employees
ALTER COLUMN salary DECIMAL(12, 2);

-- Drop a column
ALTER TABLE employees
DROP COLUMN department;
```
