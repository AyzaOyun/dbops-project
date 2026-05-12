-- вставляем продукты с ценами
INSERT INTO product (id, name, picture_url, price)
SELECT p.id, p.name, p.picture_url, pi.price
FROM product p JOIN product_info pi ON p.id = pi.product_id;


-- вставляем заказы с датами
INSERT INTO orders (id, status, date_created)
SELECT o.id, o.status, od.date_created
FROM orders o JOIN orders_date od ON o.id = od.order_id;


-- удаляем ненужные таблицы-дубли
DROP TABLE product_info;
DROP TABLE orders_date;