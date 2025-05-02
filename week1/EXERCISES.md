# Exercises Week 1

> [!IMPORTANT]
> This assumes you have imported the `world` database as described [here](../setup/README.md).

## Queries in the `world` database

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

>[!TIP] 
> More questions will be added

### Submitting your work

Once you're sure you have the right queries, add them to a file `databases-week1-exercises.sql` - you can use [this one](./databases/databases-week1-exercises.sql) as an example.

Please share that file with your Coach: 
- [Brussels Class](https://github.com/HackYourFutureBelgium/sql-database/issues/37)
