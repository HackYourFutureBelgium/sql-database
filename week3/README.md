> [!WARNING]
> This section is under development

# Week 3

TODO insert inspirational quote

## Topics

TODO

## Writing data

TODO

## Views

Thus far, we have learned about concepts that allow us to design complex databases and write data into them. Now, we will explore ways in which to obtain views from these databases.

Let’s go back to the `books` database. Here is a snapshot of tables from this database.

To find a book written by the author Haruki Murakami, we would need to go each of through the three table above — first finding the author’s ID, then the corresponding book IDs and then the book titles. Instead, is there a way to put together related information from the three tables in a single view?

Yes, we can use the `JOIN` command to combine rows from two or more tables based on a related column between them. Here is a SQL query to answer the question "What books were written by Haruki Murakami?":

```sql
select * from authors 
join authored ON authored.author_id = authors.id 
join books on authored.book_id = books.id
where authors.name = 'Haruki Murakami';

-- +----+-----------------+---------+---------------+-----------+---------+----+---------------+----------------+-------+--------------+--------------+
-- | id | name            | country | date_of_birth | author_id | book_id | id | isbn          | title          | pages | published_on | publisher_id |
-- +----+-----------------+---------+---------------+-----------+---------+----+---------------+----------------+-------+--------------+--------------+
-- |  2 | Haruki Murakami | Japan   | 1949-01-12    |         2 |       2 |  2 | 9784101001547 | Norwegian Wood |   296 | 1987-09-04   |            2 |
-- +----+-----------------+---------+---------------+-----------+---------+----+---------------+----------------+-------+--------------+--------------+
-- 1 row in set (0,00 sec)
```

This makes it simple to observe that Haruki Murakami authored "Norwegian Wood".

We can also adapt the query to remove the `id` columns, such that the results looks like the following:

```sql
select authors.name, books.title from authors  -- return only author name and book title
join authored ON authored.author_id = authors.id 
join books on authored.book_id = books.id
where authors.name = 'Haruki Murakami';

-- +-----------------+----------------+
-- | name            | title          |
-- +-----------------+----------------+
-- | Haruki Murakami | Norwegian Wood |
-- +-----------------+----------------+
-- 1 row in set (0,00 sec)
```

The above query is complex. Instead of always writing such query whenever we want to find which books were written by a given author, we can create a **view** - a virtual table - based on the query above using `CREATE VIEW`:

```sql
create view author_book_title as 
select authors.name, books.title from authors
join authored ON authored.author_id = authors.id 
join books on authored.book_id = books.id;
```

The view created here is called `author_book_title`. This view can now be used exactly as we would use a table in SQL. For example:

```sql
SELECT * FROM author_book_title;

--+------------------------+--------------------------------+
--| name                   | title                          |
--+------------------------+--------------------------------+
--| Gabriel Garcia Marquez | One Hundred Years of Solitude  |
--| Haruki Murakami        | Norwegian Wood                 |
--| George Orwell          | 1984                           |
--| J.K. Rowling           | Harry Potter                   |
--| J.R.R. Tolkien         | The Hobbit                     |
--| F. Scott Fitzgerald    | The Great Gatsby               |
--| Herman Melville        | Moby Dick                      |
-- (...)
-- 15 rows in set (0,01 sec)
```

Using this view, we can considerably simplify the query needed to find the books written by Haruki Murakami.

```sql
select * from author_book_title where name = 'Haruki Murakami';
-- +-----------------+----------------+
-- | name            | title          |
-- +-----------------+----------------+
-- | Haruki Murakami | Norwegian Wood |
-- +-----------------+----------------+
-- 1 row in set (0,00 sec)
```

> [IMPORTANT]
> A view is a virtual table defined by a query.
> - simplifying: putting together data from different tables to be queried more simply,
> - aggregating: running aggregate functions, like finding the sum, and storing the results,
> - partitioning: dividing data into logical pieces,
> - securing: hiding columns that should be kept secure. While there are other ways in which views can be useful, in this lecture we will focus on the above four.

A view, being a virtual table, does not consume much more disk space to create. The data within a view is still stored in the underlying tables, but still accessible through this simplified view.

> [!IMPORTANT]
> Views cannot be updated because views do not have any data in the way that tables do. Views actually pull data from the underlying tables each time they are queried. 
> This means that when an underlying table is updated, the next time the view is queried, it will display updated data from the table.

Views can be also used to enhance database security by limiting access to certain data.

Imagine we want to share `books` data with an analyst, whose job is to find the most popular authors. Let's assume it's would be irrelevant and indeed, not secure to give them the date of birth of individual authors - it's personal data.

Views can be handy in this situation — we can share with the analyst a view containing the author information, but not their date of birth or oder sensitive data.

We can even go one step further and return a `date_of_birth` column with a redacted value. This indicates to the analyst that we have `date_of_birth` data in the database, but it has been redacted for security.

```sql
CREATE VIEW authors_analysis as 
SELECT id, name, country, 'redacted' as date_of_birth from authors;
```

We can now query this view:

