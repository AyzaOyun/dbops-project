# dbops-project

CREATE USER autotests_user WITH PASSWORD 'autotests_password';

GRANT CONNECT ON DATABASE store TO autotests_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotests_user;