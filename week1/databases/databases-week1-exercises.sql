
-- 1. What are the names of countries with population greater than 8 million?
SELECT Name 
FROM country
WHERE Population > 8000000;

-- 2. What are the names of countries that have “land” in their names?
SELECT name
FROM country 
WHERE name like '%land%';

-- 3. What are the names of the cities with population in between 500,000 and 1 million?
SELECT name, Population 
FROM city 
Where Population > 500000 and Population < 1000000;

-- 4. What's the name of all the countries on the continent ‘Europe’?
SELECT name 
FROM country 
WHERE Continent = 'Europe';

-- 5. What are the names of all the cities in the Netherlands?
SELECT city.name 
FROM city
JOIN country on city.CountryCode = country.Code  
WHERE country.name = 'Netherlands';

-- 6. What is the population of Rotterdam?
SELECT name, population 
FROM city 
WHERE name = 'Rotterdam';

-- 7. Which countries don't have a head of state? Hint: looks for NULL and '' values
SELECT name 
FROM country 
WHERE HeadOfState is NULL;

-- 8. What's the top 10 least populated cities? Return the name and population
SELECT name, Population
FROM city 
ORDER BY Population desc 
LIMIT 10;

-- 9. What countries in Africa have the local name the same as their common name?
SELECT name 
FROM country 
WHERE Continent = 'africa' and name = LocalName;

-- 10. What countries have Spanish as official language? Hint: see countrylanguage table
SELECT name 
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode
WHERE language = 'Spanish'; 

-- 11. What countries have official languages spoken between 1% and 10% of the population?
SELECT country.Name , countrylanguage.`Language`, countrylanguage.IsOfficial, countrylanguage.Percentage 
FROM country 
JOIN countrylanguage on country.Code = countrylanguage.CountryCode
WHERE IsOfficial=true and Percentage >1 and Percentage <10;

-- 12. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
SELECT countrylanguage.`Language`
FROM country
JOIN countrylanguage on country.Code = countrylanguage.CountryCode
WHERE IsOfficial=true and Percentage > 90;

-- 13. In which countries is 'Creole English' used? Order by descending percentage of speakers
SELECT country.name, countrylanguage.`Language`, countrylanguage.Percentage 
FROM country
JOIN countrylanguage on country.Code = countrylanguage.CountryCode
WHERE language = 'Creole English' order by Percentage desc;

-- 14. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
SELECT name, IndepYear 
FROM country
WHERE GovernmentForm = 'Federal republic' order by IndepYear asc limit 5;

-- 15. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language - Hint: you need both the country and countrylanguage tables - Hint: you can do calculations between columns, for example (SELECT a - b from table;)
SELECT country.name, country.population, countrylanguage.`Language`
FROM country
JOIN countrylanguage on country.Code = countrylanguage.CountryCode;


-- BONUS
-- 1. What is the total population of the world?
SELECT sum(Population) as WorldPopulation 
FROM country;


-- 2. What is the average population of countries in Europe?
SELECT AVG(Population) as AveragePopulation 
FROM country where Continent = 'europe';

-- 3. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"
SELECT countrycode, count(Language) as 'Number of Languages'
FROM countrylanguage 
WHERE countrycode ='BEL' and IsOfficial = true;


-- MORE
-- 1. Retrieve the names of all the cities along with their respective country names, make sure the column names are easy to understand.
SELECT  city.name as 'city', country.name as 'country'
FROM city
JOIN country on country.Code = city.CountryCode;

-- 2. Find the average life expectancy of countries in the continent 'Europe'.
SELECT avg(LifeExpectancy) as 'Average Life expectancy in Europe'
FROM country
WHERE Continent = 'europe';

-- 3. Get the names and populations of cities in the district 'California'.
SELECT name as city, population
FROM city
WHERE District = 'california';

-- 4. Retrieve the capital city of each country along with the country name.
SELECT city.name, country.name
from city
join country on city.countrycode = country.code
where city.name = 'capital city';

