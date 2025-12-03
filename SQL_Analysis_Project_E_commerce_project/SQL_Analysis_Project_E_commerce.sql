**SQL Analysis Project – E-commerce**

 1️⃣ Top 10 Customers by Revenue


-- ========================================
-- Tables for E-commerce Analysis
-- ========================================

-- Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

-- Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10,2)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price NUMERIC(10,2)
);



-- ========================================
-- Customers (30 rows)
-- ========================================
INSERT INTO customers (name, email, join_date) VALUES
('Alice Johnson', 'alice@example.com', '2023-01-10'),
('Bob Smith', 'bob@example.com', '2023-02-15'),
('Charlie Lee', 'charlie@example.com', '2023-03-05'),
('Diana Prince', 'diana@example.com', '2023-04-20'),
('Evan Brown', 'evan@example.com', '2023-05-18'),
('Fiona Green', 'fiona@example.com', '2023-06-12'),
('George White', 'george@example.com', '2023-07-08'),
('Hannah Black', 'hannah@example.com', '2023-08-25'),
('Ian Gray', 'ian@example.com', '2023-09-14'),
('Jane Blue', 'jane@example.com', '2023-10-01'),
('Kyle Red', 'kyle@example.com', '2023-11-05'),
('Laura Pink', 'laura@example.com', '2023-12-09'),
('Mike Orange', 'mike@example.com', '2024-01-20'),
('Nina Purple', 'nina@example.com', '2024-02-14'),
('Oscar Yellow', 'oscar@example.com', '2024-03-18'),
('Paula Cyan', 'paula@example.com', '2024-04-22'),
('Quinn Lime', 'quinn@example.com', '2024-05-30'),
('Rachel Teal', 'rachel@example.com', '2024-06-25'),
('Sam Violet', 'sam@example.com', '2024-07-16'),
('Tina Magenta', 'tina@example.com', '2024-08-11'),
('Uma Gold', 'uma@example.com', '2024-09-05'),
('Victor Silver', 'victor@example.com', '2024-10-12'),
('Wendy Bronze', 'wendy@example.com', '2024-11-01'),
('Xander Indigo', 'xander@example.com', '2024-11-15'),
('Yara Peach', 'yara@example.com', '2024-12-03'),
('Zane Olive', 'zane@example.com', '2024-12-20'),
('Abby Coral', 'abby@example.com', '2025-01-05'),
('Ben Maroon', 'ben@example.com', '2025-01-15'),
('Cathy Teal', 'cathy@example.com', '2025-02-01'),
('David Lime', 'david@example.com', '2025-02-20');


-- ========================================
-- Products (30 rows)
-- ========================================
INSERT INTO products (name, category, price) VALUES
('Laptop Pro 14"', 'Electronics', 1200.00),
('Smartphone X', 'Electronics', 800.00),
('Wireless Headphones', 'Accessories', 150.00),
('Gaming Mouse', 'Accessories', 50.00),
('Office Chair', 'Furniture', 300.00),
('Desk Lamp', 'Furniture', 70.00),
('USB-C Hub', 'Accessories', 40.00),
('4K Monitor', 'Electronics', 350.00),
('Keyboard Mechanical', 'Accessories', 90.00),
('External HDD 1TB', 'Electronics', 100.00),
('Router Pro', 'Electronics', 120.00),
('Webcam HD', 'Electronics', 80.00),
('Smartwatch Z', 'Electronics', 200.00),
('Tablet 10"', 'Electronics', 450.00),
('Noise Cancelling Earbuds', 'Accessories', 120.00),
('Portable Speaker', 'Accessories', 70.00),
('Office Desk', 'Furniture', 250.00),
('Ergonomic Chair', 'Furniture', 350.00),
('Laptop Stand', 'Accessories', 60.00),
('Cable Pack', 'Accessories', 25.00),
('Printer Pro', 'Electronics', 300.00),
('Scanner', 'Electronics', 200.00),
('Projector HD', 'Electronics', 400.00),
('Drawing Tablet', 'Electronics', 180.00),
('Desk Organizer', 'Furniture', 40.00),
('Smartphone Y', 'Electronics', 850.00),
('Laptop Air 13"', 'Electronics', 1100.00),
('Gaming Chair', 'Furniture', 400.00),
('Mouse Pad XL', 'Accessories', 30.00),
('Headset Gaming', 'Accessories', 90.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1,1,'2025-01-01',1250.00),
(2,2,'2025-01-02',800.00),
(3,3,'2025-01-03',1200.00),
(4,4,'2025-01-04',800.00),
(5,5,'2025-01-05',975.00),
(6,6,'2025-01-06',140.00),
(7,7,'2025-01-07',120.00),
(8,8,'2025-01-08',350.00),
(9,9,'2025-01-09',180.00),
(10,10,'2025-01-10',100.00),
(11,1,'2025-01-11',120.00),
(12,2,'2025-01-12',80.00),
(13,3,'2025-01-13',200.00),
(14,4,'2025-01-14',450.00),
(15,5,'2025-01-15',1320.00),
(16,6,'2025-01-16',70.00),
(17,7,'2025-01-17',250.00),
(18,8,'2025-01-18',350.00),
(19,9,'2025-01-19',60.00),
(20,10,'2025-01-20',50.00),
(21,1,'2025-01-21',300.00),
(22,2,'2025-01-22',200.00),
(23,3,'2025-01-23',400.00),
(24,4,'2025-01-24',180.00),
(25,5,'2025-01-25',40.00),
(26,6,'2025-01-26',850.00),
(27,7,'2025-01-27',1100.00),
(28,8,'2025-01-28',400.00),
(29,9,'2025-01-29',30.00),
(30,10,'2025-01-30',90.00);


INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1,1,1,1200.00),
(1,4,1,50.00),
(2,2,1,800.00),
(3,1,1,1200.00),
(4,5,1,800.00),
(5,2,1,800.00),
(5,3,2,175.00),
(6,6,2,70.00),
(7,7,3,40.00),
(8,8,1,350.00),
(9,9,2,90.00),
(10,10,1,100.00),
(11,11,1,120.00),
(12,12,1,80.00),
(13,13,1,200.00),
(14,14,1,450.00),
(15,1,1,1200.00),
(15,15,1,120.00),
(16,16,1,70.00),
(17,17,1,250.00),
(18,18,1,350.00),
(19,19,1,60.00),
(20,20,2,25.00),
(21,21,1,300.00),
(22,22,1,200.00),
(23,23,1,400.00),
(24,24,1,180.00),
(25,25,1,40.00),
(26,26,1,850.00),
(27,27,1,1100.00),
(28,28,1,400.00),
(29,29,1,30.00),
(30,30,1,90.00);



----Orders descending to show the highest-spending customers
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_revenue DESC
LIMIT 10;

----result:
ecommerce-#     c.customer_id,
ecommerce-#     c.name AS customer_name,
ecommerce-#     SUM(oi.quantity * oi.price) AS total_revenue
ecommerce-# FROM customers c
ecommerce-# JOIN orders o ON c.customer_id = o.customer_id
ecommerce-# JOIN order_items oi ON o.order_id = oi.order_id
ecommerce-# GROUP BY c.customer_id, c.name
ecommerce-# ORDER BY total_revenue DESC
ecommerce-# LIMIT 10;
 customer_id | customer_name | total_revenue
-------------+---------------+---------------
           5 | Evan Brown    |       2510.00
           3 | Charlie Lee   |       1800.00
           1 | Alice Johnson |       1670.00
           7 | George White  |       1470.00
           4 | Diana Prince  |       1430.00
           8 | Hannah Black  |       1100.00
           2 | Bob Smith     |       1080.00
           6 | Fiona Green   |       1060.00
           9 | Ian Gray      |        270.00
          10 | Jane Blue     |        240.00
(10 rows)
-----Copy to the locaL storage
\copy (SELECT c.customer_id, c.name AS customer_name, SUM(oi.quantity * oi.price) AS total_revenue FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id GROUP BY c.customer_id, c.name ORDER BY total_revenue DESC LIMIT 10) TO "C:/Users/benja/Portfolio/SQL_Analysis_Project_E_commerce/most_spending_customer.csv" WITH CSV HEADER;


**Explanation:**

* Joins customers → orders → order_items.
* Calculates total revenue per customer (quantity * price).
* Groups by customer and orders descending to get the top 10.

