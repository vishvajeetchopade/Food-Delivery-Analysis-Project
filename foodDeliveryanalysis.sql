CREATE DATABASE IF NOT EXISTS food_delivery;

USE food_delivery;
SELECT * FROM customers;
SHOW TABLES;
DESCRIBE customers;
CREATE OR REPLACE VIEW clean_orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    restaurant,
    UPPER(TRIM(city)) AS city,
    order_date,
    delivery_time_minutes,
    item,
    quantity,
    price,
    discount,
    payment_method,
    rating
FROM customers;
SELECT * FROM clean_orders;

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_orders;

SELECT
    restaurant,
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_orders
GROUP BY restaurant
ORDER BY total_orders DESC;

SELECT
    ROUND(AVG(delivery_time_minutes), 2) AS average_delivery_time
FROM clean_orders
WHERE delivery_time_minutes > 0;

SELECT
    item,
    SUM(quantity) AS total_quantity_ordered
FROM clean_orders
GROUP BY item
ORDER BY total_quantity_ordered DESC
LIMIT 10;

SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT order_id) * 100.0 /
        (SELECT COUNT(DISTINCT order_id)
         FROM clean_orders),
        2
    ) AS percentage
FROM clean_orders
GROUP BY payment_method
ORDER BY total_orders DESC;

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

SELECT
    ROUND(
        SUM(price * quantity) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM clean_orders;

SELECT
    restaurant,
    ROUND(AVG(rating), 2) AS average_rating,
    RANK() OVER (
        ORDER BY AVG(rating) DESC
    ) AS restaurant_rank
FROM clean_orders
WHERE rating IS NOT NULL
GROUP BY restaurant;

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

SELECT
    COUNT(DISTINCT CASE
        WHEN order_status = 'Cancelled'
        THEN order_id
    END) AS cancelled_orders,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN order_status = 'Cancelled'
            THEN order_id
        END) * 100.0 /
        COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate
FROM clean_orders;
