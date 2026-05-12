# dbops-project

-- для выдачи прав пользователю миграций и автотестов--
-- создание пользователя для автотестов
CREATE USER autotests_user WITH PASSWORD 'autotests_password';

-- права на подключение к базе store
GRANT CONNECT ON DATABASE store TO autotests_user;

-- права на схему public
GRANT ALL ON SCHEMA public TO autotests_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotests_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO autotests_user;

-- количество сосисок было продано за предыдущую неделю
SELECT COALESCE(SUM(op.quantity), 0) AS sausages_sold_last_week
FROM order_product op
JOIN orders o ON op.order_id = o.id
WHERE o.date_created >= CURRENT_DATE - INTERVAL '7 days';

-- сравнение выполнения запроса до и после создания индексов
--время выполнения уменьшилось
--До индексов (store_default, таблица orders_date):
psql "host=localhost port=5432 dbname=store_default user=user password=password" -c "EXPLAIN ANALYZE SELECT * FROM orders_date WHERE date_created = '2023-01-15';"
                                                            QUERY PLAN                                                            
----------------------------------------------------------------------------------------------------------------------------------
 Gather  (cost=1000.00..116779.03 rows=1 width=20) (actual time=23507.896..23514.502 rows=0 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on orders_date  (cost=0.00..115778.93 rows=1 width=20) (actual time=23464.862..23464.863 rows=0 loops=3)
         Filter: (date_created = '2023-01-15'::date)
         Rows Removed by Filter: 3333333
 Planning Time: 0.287 ms
 JIT:
   Functions: 6
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 0.852 ms, Inlining 0.000 ms, Optimization 0.890 ms, Emission 14.618 ms, Total 16.360 ms
 Execution Time: 23552.280 ms
(12 rows)
 