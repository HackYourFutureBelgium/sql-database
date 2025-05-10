------- SAKILA DATABASE EXERCISES -----

-- 1. SELECT statements

-- 1.1. Select all data from all Actors.
SELECT * ....

-- 1.2. Select only the last names of all Actors.

-- 1.3. Select the following details for all Films:
--      title, description, release_year, total_rental_cost (rental_duration * rental_rate)


-- 2. DISTINCT operator

-- 2.1. Find all unique last names of Actors.

-- 2.2. Find all unique postal codes of Addresses.

-- 2.3. Find all unique film Ratings.


-- 3. WHERE clause

-- 3.1. Find the title, description, rating, and length of Films that are 3 hours or longer.

-- 3.2. Find the ID, amount, and date of Payments made on or after 05/27/2005.

-- 3.3. Find the ID, amount, and date of Payments made on 05/27/2005.

-- 3.4. Find all Customer details where the last name begins with "S" and the first name ends with "N".

-- 3.5. Find all Customer details where the customer is inactive or has a last name ending with "M".

-- 3.6. Find all Categories where the ID is greater than 4 and the name starts with "C", "S", or "T".

-- 3.7. Find all Staff details (excluding passwords) where a password is set.

-- 3.8. Find all Staff details (excluding passwords) where no password is set.


-- 4. IN operator

-- 4.1. Find the phone numbers and districts for Addresses located in California, England, Taipei, or West Java.

-- 4.2. Find the ID, amount, and date of Payments made on 05/25/2005, 05/27/2005, or 05/29/2005 (using IN instead of AND).

-- 4.3. Find all details for Films rated G, PG-13, or NC-17.


-- 5. BETWEEN operator

-- 5.1. Find all Payments made between midnight 05/25/2005 and one second before midnight 05/26/2005.

-- 5.2. Find the following details for Films where the description length is between 100 and 120 characters:
--      title, description, release_year, length


-- 6. LIKE operator

-- 6.1. Find the title, description, and release year of Films where the description starts with "A Thoughtful".

-- 6.2. Find the title, description, and rental duration of Films where the description ends with "Boat".

-- 6.3. Find the title, length, description, and rental rate of Films where the description contains "Database" and the length is greater than 3 hours.


-- 7. LIMIT operator

-- 7.1. Find the first 20 Payments.

-- 7.2. Find the ID, date, and amount of Payments where the amount is greater than 5, showing only records ranked 51–100.

-- 7.3. Find Customers ranked 101–200.


-- 8. ORDER BY statement

-- 8.1. Find all Films ordered by length (ascending).

-- 8.2. Find all unique film Ratings ordered by rating (descending).

-- 8.3. Find the date and amount of the 20 highest Payments (ordered by amount descending).

-- 8.4. Find the title, description, special features, length, and rental duration of the first 10 Films with "Behind the Scenes" footage, under 2 hours long, and with a rental duration between 5 and 7 days, ordered by length (descending).


-- 9. JOINS (compare the results of the next three)

-- 9.1. Find each Customer’s first and last name alongside matching Actors’ first and last names using a LEFT JOIN on last name.
--      Label columns as customer_first_name, customer_last_name, actor_first_name, actor_last_name.

-- 9.2. Same as 9.1 but using a RIGHT JOIN.

-- 9.3. Same as 9.1 but using an INNER JOIN.

-- 9.4. Find each City’s name and its Country using a LEFT JOIN from City to Country.

-- 9.5. Find the title, description, release year, and language of each Film using a LEFT JOIN from Film to Language (label the language as language).

-- 9.6. Find each Staff member’s name, address, address2, city name, district, and postal code using LEFT JOINs from Staff to Address to City.
