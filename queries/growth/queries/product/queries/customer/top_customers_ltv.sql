---Top 10% customers by LTV (Lifetime Value)
SELECT
  OI.user_id,
  CONCAT (first_name, ' ', last_name) AS full_name,
  UE.email,
  SUM(OI.sale_price) AS total_spent,
  COUNT(OI.id) AS total_orders ,
  AVG(OI.sale_price) AS avg_spent
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS OI
JOIN `bigquery-public-data.thelook_ecommerce.users` AS UE
ON OI.user_id = UE.id
WHERE OI.status = 'Complete'
GROUP BY OI.user_id, full_name, UE.email
ORDER BY total_spent DESC
LIMIT 2769

---- FINDING OUT TOTAL NUMBER S I CAN LIMIT BY THE top 10%
SELECT COUNT(DISTINCT user_id)
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'