# Exercises Week 1

## Queries in the `world` database

> [!IMPORTANT]
> This assumes you have imported the `world` database as described [here](../setup/README.md).

Now that you know the fundamentals of SQL, it's time to practice retrieving data.

We'll be using the `world` database introduced in this week's [Readings](README.md).

Write an SQL query to answer each of the following questions about the world. You may need to use the `city`, `country`, or `countrylanguage` tables.

### Questions:

1. What are the names of countries with population greater than 8 million?
1. What are the names of countries that have “land” in their names?
1. What are the names of the cities with population in between 500,000 and 1 million?
1. What's the name of all the countries on the continent ‘Europe’?
1. What are the names of all the cities in the Netherlands?
1. What is the population of Rotterdam?
1. Which countries don't have a head of state? Hint: looks for `NULL` and `''` values
1. What's the top 10 least populated cities? Return the name and population
1. What countries in Africa have the local name the same as their common name?
1. What countries have Spanish as official language? Hint: see `countrylanguage` table
1. What countries have *official* languages spoken between 1% and 10% of the population?
1. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
1. In which countries is 'Creole English' used? Order by descending percentage of speakers 
1. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
1. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language
    - Hint: you need both the `country` and `countrylanguage` tables
    - Hint: you can do calculations between columns, for example (`SELECT a - b from table;`)

### Bonus

For these exercises, you need to learn about Aggregations in SQL. Try solving them by using this [cheat sheet](https://www.codecademy.com/learn/intro-sql-back-end-development/modules/webdev-sql-aggregates/cheatsheet) or ask your Coach for help!

1. What is the total population of the world?
1. What is the average population of countries in Europe?
1. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"

## Queries in the `Sakila` database

For the exercises we'll be using another example database (`Sakila`), so we must set it up.

### Setting up the `Sakila` database

1. If you haven't already, clone this repository and enter its directory: 

```shell
$ git clone git@github.com:HackYourFutureBelgium/sql-database.git
$ cd sql-database
```

2. Download, unzip, and import the `Sakila` database:

```shell
$ wget https://downloads.mysql.com/docs/sakila-db.zip -P week1/databases
$ unzip week1/databases/sakila-db.zip -d week1/databases
$ mysql -u "root" -p < "week1/databases/sakila-db/sakila-schema.sql" # enter your password when asked
$ mysql -u "root" -p < "week1/databases/sakila-db/sakila-data.sql" # enter your password when asked
```

3. Confirm the `sakila` database is imported correctly

```shell
$ mysql -u "root" -p # enter your password when asked

mysql> USE sakila;
mysql> SHOW TABLES;
```

You should see an output similar to the following:

```
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
(...)
+----------------------------+
23 rows in set (0.00 sec)
```

> [!TIP]
> You can also import the Sakila database to DBeaver like explained in [the setup instructions](../setup/README.md).

### Questions

The Sakila database is designed to represent a DVD rental store. With that in mind, answer the questions below

> [!IMPORTANT]
> See [this page](https://dev.mysql.com/doc/sakila/en/sakila-structure.html) for details on the structure of the database.

1. SELECT statements  
   1.1. Select all data from all Actors.  
   1.2. Select only the last names of all Actors.  
   1.3. Select the following details for all Films:  

       | COLUMN NAME       | Note                           |
       |-------------------|--------------------------------|
       | title             | Exists in film table.          |
       | description       | Exists in film table.          |
       | release_year      | Exists in film table.          |
       | total_rental_cost | rental_duration * rental_rate  |

2. DISTINCT operator  
   2.1. Find all unique last names of Actors.  
   2.2. Find all unique postal codes of Addresses.  
   2.3. Find all unique film Ratings.  

3. WHERE clause  
   3.1. Find the title, description, rating, and length of Films that are 3 hours or longer.  
   3.2. Find the ID, amount, and date of Payments made on or after 05/27/2005.  
   3.3. Find the ID, amount, and date of Payments made on 05/27/2005.  
   3.4. Find all Customer details where the last name begins with "S" and the first name ends with "N".  
   3.5. Find all Customer details where the customer is inactive or has a last name ending with "M".  
   3.6. Find all Categories where the ID is greater than 4 and the name starts with "C", "S", or "T".  
   3.7. Find all Staff details (excluding passwords) where a password is set.  
   3.8. Find all Staff details (excluding passwords) where no password is set.  

4. IN operator  
   4.1. Find the phone numbers and districts for Addresses located in California, England, Taipei, or West Java.  
   4.2. Find the ID, amount, and date of Payments made on 05/25/2005, 05/27/2005, or 05/29/2005 (using `IN` instead of `AND`).  
   4.3. Find all details for Films rated G, PG-13, or NC-17.  

5. BETWEEN operator  
   5.1. Find all Payments made between midnight 05/25/2005 and one second before midnight 05/26/2005.  
   5.2. Find the following details for Films where the description length is between 100 and 120 characters:  

6. LIKE operator  
   6.1. Find the title, description, and release year of Films where the description starts with "A Thoughtful".  
   6.2. Find the title, description, and rental duration of Films where the description ends with "Boat".  
   6.3. Find the title, length, description, and rental rate of Films where the description contains "Database" and the length is greater than 3 hours.  

7. LIMIT operator  
   7.1. Find the first 20 Payments.  
   7.2. Find the ID, date, and amount of Payments where the amount is greater than 5, showing only records ranked 51–100.  
   7.3. Find Customers ranked 101–200.  

8. ORDER BY statement  
   8.1. Find all Films ordered by length (ascending).  
   8.2. Find all unique film Ratings ordered by rating (descending).  
   8.3. Find the date and amount of the 20 highest Payments (ordered by amount descending).  
   8.4. Find the title, description, special features, length, and rental duration of the first 10 Films with "Behind the Scenes" footage, under 2 hours long, and with a rental duration between 5 and 7 days, ordered by length (descending).  

9. JOINS (compare the results of the next three)  
   9.1. Find each Customer’s first and last name alongside matching Actors’ first and last names using a LEFT JOIN on last name.  
        Label columns as `customer_first_name`, `customer_last_name`, `actor_first_name`, `actor_last_name`.  
   9.2. Same as 9.1 but using a RIGHT JOIN.  
   9.3. Same as 9.1 but using an INNER JOIN.  
   9.4. Find each City’s name and its Country using a LEFT JOIN from City to Country.  
   9.5. Find the title, description, release year, and language of each Film using a LEFT JOIN from Film to Language (label the language as `language`).  
   9.6. Find each Staff member’s name, address, address2, city name, district, and postal code using LEFT JOINs from Staff to Address to City.


## Submitting your work

Once you're sure you have the right queries, add them to the 2 files in `week1/databases`:
- World: `week1-exercises-world.sql` 
- Sakila: `week-1-exercises-sakila.sql`

Please share that file with your Coach: 
- [Brussels Class](https://github.com/HackYourFutureBelgium/sql-database/issues/37)

## References

- [MySQL - Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/sakila-preface.html)
- [Sakila DB Exercises](https://gist.github.com/tomsihap/cd9cbd35a3681c260a95653ca8d4e6bb) (original source unknown)
