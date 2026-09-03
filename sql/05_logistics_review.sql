USE olist_portfolio;

-- ============================================================
-- Logistics & Customer Review Analysis
-- Olist E-Commerce Portfolio
-- ============================================================


-- ============================================================
-- 1. Delivery Performance Overview
-- ============================================================
SELECT
    COUNT(*) AS delivered_orders,

    SUM(
        CASE
            WHEN order_delivered_customer_date
                 <= order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS on_time_orders,

    SUM(
        CASE
            WHEN order_delivered_customer_date
                 > order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS late_orders,

    ROUND(
        SUM(
            CASE
                WHEN order_delivered_customer_date
                     <= order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS on_time_percentage

FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


-- ============================================================
-- 2. Average Delivery Time
-- ============================================================
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,

    MIN(
        DATEDIFF(
            order_delivered_customer_date,
            order_purchase_timestamp
        )
    ) AS min_delivery_days,

    MAX(
        DATEDIFF(
            order_delivered_customer_date,
            order_purchase_timestamp
        )
    ) AS max_delivery_days

FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL;


-- ============================================================
-- 3. Delivery Performance by Order Status
-- ============================================================
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- ============================================================
-- 4. Average Estimated vs Actual Delivery Time
-- ============================================================
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_estimated_delivery_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_estimated_delivery_days,

    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_actual_delivery_days

FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


-- ============================================================
-- 5. Average Review Score
-- ============================================================
SELECT
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM reviews;


-- ============================================================
-- 6. Review Score Distribution
-- ============================================================
SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reviews),
        2
    ) AS review_percentage
FROM reviews
GROUP BY review_score
ORDER BY review_score DESC;


-- ============================================================
-- 7. Review Performance by Delivery Status
-- ============================================================
SELECT
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
        THEN 'On Time'
        WHEN o.order_delivered_customer_date
             > o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'Unknown'
    END AS delivery_status,

    COUNT(DISTINCT r.order_id) AS reviewed_orders,

    ROUND(AVG(r.review_score), 2) AS avg_review_score

FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY
    CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
        THEN 'On Time'
        WHEN o.order_delivered_customer_date
             > o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'Unknown'
    END

ORDER BY avg_review_score DESC;


-- ============================================================
-- 8. Review Score by Delivery Performance
-- ============================================================
SELECT
    r.review_score,

    COUNT(DISTINCT CASE
        WHEN o.order_delivered_customer_date
             <= o.order_estimated_delivery_date
        THEN o.order_id
    END) AS on_time_orders,

    COUNT(DISTINCT CASE
        WHEN o.order_delivered_customer_date
             > o.order_estimated_delivery_date
        THEN o.order_id
    END) AS late_orders

FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY r.review_score
ORDER BY r.review_score DESC;


-- ============================================================
-- 9. Delivery Delay Analysis
-- ============================================================
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_estimated_delivery_date
            )
        ),
        2
    ) AS avg_delay_days,

    MAX(
        DATEDIFF(
            order_delivered_customer_date,
            order_estimated_delivery_date
        )
    ) AS max_delay_days

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
  AND order_delivered_customer_date > order_estimated_delivery_date;


-- ============================================================
-- 10. Logistics & Review Summary
-- ============================================================
SELECT
    COUNT(*) AS delivered_orders,

    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,

    ROUND(
        SUM(
            CASE
                WHEN order_delivered_customer_date
                     <= order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS on_time_percentage

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;
