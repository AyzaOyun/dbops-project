CREATE INDEX idx_product_price ON product(price);
CREATE INDEX idx_orders_date ON orders(date_created);
CREATE INDEX idx_orders_status ON orders(status);