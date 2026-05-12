CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    picture_url VARCHAR(255)
);

CREATE TABLE product_info (
    product_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    status VARCHAR(50)
);

CREATE TABLE orders_date (
    order_id INT NOT NULL,
    status VARCHAR(50),
    date_created DATE DEFAULT CURRENT_DATE
);

CREATE TABLE order_product (
    quantity INT NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL
);