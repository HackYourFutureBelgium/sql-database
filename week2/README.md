> [!WARNING]
> This section is under development

# Week 2

TODO inspirational quote


## Topics

- [Constraints](#what-is-a-database-1)
- TODO
- TODO

## Constraints

### Primary Keys 

Let’s return to our example `world` database introduced in [Week 1](../week1/README.md). Recall that we had three tables: `country`, `city`, and `countrylanguage`.

Each of these tables has a column (or set of columns) that uniquely identify each row of that table:
    - `code` from `country`
    - `id` from `city`
    - `country_code` and `language` from `countrylanguage`

These special columns are called **primary keys**.

Primary keys have a few requirements:
    - None of the values can be `NULL`.
    - Each value must be unique (that is, you can’t have two countries with the same `code` in the `country` table).
    - A table can not have more than one primary key.

Sometimes, having a single column uniquely identify a row is not enough. In this case, multiple columns can be used together to form a **composite primary key**. That's the scenario we see in the `countrylanguage` table:
    - There can be multiple languages per country (so `country_code` could not be a primary key)
    - The same language can be used in multiple countries (so `language` could not be a primary key)
    - Per each country, we only expect one entry per language. A composite key of `country_code` and `language` is useful

### Foreign Keys

Let’s reexamine the `city` table:

```sql
-- +----+----------------+-------------+---------------+------------+
-- | ID | Name           | CountryCode | District      | Population |
-- +----+----------------+-------------+---------------+------------+
-- |  1 | Kabul          | AFG         | Kabol         |    1780000 |
-- |  2 | Qandahar       | AFG         | Qandahar      |     237500 |
-- |  3 | Herat          | AFG         | Herat         |     186800 |
-- |  4 | Mazar-e-Sharif | AFG         | Balkh         |     127800 |
-- |  5 | Amsterdam      | NLD         | Noord-Holland |     731200 |
-- |  6 | Rotterdam      | NLD         | Zuid-Holland  |     593321 |
-- |  7 | Haag           | NLD         | Zuid-Holland  |     440900 |
-- |  8 | Utrecht        | NLD         | Utrecht       |     234323 |
-- |  9 | Eindhoven      | NLD         | Noord-Brabant |     201843 |
-- | 10 | Tilburg        | NLD         | Noord-Brabant |     193238 |
-- (...)
```

As mentioned earlier in [Week 1 - Combining Tables](../week1/README.md#combining-tables), the values of `city.countrycode` match the values of `country.code` (the primary key for `country`).

When the primary key for one table appears in a different table, it is called a **foreign key**.

So `code` is a primary key when it appears in `country`, but a foreign key when it appears in `city`. The most common types of joins will be joining a foreign key from one table with the primary key from another table.

>[!IMPORTANT]
> When a column is set as a foreign key, its value *must* exist in the original table as foreign key. For example, inserting a row with `countrycode = 'XXX'` into the `city` table is not possible because there's no country with code 'XXX' in the `country` table.

> [!NOTE]
> In the `city` table, the values for column `name` are also unique, so it could also be used as a primary key. However, generally, the primary key will just be called `id`.

### `UNIQUE`, `NOT NULL`, and `DEFAULT`

Primary key and foreign keys are the so called table level constraints. There are other constraints that apply only to the values of individual columns. 

Here are some of the column constraints that can be set:

- `UNIQUE` columns have a different value for every row. This is similar to primary key except a table can have many different `UNIQUE` columns.
    - For example, the `country.name` can be `UNIQUE` (there shouldn't be 2 countries with the same name), even though `code` is the primary key
- `NOT NULL` columns must have a value. Attempts to insert a row without a value for a `NOT NULL` column will result in a constraint violation and the new row will not be inserted.
    - For example, we may say that `population` of a country is important information and we'd like to prevent having rows that don't set it
- `DEFAULT` columns are configured to have a given value automatically set if the new row does not specify a value for that column.
    - For example, we could set `isOfficial` to *true* ('T') whenever a new row is added to `countrylanguage`, if a value is not specified

> [!NOTE]
> We'll talk more about how to set these constraints later in the module. For now, the goal is to know they exist and to understand them.
