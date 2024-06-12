--1. What are the names of countries with population greater than 8 million?
SELECT name , Population 
from city 
where Population > 8000000

--2. What are the names of countries that have “land” in their names?
SELECT Name 
from city 
WHERE name like '%land%'

--3. What are the names of the cities with population in between 500,000 and 1 million?
SELECT name, Population 
from city 
where Population > 500000 and Population < 1000000

--4. What's the name of all the countries on the continent ‘Europe’?
SELECT name
from country 
where Continent = 'Europe';

--5. What are the names of all the cities in the Netherlands?
SELECT name
from city 
WHERE CountryCode  = 'NLD';

--6. What is the population of Rotterdam?
SELECT  Population 
from city 
WHERE name = 'Rotterdam';

--7. Which countries don't have a head of state? Hint: looks for NULL and '' values
SELECT name, HeadOfState 
FROM country 
WHERE HeadOfState = NULL or HeadOfState = '';

--8. What's the top 10 least populated cities? Return the name and population
SELECT name, population
from city
ORDER BY Population ASC LIMIT 10;

--9. What countries in Africa have the local name the same as their common name?
SELECT LocalName, name
from country 
WHERE Continent = 'Africa' and LocalName = name;

--10. What countries have Spanish as official language? Hint: see countrylanguage table
SELECT DISTINCT  c.Name
from countrylanguage cl inner join country c  
WHERE LANGUAGE  = 'Spanish'


--11. What countries have official languages spoken between 1% and 10% of the population?
SELECT DISTINCT  c.Name 
FROM countrylanguage cl inner join country c 
WHERE IsOfficial  = 'T' and Percentage  > 1 and Percentage < 10

--12. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
SELECT DISTINCT `Language` FROM countrylanguage WHERE Percentage  > 90

--13. In which countries is 'Creole English' used? Order by descending percentage of speakers
SELECT c.Name, cl.Percentage  FROM  countrylanguage cl inner join country c 
on cl.CountryCode = c.Code 
WHERE 
cl.LANGUAGE = 'Creole English' ORDER by cl.Percentage DESC 


--14. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
SELECT Name  
FROM country 
WHERE  GovernmentForm = 'Republic' 
order by IndepYear  ASC limit 5

--15. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language - Hint: you need both the country and countrylanguage tables - Hint: you can do calculations between columns, for example (SELECT a - b from table;)
SELECT 
    c.Name AS Country, 
    cl.Language, 
    ROUND((c.Population * cl.Percentage) / 100) AS NumberOfSpeakers
FROM 
    country c
JOIN 
    countrylanguage cl ON c.Code = cl.CountryCode;


-- BONUS
-- 1. What is the total population of the world?
SELECT SUM(Population) AS TotalWorldPopulation
FROM country;


-- 2. What is the average population of countries in Europe?
SELECT AVG(Population) AS AverageEuropeanPopulation
FROM country
WHERE Continent = 'Europe';


-- 3. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"
SELECT 
    CountryCode, 
    COUNT(*) AS NumberOfLanguages
FROM 
    countrylanguage
WHERE 
    CountryCode = 'BEL' AND 
    IsOfficial = 'T'
GROUP BY 
    CountryCode;