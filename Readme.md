# dbops-project

CREATE USER autotests_user WITH PASSWORD 'autotests_password';

GRANT CONNECT ON DATABASE store TO autotests_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotests_user;


GRANT ALL ON SCHEMA public TO autotests_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO autotests_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO autotests_user;