-- добавляем поле price в таблицу product
ALTER TABLE product ADD COLUMN price DOUBLE PRECISION;


-- копируем цены из product_info
UPDATE product p
SET price = pi.price
FROM product_info pi
WHERE p.id = pi.product_id;


-- добавляем поле date_created в таблицу orders
ALTER TABLE orders ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;


-- из orders_date копируем даты минимальные для каждого заказа
UPDATE orders o
SET date_created = (
    SELECT MIN(date_created)
    FROM orders_date od
    WHERE od.order_id = o.id
);


-- -- удаляем ненужные таблицы-дублт
-- DROP TABLE product_info;
-- DROP TABLE orders_date;
