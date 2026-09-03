USE olist_portfolio;

-- =====================================================
-- Data Validation
-- =====================================================

-- 1. Total orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;


-- 2. Orders without payment
SELECT
    COUNT(*) AS orders_without_payment
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
WHERE p.order_id IS NULL;


-- 3. Orders without order items
SELECT
    COUNT(*) AS orders_without_items
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


-- 4. Delivered orders without order items
SELECT
    o.order_id,
    o.order_status
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
  AND o.order_status = 'delivered';


-- 5. Orders without items by status
SELECT
    o.order_status,
    COUNT(*) AS total_orders
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
GROUP BY o.order_status
ORDER BY total_orders DESC;


-- 6. Overall order and payment consistency
SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,

    COUNT(DISTINCT CASE
        WHEN oi.order_id IS NOT NULL THEN o.order_id
    END) AS orders_with_items,

    COUNT(DISTINCT CASE
        WHEN p.order_id IS NOT NULL THEN o.order_id
    END) AS orders_with_payment

FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
LEFT JOIN payments p
    ON o.order_id = p.order_id;
