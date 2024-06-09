-- 1. What are the names of countries with population greater than 8 million?
SELECT Name 
FROM country
WHERE Population > 8000000;

-- 2. What are the names of countries that have “land” in their names?
SELECT ...

-- 3. What are the names of the cities with population in between 500,000 and 1 million?
SELECT ...

-- 4. What's the name of all the countries on the continent ‘Europe’?
SELECT ...

-- 5. What are the names of all the cities in the Netherlands?
SELECT ...

-- 6. What is the population of Rotterdam?
SELECT ...

-- 7. Which countries don't have a head of state? Hint: looks for NULL and '' values
SELECT ...

-- 8. What's the top 10 least populated cities? Return the name and population
SELECT ...

-- 9. What countries in Africa have the local name the same as their common name?
SELECT ...

-- 10. What countries have Spanish as official language? Hint: see countrylanguage table
SELECT ...

-- 11. What countries have official languages spoken between 1% and 10% of the population?
SELECT ...

-- 12. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
SELECT ...

-- 13. In which countries is 'Creole English' used? Order by descending percentage of speakers
SELECT ...

-- 14. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
SELECT ...

-- 15. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language - Hint: you need both the country and countrylanguage tables - Hint: you can do calculations between columns, for example (SELECT a - b from table;)
SELECT ...


-- BONUS
-- 1. What is the total population of the world?
SELECT ...

-- 2. What is the average population of countries in Europe?
SELECT ...

-- 3. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"
SELECT ...