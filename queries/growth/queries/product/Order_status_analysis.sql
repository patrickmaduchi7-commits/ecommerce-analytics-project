---- ORDER STATUS BREAKDOWN
SELECT
  status,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(COUNT(DISTINCT order_id) / SUM(COUNT(DISTINCT order_id)) OVER() * 100, 2) AS percentage
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY status
ORDER BY total_orders DESC;