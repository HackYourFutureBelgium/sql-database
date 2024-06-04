# Exercises Week 1

## Overview 

1. Select queries in the `world` database
1. Create your own database

> [!IMPORTANT]
> This assumes you have imported the `world` databse as described [here](./README.md).

## Queries in the `world` database

Now that you know the fundamentals of SQL, it's time to practice retrieving data.

We'll be using the `world` database introduced in this week's [Readings](README.md).

First, connect to the `world` database:

```shell
# connect to the database
$ mysql -u "root" -p # enter your password when asked

mysql> USE world;
mysql> SHOW TABLES;

# +-----------------+
# | Tables_in_world |
# +-----------------+
# | city            |
# | country         |
# | countrylanguage |
# +-----------------+
# 3 rows in set (0.00 sec)
```

Now, write an SQL query to answer each of the following questions about the world. You may need to use the `city`, `country`, or `countrylanguage` tables.

Once you're sure you have the right query, add them to a file `databases-week1-exercises.sql` (TODO: add file when exercises are complete).

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

### Bonus

For these questions, you need to learn other SQL topics. Take a look at the Cheat Sheet or ask your Coach for help!

1. What is the total population of the world?
1. What is the average population of countries in Europe?
1. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"

