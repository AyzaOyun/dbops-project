ALTER TABLE product
ADD COLUMN price DOUBLE PRECISION;


ALTER TABLE orders
ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;


DROP TABLE product_info;


DROP TABLE orders_date;


ALTER TABLE product
ADD PRIMARY KEY (id);


ALTER TABLE orders
ADD PRIMARY KEY (id);


ALTER TABLE order_product
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(id);


ALTER TABLE order_product
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES product(id);