USE olist_portfolio;

-- =========================================================
-- Sales KPI Analysis
-- =========================================================
-- Purpose:
-- Analyze overall sales performance using revenue,
-- total orders, average order value, and monthly trends.
-- =========================================================


-- 1. Overall Sales KPIs
-- ---------------------------------------------------------
-- Total Revenue
-- Total Orders
-- Average Order Value (AOV)

SELECT
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id;


-- 2. Monthly Sales Performance
-- ---------------------------------------------------------
-- Analyze revenue and order volume by month.

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
GROUP BY
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY
    sales_month;


-- 3. Revenue by Payment Type
-- ---------------------------------------------------------
-- Compare revenue contribution across payment methods.

SELECT
    p.payment_type,
    COUNT(DISTINCT p.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(
        SUM(p.payment_value) /
        COUNT(DISTINCT p.order_id),
        2
    ) AS average_order_value
FROM payments p
GROUP BY
    p.payment_type
ORDER BY
    total_revenue DESC;


-- 4. Sales Performance by Order Status
-- ---------------------------------------------------------
-- Analyze revenue and order volume by order status.

SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
GROUP BY
    o.order_status
ORDER BY
    total_revenue DESC;


-- 5. Top 10 Sales Months by Revenue
-- ---------------------------------------------------------
-- Identify the months with the highest revenue.

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
GROUP BY
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY
    total_revenue DESC
LIMIT 10;
