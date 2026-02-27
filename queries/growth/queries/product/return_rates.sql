---MOST RETURNED ITEMS
SELECT
  p.name AS product_name,
  COUNT(oi.id) AS total_sales,
  COUNT(oi.returned_at) AS total_returns,
  ROUND((COUNT(oi.returned_at) / COUNT(oi.id)) * 100, 2) AS return_rate_pct
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
GROUP BY p.name
HAVING COUNT(oi.id) > 10 ---more than 10 total sales
ORDER BY return_rate_pct DESC
LIMIT 20