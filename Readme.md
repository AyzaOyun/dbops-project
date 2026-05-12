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
-- время выполнения уменьшилось