-- create
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    country TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    total_amount REAL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

INSERT INTO customers VALUES
(1,'Arun','India'),
(2,'Meena','India'),
(3,'John','USA');

INSERT INTO orders VALUES
(101,1,'2026-01-01',5000),
(102,2,'2026-01-03',3000),
(103,1,'2026-01-05',7000);

INSERT INTO products VALUES
(201,'Laptop','Electronics',50000),
(202,'Mouse','Electronics',500),
(203,'Shoes','Fashion',2000);

INSERT INTO order_items VALUES
(1,101,201,1),
(2,102,202,2),
(3,103,203,1);



SELECT * FROM orders
WHERE total_amount > 4000;


SELECT * FROM products
ORDER BY price DESC;

SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

SELECT c.name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount > 5000
);

#AGGREGATE (SUM, AVG)
SELECT SUM(total_amount) AS total_sales
FROM orders;

SELECT AVG(total_amount) AS avg_sales
FROM orders;


CREATE VIEW customer_sales AS
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT * FROM customer_sales;

CREATE INDEX idx_customer_id
ON orders(customer_id);

SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;
