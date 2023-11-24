# SQL Data Types

## Introduction

In SQL, data types are crucial for defining the kind of data that can be stored in a column. Each column in a table is assigned a data type to specify the type of data it can hold. This document provides a comprehensive overview of SQL data types and includes examples for each.

## Common SQL Data Types

### 1. INTEGER

The INTEGER data type is used for whole numbers. It can store both positive and negative integers.

Example:

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Age INT,
    Grade INT
);
```

### 2. VARCHAR

The VARCHAR data type is used to store variable-length character strings. It's ideal for text data like names, addresses, or descriptions.

Example:

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
```

### 3. DECIMAL

The DECIMAL data type is used for fixed-point numbers with exact precision. It's suitable for financial or monetary values.

Example:

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);
```

### 4. DATE

The DATE data type is used for storing dates in the format 'YYYY-MM-DD'.

Example:

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT
);
```

### 5. BOOLEAN

The BOOLEAN data type is used for representing true or false values.

Example:

```sql
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100),
    IsComplete BOOLEAN
);
```

### 6. CHAR

The CHAR data type is used for storing fixed-length character strings. It's often used when you need a field of a specific length.

Example:

```sql
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    InvoiceNumber CHAR(10),
    TotalAmount DECIMAL(10, 2)
);
```

### 7. BLOB

The BLOB (Binary Large Object) data type is used to store binary data, such as images or multimedia files.

Example:

```sql
CREATE TABLE Images (
    ImageID INT PRIMARY KEY,
    ImageData BLOB
);
```

### 8. TIME

The TIME data type is used for storing time of day information.

Example:

```sql
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    AppointmentTime TIME,
    Description VARCHAR(200)
);
```

### 9. ENUM

The ENUM data type allows you to specify a list of values that a column can contain.

Example:

```sql
CREATE TABLE Survey (
    SurveyID INT PRIMARY KEY,
    Gender ENUM('Male', 'Female', 'Other'),
    Feedback VARCHAR(500)
);
```
