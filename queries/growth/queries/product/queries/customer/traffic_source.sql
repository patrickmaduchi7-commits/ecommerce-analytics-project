---BEST PERFORMING TRAFFIC SOURCE
SELECT
  users.traffic_source AS traffic_source,
  COUNT(DISTINCT users.id) AS total_customers,
  SUM(oi.sale_price) AS total_revenue,
  ROUND(SUM(oi.sale_price) / COUNT(DISTINCT users.id), 2) AS avg_ltv_per_customer
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS users
  ON oi.user_id = users.id
WHERE oi.status = 'Complete'
GROUP BY traffic_source
ORDER BY avg_ltv_per_customer DESC