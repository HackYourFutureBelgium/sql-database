-- 1. What are the names of countries with population greater than 8 million?
SELECT Name 
FROM country
WHERE Population > 8000000;

-- 2. What are the names of countries that have “land” in their names?
SELECT name 
FROM country 
WHERE name LIKE '%land%';

-- 3. What are the names of the cities with population in between 500,000 and 1 million?
SELECT name 
FROM city 
WHERE population >= 500000 and population <= 1000000;

-- 4. What's the name of all the countries on the continent ‘Europe’?
SELECT name 
FROM country 
WHERE continent = 'Europe';

-- 5. What are the names of all the cities in the Netherlands?
SELECT name 
FROM city 
WHERE countryCode = 'NLD';

-- 6. What is the population of Rotterdam?
SELECT population 
FROM city 
WHERE name = 'Rotterdam';

-- 7. Which countries don't have a head of state? Hint: looks for NULL and '' values
SELECT name 
FROM country 
WHERE HeadOfState is null or HeadOfState = '';

-- 8. What's the top 10 least populated cities? Return the name and population
SELECT name, population 
FROM city 
ORDER BY population asc 
limit 10;

-- 9. What countries in Africa have the local name the same as their common name?
SELECT name 
FROM country 
WHERE LocalName = name;

-- 10. What countries have Spanish as official language? Hint: see countrylanguage table
SELECT country.name 
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.`Language` = 'Spanish' AND countrylanguage.IsOfficial = true;

-- 11. What countries have official languages spoken between 1% and 10% of the population?
SELECT country.name 
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.IsOfficial = true and countrylanguage.Percentage > 1 and countrylanguage.Percentage < 10;

-- 12. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
SELECT DISTINCT language 
FROM countrylanguage 
WHERE Percentage > 90;

-- 13. In which countries is 'Creole English' used? Order by descending percentage of speakers
SELECT country.name 
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.`Language` = 'Creole English' 
ORDER BY countrylanguage.Percentage DESC;

-- 14. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
SELECT name 
FROM country 
WHERE GovernmentForm LIKE '%Republic%' 
ORDER BY IndepYear ASC LIMIT 5;

-- 15. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language - Hint: you need both the country and countrylanguage tables - Hint: you can do calculations between columns, for example (SELECT a - b from table;)
SELECT country.name, countrylanguage.`Language`, countrylanguage.Percentage * country.Population as 'Number of Speakers'
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode;


-- BONUS
-- 1. What is the total population of the world?
SELECT SUM(population) as `World's Total Population` 
FROM country;

-- 2. What is the average population of countries in Europe?
SELECT AVG(population) as `Europe's Average Population` 
FROM country 
WHERE Continent = 'Europe';

-- 3. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"
SELECT countryCode, COUNT(language) as 'Number of Languages' 
FROM countrylanguage 
WHERE IsOfficial = true and CountryCode = 'BEL';