```sql
SELECT * FROM authors_analysis;

-- +----+------------------------+----------------+---------------+
-- | id | name                   | country        | date_of_birth |
-- +----+------------------------+----------------+---------------+
-- |  1 | Gabriel Garcia Marquez | Colombia       | redacted      |
-- |  2 | Haruki Murakami        | Japan          | redacted      |
-- |  3 | George Orwell          | United Kingdom | redacted      |
-- |  4 | J.K. Rowling           | United Kingdom | redacted      |
-- |  5 | J.R.R. Tolkien         | United Kingdom | redacted      |
-- (...)
-- 15 rows in set (0,00 sec)
```

> [!TIP]
> Views created with `CREATE VIEW` will be added to the database schema. 
> To create views that are *not* stored in the database scheme, we can use `CREATE TEMPORARY VIEW`. This creates a view that exists only for the duration of our connection to the database. 

TODO exercise

## Triggers

Triggers execute a specified function when certain operations are performed on the table (`INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`). 

For example, this can be useful to keep track of changes. Let's say we want to keep track of when an author changes their `date_of_birth`, to monitor if its just a mistake or potentially bad data. We'll keep this in a new table `authors_date_of_birth_audit`.

First, we create the `authors_date_of_birth_audit` table:

```sql
CREATE TABLE authors_date_of_birth_audit (
	id INT AUTO_INCREMENT,
	author_id INT,
	date_of_birth TEXT,
	updated_at DATE,
	PRIMARY KEY(id),
	FOREIGN KEY(author_id) REFERENCES authors(id)
);
```

Then, we create the trigger with `CREATE_TRIGGER`:

```sql
-- Upon INSERT operation on authors table, add date_of_birth to audit table
CREATE TRIGGER insert_authors_date_of_birth_audit
AFTER INSERT ON authors
FOR EACH ROW
BEGIN
  INSERT INTO authors_date_of_birth_audit (author_id, date_of_birth, updated_at)
  VALUES (NEW.id, NEW.date_of_birth, CURRENT_DATE);
END;
```

Then we try inserting a new author:

```sql
INSERT INTO authors (id, name, country, date_of_birth) VALUES (16, 'Manuel Paulo', 'Portugal', '1883-07-03');
```

We should see the `date_of_birth` value in both `authors` and `authors_date_of_birth_audit` tables:

```sql
SELECT * FROM authors WHERE NAME = 'Manuel Paulo';

-- +----+--------------+----------+---------------+
-- | id | name         | country  | date_of_birth |
-- +----+--------------+----------+---------------+
-- | 16 | Manuel Paulo | Portugal | 1883-07-03    |
-- +----+--------------+----------+---------------+

SELECT * FROM authors_date_of_birth_audit;

-- +----+-----------+---------------+------------+
-- | id | author_id | date_of_birth | updated_at |
-- +----+-----------+---------------+------------+
-- |  1 |        16 | 1883-07-03    | 2024-06-20 |
-- +----+-----------+---------------+------------+
```

What happens if we update an author's date of birth now? 

Actually, that isn't covered by by our trigger. Notice the trigger was created with the `AFTER INSERT ON authors` statement, meaning it is only executed if a new row is inserted in the `authors` table.

To keep track of updates to the name, we need to add a new trigger:

```sql
CREATE TRIGGER update_authors_date_of_birth_audit
AFTER UPDATE ON authors
FOR EACH ROW
BEGIN
  -- Check if the date_of_birth was actually changed
  IF OLD.date_of_birth != NEW.date_of_birth THEN
    INSERT INTO authors_date_of_birth_audit (author_id, date_of_birth, updated_at)
    VALUES (NEW.id, NEW.date_of_birth, CURRENT_DATE);
  END IF;
END;
```

Now if we update Manuel Paulo's date of birth:

```sql
UPDATE authors SET date_of_birth = '1954-01-01' WHERE id = 16;
```

We can see the updated `date_of_birth` in the `authors` table, and the full history of updates in the `update_authors_date_of_birth_audit` table:

```sql
SELECT * FROM authors WHERE NAME = 'Manuel Paulo';

-- +----+--------------+----------+---------------+
-- | id | name         | country  | date_of_birth |
-- +----+--------------+----------+---------------+
-- | 16 | Manuel Paulo | Portugal | 1954-01-01    | <-- updated
-- +----+--------------+----------+---------------+

SELECT * FROM authors_date_of_birth_audit;

-- +----+-----------+---------------+------------+
-- | id | author_id | date_of_birth | updated_at |
-- +----+-----------+---------------+------------+
-- |  1 |        16 | 1883-07-03    | 2024-06-20 | <-- initial date of birth 
-- |  2 |        16 | 1954-01-01    | 2024-06-20 | <-- latest date of birth
-- +----+-----------+---------------+------------+
```

> [!TIP]
> Triggers have many functionalities and use cases - this was just an example. For a more comprehensive overview of triggers in MySQL, check out their [documentation](https://dev.mysql.com/doc/refman/8.4/en/trigger-syntax.html).

TODO exercise

## Indexes

TODO

## Transactions

TODO

## Access Controls

TODO

## SQL Injection

TODO