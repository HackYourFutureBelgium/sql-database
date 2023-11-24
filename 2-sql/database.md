# SQL Database

## Introduction

In SQL, creating, managing, and using databases are fundamental tasks. This document provides a comprehensive guide on how to create, drop, rename, and use databases in SQL, complete with examples for each operation.

## Creating a Database

To create a new database in SQL, you can use the `CREATE DATABASE` statement. You specify the name of the database you want to create, as follows:

```sql
CREATE DATABASE my_database;
```

In this example, a new database named "my_database" is created.

## Dropping a Database

To delete a database and all its associated data, you can use the `DROP DATABASE` statement. Be extremely cautious when using this statement, as it permanently removes all data in the database.

```sql
DROP DATABASE my_database;
```

This command will delete the "my_database" along with all its tables, views, and data.

## Using a Database

Once you have created a database, you can use it in your SQL queries. To specify which database you want to work with, use the `USE` statement:

```sql
USE my_database;
```

This command instructs the SQL server to set "my_database" as the current working database. All subsequent SQL queries will be executed within this database context.
