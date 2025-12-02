**SQL Analysis Project – E-commerce Example**

 1️⃣ Top 10 Customers by Revenue

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
```

**Explanation:**

* Joins customers → orders → order_items.
* Calculates total revenue per customer (quantity * price).
* Groups by customer and orders descending to get the top 10.

---

### 2️⃣ Product that has Grown the Most This Year

```sql
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


**Explanation:**

* Calculates total quantity sold last year and this year.
* Calculates growth as this_year - last_year.
* Orders descending and takes the top product with highest growth.


3️⃣ Top 5 Products by Revenue

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
----------------------------

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


**Explanation:**

* `first_orders` finds the first order date for each customer.
* `repeat_orders` counts orders after the first one.
* Final query gives: total repeat customers and average repeat orders per customer.

---

**Notes:**

* `oi` is an alias for the `order_items` table.
* Aliases like `c` for `customers` and `o` for `orders` are used to make queries shorter and clearer.
* These queries are suitable for a Product Analyst or Data Analyst portfolio project.
