---- DAILY BUSSINESS TREND FOR 2025
SELECT
FORMAT_DATE('%A', DATE(created_at)) AS day_of_week,
COUNT(order_id) AS order_count,
SUM(sale_price) as revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE
status = 'Complete'
AND EXTRACT(YEAR FROM created_at) = 2025
GROUP BY day_of_week
ORDER BY order_count DESC;