# Week 1

> "Every hour, every day, digital databases quietly store, cross-reference, and return information on every aspect of our lives."

https://www.computerhistory.org/revolution/memory-storage/8/265

## Topics

- [What is a database?](#what-is-a-database-1)
- [Querying data with SQL](#querying-data-with-sql2)
- [Querying from multiple tables](#querying-from-multiple-tables)

## What is a database? <sup>[[1]](#references)</sup>

A database's primary purpose is to provide a mechanism for storing and retrieving information. There are many different types of databases but they all provides these two capabilities.

The easiest way to understand a database is as a collection of related files. Imagine a file (either paper or digital) of sales orders in a shop. Then there's another file of products, containing stock records. To fulfil an order, you'd need to look up the product in the order file and then look up and adjust the stock levels for that particular product in the product file. A database and the software that controls the database, called a database management system (DBMS), helps with this kind of task.

Most databases today are **relational databases**, named such because they deal with tables of data related by a common field. For example, [Table 1](#table-1---products) below shows the product table, and [Table 2](#table-2---orders) shows the orders table. As you can see, the relation between the two tables is based on the common field product_code. Any two tables can relate to each other simply by having a field in common.

#### Table 1 - Products

| `product_code` | `description`     | `price` |
| -------------- | ----------------- | ------- |
| A416           | nails, box        | €0.14   |
| C923           | drawing pins, box | €0.08   |

#### Table 2 - Orders

| `order_code` | `order_item` | `product_code` | `quantity` |
| ------------ | ------------ | -------------- | ---------- |
| 3804         | 1            | A416           | 10         |
| 3804         | 2            | C923           | 15         |

> [!IMPORTANT]
> Any two tables can relate to each other simply by creating a field they have in common. Table 1 and Table 2 share the `product_code` column.

Let's take a closer look at the previous two tables to see how they are organized:

- Each table consists of many **rows** and **columns**.
- Each new **row** contains data about one single entity (such as one product or one order line). This is also called a record. For example, the first row in Table 1 is a record; it describes the A416 product, which is a box of nails that costs fourteen cents.
  > [!NOTE]
  > The terms _row_ and _record_ are interchangeable.
- Each **column** (also called an attribute) contains one piece of data that relates to the record. Examples of attributes are the quantity of an item sold (`quantity`) or the price of a product (`price`).

> [!NOTE]
> The terms _column_ and _attribute_ are interchangeable.

Given this kind of structure, the database gives you a way to manipulate this data: SQL. SQL (structured query language) is a powerful way to search for records or make changes.

Relational databases go hand-in-hand with the development of SQL. The simplicity of SQL - where even a novice can learn to perform basic queries in a short period of time - is a large part of the reason for the popularity of the relational model.

SQL is relatively simple to start learning because it's a declarative language. This means the programmer does not directly describe computations (like in Javascript), but instead describes the desired result. It is up to the database to interpret the statements into computations, to produce such a result.

Almost all DBMSs use SQL, although many have added their own enhancements to it. This means that when you learn using a specific DBMS like MySQL, almost all of it is not specific to MySQL and can be used with other relational databases as well, such as PostgreSQL, SQLite, MariaDB, and SQL Server.

> [!TIP]
> SQL is pronounced "sequel"

There are many other types of databases besides relational databases, such as graph databases, non-relational databases (also called NoSQL databases), and key-value databases. In this module, we'll focus on relational databases (SQL), using MySQL for the exercises.

## SQL

SQL (Structured Query Language) is a standard programming language designed for managing and manipulating relational databases. It provides a powerful set of commands for querying, updating, and managing data stored in a relational database management system (RDBMS). This comprehensive guide aims to provide a detailed understanding of SQL, covering its syntax, data manipulation capabilities, data definition commands, advanced querying techniques, and more.

> [!IMPORTANT]
> This sections assumes you have the `world` database setup in your computer. If it isn't, complete the [setup guide](../setup/README.md) before continuing.

### Setting up a sample database

In this section we expect you to follow along the commands. We'll be using an example database - `world`[<sup>[3]</sup>](#references) - that contains data on cities, countries, and languages.

## Querying Data with SQL<sup>[[2]](#references)</sup>

In this section, we will be learning different SQL commands to query tables in a database.

One of the core purposes of the SQL language is to retrieve information stored in a database. This is commonly referred to as querying. SQL queries allow us to communicate with the database by asking questions in the form of a structured formal language and obtaining all matching data as a result.

Let’s get started! We should get familiar with the `city` table.

In DBeaver, open a SQL console and then type the following:

![alt text](image.png)

```sql
SELECT * FROM city;
```

### SELECT

`SELECT` is used every time you want to query data from a database and `*` means all columns.

Suppose we are only interested in two of the columns. We can select individual columns by their names (separated by a comma):

```SQL
SELECT column1, column2
FROM table_name;
```

To make it easier to read, we moved FROM to another line.

Line breaks don’t mean anything specific in SQL. We could write this entire query in one line, and it would run just fine.

Let’s only select the name and district columns of the table:

```sql
SELECT name, district FROM city;

-- +----------------+---------------+
-- | name           | district      |
-- +----------------+---------------+
-- | Kabul          | Kabol         |
-- | Qandahar       | Qandahar      |
-- | Herat          | Herat         |
-- (...)
-- 4079 rows in set
```

Now we want to include a third column.

Edit your query so that it returns the name, district, and population columns of the table.

```sql
-- Edit the query
SELECT ...
```

<details>
<summary>View solution</summary>

```sql
SELECT name, district, population FROM city;

-- +----------------+---------------+------------+
-- | name           | district      | population |
-- +----------------+---------------+------------+
-- | Kabul          | Kabol         |    1780000 |
-- | Qandahar       | Qandahar      |     237500 |
-- | Herat          | Herat         |     186800 |
-- (...)
-- 4079 rows in set
```

</details>

### AS

Knowing how `SELECT` works, suppose we have the code below:

```sql
SELECT name AS 'City Name' FROM city;
```

Can you guess what `AS` does?

`AS` is a keyword in SQL that allows you to rename a column or table using an alias. The new name can be anything you want. Here we renamed the name column as `City Name`.

> [!IMPORTANT]
> When using `AS`, the columns are not being renamed in the table. The aliases only appear in the result.

To experiment with what the `AS` keyword does, select the population column and rename it with an alias of your choosing:

```sql
-- Return population column with an alias
SELECT ___ AS '______' FROM city;
```

<details>
<summary>View solution</summary>

```sql
--- Example
SELECT population as 'Number of Habitants' FROM city;
```

</details>

<br>

Now, edit the query so that instead of selecting and renaming `population`, select the `countrycode` column and rename it to `ISO Country Code`

```sql
-- Return countrycode column with an alias
SELECT ___ AS '______' FROM city;
```

<details>
<summary>View solution</summary>

```sql
SELECT countrycode as 'ISO Country Code' FROM city;

-- +------------------+
-- | ISO Country Code |
-- +------------------+
-- | ABW              |
-- | AFG              |
-- (...)
-- 4079 rows in set

```

</details><br>

> [!TIP]
> You can alias multiple columns in a single query:
>
> ```sql
> SELECT name AS n, countrycode AS c FROM city;
> ```

### `DISTINCT`

When we are examining data in a table, it can be helpful to know what distinct values exist in a particular column.

`DISTINCT` is used to return unique values in the output. It filters out all duplicate values in the specified column(s).

For instance,

```sql
SELECT name, countrycode from city;
```

will produce:

| `name`         | `countrycode` |
| -------------- | ------------- |
| Kabul          | AFG           |
| Qandahar       | AFG           |
| Herat          | AFG           |
| Mazar-e-Sharif | AFG           |
| Amsterdam      | NLD           |
| Rotterdam      | NLD           |
| Haag           | NLD           |
| Utrecht        | NLD           |
| (...)          | (...)         |

You'll notice there are multiple cities from countries `AFG`, and `NLD`.

It is easier to see the different `countrycode`s in the `city` table after the data has been filtered than to scan every row in the table.

You can do that by adding a `DISTINCT` before the column name. Let's try it out:

```sql
SELECT DISTINCT countrycode FROM city;
```

the result would now be:

| `countrycode` |
| ------------- |
| ABW           |
| AFG           |
| AGO           |
| AIA           |
| ALB           |
| AND           |
| (...)         |

You should notice no `countrycode` is listed more than once.

Now, change the code so we return the unique values of the `district` column instead.

```sql
-- Return the unique values of the `district` column
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT DISTINCT district from city;

-- +---------------+
-- | district      |
-- +---------------+
-- | Kabol         |
-- | Qandahar      |
-- | Herat         |
-- (...)
-- 4079 rows in set
```

</details>

### `FROM`

In your very first query:

```sql
SELECT * FROM city
```

the `FROM` command is used to specify which table(s) to select data from.

The `world` database also has a `country` table. We can retrieve data from that table by changing the `FROM` clause:

```sql
SELECT * from country;

-- +-------+-------------+---------------+---------------------------+-------+---------+-------+
-- | Code  | Name        | Continent     | Region                    | (...) | Capital | Code2 |
-- +-------+-------------+---------------+---------------------------+-------+---------+-------|
-- | ABW   | Aruba       | North America | Caribbean                 | (...) |     129 | AW    |
-- | AFG   | Afghanistan | Asia          | Southern and Central Asia | (...) |       1 | AF    |
-- | AGO   | Angola      | Africa        | Central Africa            | (...) |      56 | AO    |
-- | (...) | (...)       | (...)         | (...)                     | (...) |   (...) | (...) |
-- +------ +-------------+---------------+---------------------------+-------+---------+-------|
```

> [!TIP]
> You can see which tables exist in the `world` database with a command:
>
> ```sql
> SHOW TABLES;
> ```
>
> In DBeaver, open `Databases > 'world' > Tables` on the left sidebar.

> [!IMPORTANT] > `SELECT` and `FROM` are the most basic SQL query operators. They allows to specify which tables (`FROM`) and columns (`SELECT`) we want to retrieve from the database.

### `WHERE`

We can restrict our query results using the `WHERE` clause in order to obtain only the information we want.

Following this format, the statement below filters the result set to only include the most populated cities (over 5 million habitants):

```sql
SELECT * FROM city WHERE population > 5000000;

-- +------+----------------+-------------+----------------+------------+
-- | ID   | Name           | CountryCode | District       | Population |
-- +------+----------------+-------------+----------------+------------+
-- |  206 | São Paulo      | BRA         | São Paulo      |    9968485 |
-- |  207 | Rio de Janeiro | BRA         | Rio de Janeiro |    5598953 |
-- (...)
-- 24 rows in set
```

How does it work?

1. The `WHERE` clause filters the result set to only include rows where the following condition is true.

1. `population > 5000000` is the condition. Here, only rows with a value greater than 5000000 in the `population` column will be returned.

The `>` is an operator. Operators create a condition that can be evaluated as either _true_ or _false_.

Comparison operators used with the `WHERE` clause are:

- `=` equal to
- `<>` or `!=` not equal to
- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

There are also some special operators that we will learn more about in the upcoming exercises.

Now, suppose we want to known which are the _least_ populated cities (population under 1000):

```sql
-- Retrieve the cities with less than 1000 people. Select all columns
SELECT ...
```

<details>
<summary>View solution</summary>

```sql
SELECT * FROM city WHERE population < 1000;

-- +------+---------------------+-------------+-------------+------------+
-- | ID   | Name                | CountryCode | District    | Population |
-- +------+---------------------+-------------+-------------+------------+
-- |   61 | South Hill          | AIA         | –           |        961 |
-- |   62 | The Valley          | AIA         | –           |        595 |
-- | 1791 | Flying Fish Cove    | CXR         | –           |        700 |
-- (...)
-- 11 rows in set
```

</details><br>

> [!TIP] You can compare the values of two columns in a `WHERE` clause:
>
> ```sql
> SELECT x, y FROM coordinates WHERE x > y;
> ```

### `LIKE`

`LIKE` can be a useful operator when you want to compare similar values.

There are 2 cities in China with similar names: `Anshun` and `Anshan`.

How could we select all cities that start with ‘Ansh’ and end with ‘n’ and have exactly one character in between?

```sql
SELECT * FROM city WHERE name LIKE 'Ansh_n';

-- +------+--------+-------------+----------+------------+
-- | ID   | Name   | CountryCode | District | Population |
-- +------+--------+-------------+----------+------------+
-- | 1918 | Anshan | CHN         | Liaoning |    1200000 |
-- | 2106 | Anshun | CHN         | Guizhou  |     174142 |
-- +------+--------+-------------+----------+------------+
```

- `LIKE` is a special operator used with the `WHERE` clause to search for a specific pattern in a column.

- `name LIKE 'Se_en'` is a condition evaluating the name column for a specific pattern.

- `Ansh_n` represents a pattern with a wildcard character.

The `_` means you can substitute any individual character here without breaking the pattern. The names `Anshan` and `Anshun` both match this pattern.

#### Percentage wildcard - `%`

The percentage sign `%` is another wildcard character that can be used with `LIKE`.

This statement below filters the result set to only include cities with names that begin with the word ‘San’:

```sql
SELECT *
FROM city
WHERE name LIKE 'San%';
```

`%` is a wildcard character that matches zero or more missing characters in the pattern. For example:

- `A%` matches all cities with names that begin with letter ‘A’
- `%a` matches all cities that end with ‘a’
- `San %` matches all cities with names that begin with the word `San` (mind the whitespace!)
  - ✅ `San Felipe`, `San Francisco`, `San Marino`...
  - ❌ `Santa Monica`
- `%land` matches all cities with names that end with `land`
  - `Sunderland`, `Auckland`, `Portland`...

We can also use `%` both before and after a pattern:

```sql
SELECT * FROM city WHERE name LIKE '%los%';

-- +------+----------------------------+-------------+--------------+------------+
-- | ID   | Name                       | CountryCode | District     | Population |
-- +------+----------------------------+-------------+--------------+------------+
-- |  117 | San Nicolás de los Arroyos | ARG         | Buenos Aires |     119302 |
-- |  316 | São Carlos                 | BRA         | São Paulo    |     187122 |
-- |  357 | Ferraz de Vasconcelos      | BRA         | São Paulo    |     139283 |
-- |  568 | Los Angeles                | CHL         | Bíobío       |     158215 |
-- (...)
```

Here, any city that contains the word ‘los’ in its name will be returned in the result.

`LIKE` is not case sensitive. ‘Los Angeles’ and ‘São Carlos’ both appear in the result of the query above.

How many cities contain the word `saint`?

```sql
-- Return the cities with names that contain the word 'saint'
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT * FROM city WHERE name LIKE '%saint%';
-- Answer: 13 cities
```

</details><br>

One more: how many cities _begin_ with the word `New`? Tip: you may need a space in there.

```sql
-- Return the cities with names that start with the word 'New'
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT * FROM city WHERE name LIKE 'New %';

-- +------+-------------+-------------+---------------+------------+
-- | ID   | Name        | CountryCode | District      | Population |
-- +------+-------------+-------------+---------------+------------+
-- | 1106 | New Bombay  | IND         | Maharashtra   |     307297 |
-- | 1109 | New Delhi   | IND         | Delhi         |     301297 |
-- | 3793 | New York    | USA         | New York      |    8008278 |
-- | 3823 | New Orleans | USA         | Louisiana     |     484674 |
-- | 3971 | New Haven   | USA         | Connecticut   |     123626 |
-- | 4044 | New Bedford | USA         | Massachusetts |      94780 |
-- +------+-------------+-------------+---------------+------------+
-- 6 rows in set (0,01 sec)
```

</details><br>

### Null

Let's go over to the `country` table for a while.

This table has more columns, and some records contain a few missing values. More often than not, the data you encounter will have missing values.

- Unknown values are indicated by `NULL`.
- It is not possible to test for `NULL` values with comparison operators, such as `=` and `!=`.
- Instead, we will have to use these operators:
  - `IS NULL`
  - `IS NOT NULL`

For example, we can use `IS NOT NULL` to retrieve countries for which an independence year is registered (`indepyear` column):

```sql
SELECT name, indepyear FROM country WHERE indepyear IS NOT NULL

-- +----------------------+-----------+
-- | name                 | indepyear |
-- +----------------------+-----------+
-- | Afghanistan          |      1919 |
-- | Angola               |      1975 |
-- | Albania              |      1912 |
-- (...)
```

Now let’s do the opposite. Write a query to find all countries for which there is no independence day registered:

```sql
-- Retrieve countries without an independence. Select only the 'name' column
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT name FROM country WHERE indepyear IS NULL;

-- +----------+
-- | name     |
-- +----------+
-- | Aruba    |
-- | Anguilla |
-- (...)
```

</details>

### `AND`

Sometimes we want to combine multiple conditions in a `WHERE` clause to make the result set more specific and useful.

One way of doing this is to use the `AND` operator. Here, we use the `AND` operator to only return European countries with over 1 million of population:

```sql
SELECT *
FROM country
WHERE continent = 'Europe'
AND population > 1000000;

-- other columns omitted
-- +---------+------------+
-- | name    | population |
-- +---------+------------+
-- | Albania |    3401200 |
-- | Austria |    8091800 |
-- | Belgium |   10239000 |
-- (...)
-- 35 rows in set
```

- `continent = 'Europe'` is the 1st condition
- `population > 1000000` is the 2nd condition
- `AND` combines the 2 conditions

<img src="./images/image.png" alt="and condition" width="66%"/>

With `AND`, both conditions must be true for the row to be included in the result.

Now, let's go back to the `city` table and practice! Retrieve every city from the United States (hint: also known as `USA`), that have few inhabitants (less than 90 thousand):

```sql
-- Retrieve cities in the USA with less than 90 thousand of population
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT * FROM city WHERE countrycode = 'USA' AND population < 90000;

-- +------+------------+-------------+----------------+------------+
-- | ID   | Name       | CountryCode | District       | Population |
-- +------+------------+-------------+----------------+------------+
-- | 4062 | Kenosha    | USA         | Wisconsin      |      89447 |
-- | 4063 | Elgin      | USA         | Illinois       |      89408 |
-- (...)
-- 5 rows in set
```

</details><br>

Finally, how many German cities in district of 'Nordrhein-Westfalen' have over 250 thousand inhabitants?

```sql
-- Retrieve cities in the district of Nordrhein-Westfalen with more than 250000 of population
SELECT ...
```

<details>

<summary>View solution</summary>

```sql
SELECT * from city where district  = 'Nordrhein-Westfalen' and population > 250000;

-- +------+-------------+-------------+---------------------+------------+
-- | ID   | Name        | CountryCode | District            | Population |
-- +------+-------------+-------------+---------------------+------------+
-- | 3071 | Köln        | DEU         | Nordrhein-Westfalen |     962507 |
-- | 3073 | Essen       | DEU         | Nordrhein-Westfalen |     599515 |
-- (...)
-- 12 rows in set
```

</details><br>

### `OR`

Similar to `AND`, the `OR` operator can also be used to combine multiple conditions in `WHERE`, but there is a fundamental difference:

- `AND` operator displays a row if _all_ the conditions are true.
- `OR` operator displays a row if _any_ condition is true.

Suppose you're considering a vacation either in Portugal or Spain:

```sql
SELECT *
FROM city
WHERE countrycode = 'PRT' OR countrycode = 'ESP';

-- +-----+---------+-------------+----------+------------+
-- | ID  | Name    | CountryCode | District | Population |
-- +-----+---------+-------------+----------+------------+
-- | 653 | Madrid  | ESP         | Madrid   |    2879052 |
-- (...)
-- | 2914 | Lisboa | PRT         | Lisboa   |     563210 |
-- (...)
-- 64 rows in set
```

- `contrycode = 'PRT'` is the 1st condition
- `contrycode = 'ESP'` is the 2nd condition
- `OR` combines the two conditions

<img src="./images/image-1.png" alt="or condition" width="66%"/>

With `OR`, if any of the conditions are true, then the row is added to the result.

It's your turn! Write a query that returns all cities in either Finland (`FIN`) or Norway (`NOR`)

```sql
-- Retrieve cities in either Finland or Norway
SELECT ...
```

<details>
<summary>View solution</summary>

```sql
SELECT * FROM city WHERE countrycode  = 'FIN' OR countrycode = 'NOR';

-- +------+------------------------+-------------+----------+------------+
-- | ID   | Name                   | CountryCode | District | Population |
-- +------+------------------------+-------------+----------+------------+
-- | 3236 | Helsinki [Helsingfors] | FIN         | Newmaa   |     555474 |
-- (...)
-- | 2807 | Oslo                   | NOR         | Oslo     |     508726 |
-- (...)
-- 12 rows in set
```

</details><br>

### `ORDER BY`

It is often useful to list the data in our result set in a particular order.

We can sort the results using `ORDER BY`, either alphabetically or numerically. Sorting the results often makes the data more useful and easier to analyze.

For example, if we want to sort everything by the cities' name from A through Z:

```sql
SELECT * FROM city ORDER BY name;
```

- `ORDER BY` is a clause that indicates you want to sort the result set by a particular column.
- `name` is the specified column.

Sometimes we want to sort things in a decreasing order. For example, if we want to select cities with a large population, sorted from highest to lowest:

```sql
SELECT *
FROM city
WHERE population > 9000000
ORDER BY population DESC;

-- +------+-----------------+-------------+--------------+------------+
-- | ID   | Name            | CountryCode | District     | Population |
-- +------+-----------------+-------------+--------------+------------+
-- | 1024 | Mumbai (Bombay) | IND         | Maharashtra  |   10500000 |
-- | 2331 | Seoul           | KOR         | Seoul        |    9981619 |
-- (...)
-- 6 rows in set
```

- `DESC` is a keyword used in `ORDER BY` to sort the results in `descending` order (high to low or Z-A).

- `ASC` is a keyword used in `ORDER BY` to sort the results in ascending order (low to high or A-Z).

The column that we `ORDER BY` doesn’t even have to be one of the columns that we’re displaying.

Note: `ORDER BY` always goes after `WHERE` (if `WHERE` is present).

Your turn! Write a query that retrieves the `name` and `population` columns of all cities, ordered by their name in _descending_ alphabetical order.

```sql
-- Retrieve cities in descending alphabetical order by name. Retrieve `name` and `population`
SELECT ...
```

<details>
<summary>View solution</summary>

```sql
SELECT name, population FROM city ORDER BY name DESC;

-- +---------+------------+
-- | name    | population |
-- +---------+------------+
-- | Zytomyr |     297000 |
-- | Zwolle  |     105819 |
-- | Zwickau |     104146 |
-- (...)
-- 4079 rows in set
```

</details>

### `LIMIT`

You may have noticed that the `city` table contains thousands of records. Sometimes, it's useful to cap the numbers of rows in query results, to reduce noise.

For example, imagine that we just want to see a few examples of records:

```sql
SELECT *
FROM city
LIMIT 10;
```

- `LIMIT` is a clause that lets you specify the maximum number of rows the result set will have. This saves space on our screen and makes our queries run faster.

- Here, we specify that the result set can’t have more than 10 rows.

- `LIMIT` always goes at the very end of the query

Your turn! Combining your knowledge of `LIMIT` and `ORDER BY`, write a query that returns the top 3 highest populated cities.

```sql
-- Retrieve the 3 most populated cities. Select all columns
SELECT ...
```

<details>
<summary>View solution</summary>

```sql
SELECT * FROM city ORDER by population DESC LIMIT 3;

-- +------+-----------------+-------------+-------------+------------+
-- | ID   | Name            | CountryCode | District    | Population |
-- +------+-----------------+-------------+-------------+------------+
-- | 1024 | Mumbai (Bombay) | IND         | Maharashtra |   10500000 |
-- | 2331 | Seoul           | KOR         | Seoul       |    9981619 |
-- |  206 | São Paulo       | BRA         | São Paulo   |    9968485 |
-- +------+-----------------+-------------+-------------+------------+
-- 3 rows in set
```

</details>

> [!TIP] If the number set in the `LIMIT` clause surpasses the number of rows available to select, then it will just return the rows that are present.

## Querying from multiple tables

As introduced in the ["What is a database?"](#what-is-a-database-1) section, in order to efficiently store data, we often spread related information across multiple tables.

For example, in the `city` table, let's assume we want more information about the country. We could add the country information to the `city` table:

| `city_id` | `city_name`  | `city_district`  | `city_population` | `country_code` | `country_name`       | `country_continent` | `country_surfacearea` |
| --------- | ------------ | ---------------- | ----------------- | -------------- | -------------------- | ------------------- | --------------------- |
| 1         | Kabul        | Kabol            | 1780000           | AFG            | Afghanistan          | Asia                | 652090.00             |
| 2         | Qandahar     | Qandahar         | 237500            | AFG            | Afghanistan          | Asia                | 652090.00             |
| 3         | Herat        | Herat            | 186800            | AFG            | Afghanistan          | Asia                | 652090.00             |
| ...       | ...          | ...              | ...               | ...            | ...                  | ...                 | ...                   |
| 56        | Luanda       | Luanda           | 2022000           | AGO            | Angola               | Africa              | 1246700.00            |
| 57        | Huambo       | Huambo           | 163100            | AGO            | Angola               | Africa              | 1246700.00            |
| 58        | Lobito       | Benguela         | 130000            | AGO            | Angola               | Africa              | 1246700.00            |
| ...       | ...          | ...              | ...               | ...            | ...                  | ...                 | ...                   |
| 61        | South Hill   | –                | 961               | AIA            | Anguilla             | North America       | 96.00                 |
| 62        | The Valley   | –                | 595               | AIA            | Anguilla             | North America       | 96.00                 |
| 34        | Tirana       | Tirana           | 270000            | ALB            | Albania              | Europe              | 28748.00              |
| ...       | ...          | ...              | ...               | ...            | ...                  | ...                 | ...                   |
| 64        | Dubai        | Dubai            | 669181            | ARE            | United Arab Emirates | Asia                | 83600.00              |
| 65        | Abu Dhabi    | Abu Dhabi        | 398695            | ARE            | United Arab Emirates | Asia                | 83600.00              |
| 66        | Sharja       | Sharja           | 320095            | ARE            | United Arab Emirates | Asia                | 83600.00              |
| ...       | ...          | ...              | ...               | ...            | ...                  | ...                 | ...                   |
| 69        | Buenos Aires | Distrito Federal | 2982146           | ARG            | Argentina            | South America       | 2780400.00            |
| 70        | La Matanza   | Buenos Aires     | 1266461           | ARG            | Argentina            | South America       | 2780400.00            |
| 71        | Córdoba      | Córdoba          | 1157507           | ARG            | Argentina            | South America       | 2780400.00            |
| ...       | ...          | ...              | ...               | ...            | ...                  | ...                 | ...                   |

However, a lot of this information would be repeated. Notice how for cities in the same country all the `country_(...)` information is the same. This will make our table big and unmanageable.

Instead, the data is split into 2 tables: `city` and `country`, the ones you've using so far.

1. `city` contains information about the cities:
   - `id`, `name`, `countrycode`, `district`, and population
1. `country` contains information about each country:
   - `code`, `name`, `continent`, `region`, `surfacearea`, and more...

### Combining Tables

If we just look at the `city` table, we can't know more details about the respective country. However, if we refer to the `country` table, we can get a complete picture:

```sql
SELECT * FROM city;
-- +----+----------------+-------------+---------------+------------+
-- | ID | Name           | CountryCode | District      | Population |
-- +----+----------------+-------------+---------------+------------+
-- |  1 | Kabul          | AFG         | Kabol         |    1780000 |
-- |  2 | Qandahar       | AFG         | Qandahar      |     237500 |
-- (...)
-- |  6 | Rotterdam      | NLD         | Zuid-Holland  |     593321 |
-- |  7 | Haag           | NLD         | Zuid-Holland  |     440900 |
-- (...)

SELECT code, name, continent, region from country;

-- +------+-------------+---------------+---------------------------+
-- | code | name        | continent     | region                    |
-- +------+-------------+---------------+---------------------------+
-- | ABW  | Aruba       | North America | Caribbean                 |
-- | AFG  | Afghanistan | Asia          | Southern and Central Asia |
-- (...)
-- | NLD  | Netherlands    | Europe        | Western Europe         |
-- | NOR  | Norway         | Europe        | Nordic Countries       |
-- (...)
```

To find out more about the country where Rotterdam is located, we can look in the `country` table for the record with code `NLD`. We can then see that Rotterdam is in the Netherlands, located in Europe.

Doing this kind of matching is called joining two tables.

> [!IMPORTANT]
> Notice how `city.countrycode` matches `country.code` values

### `JOIN`

Combining tables manually is time-consuming. Luckily, SQL gives us an easy sequence for this: it’s called a `JOIN`.

If we want to combine cities and countries, we would type:

```sql
SELECT *                                -- [1]
FROM city                               -- [2]
join country                            -- [3]
    on city.countrycode = country.code; -- [4]
```

Let’s break down this command:

1. Selects all columns from our combined table. If we only want to select certain columns, we can specify which ones we want.
1. Specifies the first table that we want to look in, `city`
1. Uses `JOIN` to say that we want to combine information from `city` with `country`
1. The fourth line tells us how to combine the two tables. We want to match `city` table’s `countrycode` column with `country` table’s `code` column.

> [!IMPORTANT]
> Because column names are often repeated across multiple tables, we use the syntax `table_name.column_name` to be sure that our requests for columns are unambiguous.

When we perform a simple `JOIN` (often called an inner join) our result only includes rows that match our `ON` condition. The result will not include the non-matching entries.

<img src="./images/inner-join.webp" alt="inner join" width="66%"/>

> [!NOTE]
> There are multiple types of `JOIN` clauses, for example `LEFT JOIN`. We'll cover those later in the module.

It's your turn! Write a query to return country names, their population, and languages spoken? Hint: you need to use the `country` and `countrylanguage` table.

```sql
-- Retrieve country names, their population, and languages spoken (one language per row)
SELECT * from ...
```

<details>
<summary>View solution</summary>

```sql
SELECT country.name, country.population, countrylanguage.language
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countryCode

-- +-------------+------------+------------+
-- | name        | population | language   |
-- +-------------+------------+------------+
-- | Aruba       |     103000 | Dutch      |
-- | Aruba       |     103000 | English    |
-- | Aruba       |     103000 | Papiamento |
-- | Aruba       |     103000 | Spanish    |
-- | Afghanistan |   22720000 | Balochi    |
-- | Afghanistan |   22720000 | Dari       |
-- | Afghanistan |   22720000 | Pashto     |
-- | Afghanistan |   22720000 | Turkmenian |
-- | Afghanistan |   22720000 | Uzbek      |
-- (...)
-- 984 rows in set
```

</details><br>

### Summary

We just learned how to query data from a database using SQL from real life `world` data. We also learned how to filter queries to make the information more specific and useful.

In summary:

- `SELECT` is the clause we use every time we want to query information from a database.
- `AS` renames a column or table.
- `DISTINCT` return unique values.
- `WHERE` is a popular command that lets you filter the results of the query based on conditions that you specify.
- `LIKE` is a special operator that accepts wildcards ( for example `%s`, and `_`).
- `AND` and `OR` combines multiple conditions.
- `ORDER BY` sorts the result.
- `LIMIT` specifies the maximum number of rows that the query will return.
- `JOIN` will combine rows from different tables if the join condition is true.

Feel free to experiment a bit more with the `world` database before moving on!

## What's next?

That's it for Week 1's theoretical content. Next, you should focus on the [exercises for this week](./EXERCISES.md).

## References

[1] Adapted from MariaDB's ["Introduction to Relational Databases"](https://mariadb.com/kb/en/introduction-to-relational-databases/)

[2] Adapted from Codecademy's ["Learn SQL"](https://www.codecademy.com/enrolled/courses/learn-sql) course

[3] Sample `world` database from [MySQL / Oracle](https://dev.mysql.com/doc/world-setup/en/)