------ Product that has Grown the Most This Year
WITH last_year_sales AS (
    SELECT
        oi.product_id,
        SUM(oi.quantity) AS qty_last_year
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1
    GROUP BY oi.product_id
),
this_year_sales AS (
    SELECT
        oi.product_id,
        SUM(oi.quantity) AS qty_this_year
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    GROUP BY oi.product_id
)
SELECT
    p.product_id,
    p.name AS product_name,
    COALESCE(this_year_sales.qty_this_year,0) AS this_year_qty,
    COALESCE(last_year_sales.qty_last_year,0) AS last_year_qty,
    (COALESCE(this_year_sales.qty_this_year,0) - COALESCE(last_year_sales.qty_last_year,0)) AS growth_qty
FROM products p
LEFT JOIN last_year_sales ON p.product_id = last_year_sales.product_id
LEFT JOIN this_year_sales ON p.product_id = this_year_sales.product_id
ORDER BY growth_qty DESC
LIMIT 1;

----result:
ecommerce=# WITH last_year_sales AS (
ecommerce(#     SELECT
ecommerce(#         oi.product_id,
ecommerce(#         SUM(oi.quantity) AS qty_last_year
ecommerce(#     FROM orders o
ecommerce(#     JOIN order_items oi ON o.order_id = oi.order_id
ecommerce(#     WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1
ecommerce(#     GROUP BY oi.product_id
ecommerce(# ),
ecommerce-# this_year_sales AS (
ecommerce(#     SELECT
ecommerce(#         oi.product_id,
ecommerce(#         SUM(oi.quantity) AS qty_this_year
ecommerce(#     FROM orders o
ecommerce(#     JOIN order_items oi ON o.order_id = oi.order_id
ecommerce(#     WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
ecommerce(#     GROUP BY oi.product_id
ecommerce(# )
ecommerce-# SELECT
ecommerce-#     p.product_id,
ecommerce-#     p.name AS product_name,
ecommerce-#     COALESCE(this_year_sales.qty_this_year,0) AS this_year_qty,
ecommerce-#     COALESCE(last_year_sales.qty_last_year,0) AS last_year_qty,
ecommerce-#     (COALESCE(this_year_sales.qty_this_year,0) - COALESCE(last_year_sales.qty_last_year,0)) AS growth_qty
ecommerce-# FROM products p
ecommerce-# LEFT JOIN last_year_sales ON p.product_id = last_year_sales.product_id
ecommerce-# LEFT JOIN this_year_sales ON p.product_id = this_year_sales.product_id
ecommerce-# ORDER BY growth_qty DESC
ecommerce-# LIMIT 1;

-----copy to local drive in csv format
\copy (WITH last_year_sales AS (SELECT oi.product_id, SUM(oi.quantity) 
AS qty_last_year FROM orders o JOIN order_items oi ON o.order_id = oi.order_id
 WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 
 GROUP BY oi.product_id), this_year_sales AS (SELECT oi.product_id, SUM(oi.quantity) AS qty_this_year 
 FROM orders o JOIN order_items oi ON o.order_id = oi.order_id 
 WHERE EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE) 
 GROUP BY oi.product_id) SELECT p.product_id, p.name AS product_name, COALESCE(this_year_sales.qty_this_year,0) AS this_year_qty, 
 COALESCE(last_year_sales.qty_last_year,0) AS last_year_qty, (COALESCE(this_year_sales.qty_this_year,0) - COALESCE(last_year_sales.qty_last_year,0)) AS growth_qty FROM products p 
 LEFT JOIN last_year_sales ON p.product_id = last_year_sales.product_id LEFT JOIN this_year_sales ON p.product_id = this_year_sales.product_id 
 ORDER BY growth_qty DESC LIMIT 1) TO 'C:/Users/benja/Portfolio/SQL_Analysis_Project_E_commerce/Product_Grown_the_Most_this_Year.csv' WITH CSV HEADER;


**Explanation:**

* Calculates total quantity sold last year and this year.
* Calculates growth as this_year - last_year.
* Orders descending and takes the top product with highest growth.


-----Top 5 Products by Revenue

SELECT
    p.product_id,
    p.name AS product_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC
LIMIT 5;

---result:
ecommerce=# SELECT
ecommerce-#     p.product_id,
ecommerce-#     p.name AS product_name,
ecommerce-#     SUM(oi.quantity * oi.price) AS total_revenue
ecommerce-# FROM products p
ecommerce-# JOIN order_items oi ON p.product_id = oi.product_id
ecommerce-# JOIN orders o ON oi.order_id = o.order_id
ecommerce-# GROUP BY p.product_id, p.name
ecommerce-# ORDER BY total_revenue DESC
ecommerce-# LIMIT 5;
 product_id |  product_name  | total_revenue
------------+----------------+---------------
          1 | Laptop Pro 14" |       3600.00
          2 | Smartphone X   |       1600.00
         27 | Laptop Air 13" |       1100.00
         26 | Smartphone Y   |        850.00
          5 | Office Chair   |        800.00
(5 rows)

------Copy to local drive in csv format 
----------------------------
\copy (SELECT p.product_id, p.name AS product_name, SUM(oi.quantity * oi.price) AS total_revenue FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id 
JOIN orders o ON oi.order_id = o.order_id 
GROUP BY p.product_id, p.name 
ORDER BY total_revenue DESC LIMIT 5) TO 'C:/Users/benja/Portfolio/SQL_Analysis_Project_E_commerce/Top_5_Products_by_Revenue.csv' WITH CSV HEADER;

**Explanation:**

* Calculates revenue per product (quantity * price).
* Orders descending to get the top 5 highest revenue products.

---

### 4️⃣ Monthly Revenue Trends

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

--### result :
ecommerce=# SELECT
ecommerce-#     DATE_TRUNC('month', o.order_date) AS month,
ecommerce-#     SUM(oi.quantity * oi.price) AS monthly_revenue
ecommerce-# FROM orders o
ecommerce-# JOIN order_items oi ON o.order_id = oi.order_id
ecommerce-# GROUP BY month
ecommerce-# ORDER BY month;
         month          | monthly_revenue
------------------------+-----------------
 2025-01-01 00:00:00+00 |        12630.00
(1 row)


**Explanation:**

* Groups orders by month using DATE_TRUNC.
* Calculates total revenue per month.
* Helps visualize revenue trends over time.

 5️⃣ Customer Retention Analysis (Repeat Customers)

WITH first_orders AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
),
repeat_orders AS (
    SELECT o.customer_id, COUNT(o.order_id) AS total_orders
    FROM orders o
    JOIN first_orders f ON o.customer_id = f.customer_id
    WHERE o.order_date > f.first_order_date
    GROUP BY o.customer_id
)
SELECT
    COUNT(*) AS repeat_customers,
    AVG(total_orders) AS avg_repeat_orders
FROM repeat_orders;

---###Result:
ecommerce=# WITH first_orders AS (
ecommerce(#     SELECT customer_id, MIN(order_date) AS first_order_date
ecommerce(#     FROM orders
ecommerce(#     GROUP BY customer_id
ecommerce(# ),
ecommerce-# repeat_orders AS (
ecommerce(#     SELECT o.customer_id, COUNT(o.order_id) AS total_orders
ecommerce(#     FROM orders o
ecommerce(#     JOIN first_orders f ON o.customer_id = f.customer_id
ecommerce(#     WHERE o.order_date > f.first_order_date
ecommerce(#     GROUP BY o.customer_id
ecommerce(# )
ecommerce-# SELECT
ecommerce-#     COUNT(*) AS repeat_customers,
ecommerce-#     AVG(total_orders) AS avg_repeat_orders
ecommerce-# FROM repeat_orders;
 repeat_customers | avg_repeat_orders
------------------+--------------------
               10 | 2.0000000000000000
(1 row)


**Explanation:**

* `first_orders` finds the first order date for each customer.
* `repeat_orders` counts orders after the first one.
* Final query gives: total repeat customers and average repeat orders per customer.

---

**Notes:**

* `oi` is an alias for the `order_items` table.
* Aliases like `c` for `customers` and `o` for `orders` are used to make queries shorter and clearer.
* These queries are suitable for a Product Analyst or Data Analyst portfolio project.
