# SQL syntax

## SELECT

```sql
SELECT column1, column2....columnN
FROM table_name;
```

## DISTINCT

```sql
SELECT DISTINCT column1
FROM table_name;
```

## WHERE

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION;
```

## AND/OR

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION-1 {AND|OR} CONDITION-2;

```

## IN

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE column_name
IN (val-1, val-2,...val-N);
```

## BETWEEN

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE column_name
BETWEEN val-1 AND val-2;
```

## LIKE

```sql
-- PATTERN is a string if % means multiple characters, _ means one character
SELECT column1, column2....columnN
FROM table_name
WHERE column_name LIKE { PATTERN };
```

## ORDER BY

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION
ORDER BY column_name {ASC|DESC};
```

## GROUP BY

```sql
SELECT SUM(column_name)
FROM table_name
WHERE CONDITION
GROUP BY column_name;
```
