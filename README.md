# dbops-project

## Создание пользователя и выдача прав

```sql
CREATE USER autotests_user WITH PASSWORD 'autotests_password';

GRANT CONNECT ON DATABASE store TO autotests_user;

GRANT ALL ON SCHEMA public TO autotests_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotests_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO autotests_user;
```

## Количество проданных сосисок за каждый день предыдущей недели

```sql
SELECT o.date_created,
       SUM(op.quantity) AS total_sausages_sold
FROM orders AS o
JOIN order_product AS op
    ON o.id = op.order_id
WHERE o.status = 'shipped'
  AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created
ORDER BY o.date_created;
```

## Сравнение выполнения запроса до и после создания индексов

### До создания индекса

```sql
EXPLAIN ANALYZE
SELECT *
FROM orders_date
WHERE date_created = '2023-01-15';
```

Execution Time: 23552 ms

### ПОсле создания индекса

```sql
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE date_created = '2023-01-15';
```

Execution Time: 1.224 ms

время выполнения уменьшилось