-- 5. Find the largest city by population in each country.
SELECT country.name, city.name, city.population 
FROM city
JOIN country ON city.CountryCode = country.Code 
JOIN
    (SELECT countryCode, MAX(population) AS largestCityByPopulation 
    FROM city 
    GROUP BY countryCode) MaxPopulation 
    ON city.countryCode = MaxPopulation.countryCode 
    AND city.population = MaxPopulation.largestCityByPopulation;

-- 6. List the names of all cities with a population of over 1 million in the continent of 'Asia'.
SELECT  city.name, city.population 
FROM city
JOIN country ON city.CountryCode = country.Code 
WHERE city.Population > 1000000 and continent = 'asia';

-- 7. Get the names and continents of countries that do not have an official language recorded in the database.
// not sure about this query

SELECT country.name, country.Continent 
FROM country 
join countrylanguage on country.Code = countrylanguage.CountryCode
where countrylanguage.IsOfficial = false ; 

-- 8. List the countries in the 'Oceania' continent with an average life expectancy over 70.
SELECT name 
from country
where Continent = 'Oceania' and LifeExpectancy >70;

-- 9. Find the total number of languages spoken in the continent 'Africa'.
SELECT count(countrylanguage.`Language`) as 'total language in africa' 
from countrylanguage 
join country on country.Code = countrylanguage.CountryCode
where Continent = 'Africa'; 

-- 10. Retrieve the names and populations of cities located in countries with a surface area greater than 1 million square kilometers.
SELECT city.name, city.population
from city 
join country on city.CountryCode = country.Code 
where country.SurfaceArea > 1000000;

-- 11. Retrieve the names and populations of capital cities with populations over 500,000.
SELECT name, population 
FROM city
WHERE name = 'capital city' and population > 500000;

-- 12. List the names and continents of countries where English is an official language.
SELECT country.name, country.continent, countrylanguage.`Language`, countrylanguage.IsOfficial 
FROM country
join countrylanguage on country.Code = countrylanguage.countryCode
where countrylanguage.`Language` = 'english' and countrylanguage.IsOfficial = true;

-- 13. Find the name of the country with the highest life expectancy.
SELECT name, LifeExpectancy
FROM country
WHERE lifeexpectancy = (SELECT MAX(lifeexpectancy) FROM country);

-- 14. Get the names of countries in the 'South America' continent with cities having a population over 1 million.
SELECT name, Population 
FROM country
WHERE Continent = 'South America' and Population > 1000000;

-- 15. Find the name and population of the smallest city (by population) in the country 'India'.
SELECT city.name, city.Population, country.name 
FROM city
JOIN country on city.CountryCode  = country.Code 
WHERE country.name = 'India' AND city.population = (
        SELECT MIN(city.population)
        FROM city
        JOIN country  ON city.countrycode = country.code
        WHERE country.name = 'India');

-- 16. Retrieve the country name and its corresponding capital city's name where the capital's population is more than 1 million.
SELECT country.name, city.name, city.population
From country
join city on country.code = city.countrycode
where city.name = 'capital city' and city.population>1000000;

-- 17. List the names of countries that have no cities in the database.
SELECT country.name, city.name
from country
join city on country.code = city.countryCode
where city.name = is null;

-- 18. Get the name and population of the largest city in the continent 'South America'.
SELECT city.name, city.Population, country.Continent 
FROM city
join country on city.CountryCode  = country.Code
where country.continent = 'south America' and city.Population = (
	select max(city.Population) 
	from city
	join country on city.CountryCode =country.Code 
	where continent = 'south america');

-- 19. List the names and populations of all cities in countries where the official language is 'Spanish'.
SELECT city.name, city.Population, countrylanguage.`Language`, countrylanguage.IsOfficial 
FROM city
join countrylanguage on city.CountryCode  = countrylanguage.CountryCode
where countrylanguage.`Language` = 'spanish' and countrylanguage.IsOfficial  = true;

-- 20. Get the name of the country and the population of the city with the highest population in that country.
SELECT country.name, city.name as 'city name', city.population
FROM country
JOIN city on country.Code  = city.CountryCode 
 	WHERE city.population = (select max(city.Population)
 	FROM city
 	WHERE country.Code = city.CountryCode); 
