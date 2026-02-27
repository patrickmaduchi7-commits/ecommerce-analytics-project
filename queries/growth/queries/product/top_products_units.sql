--- TOP 20 UNITS SOLD
SELECT
  COUNT(product_id) AS items,
  pi.name AS product_name
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` as pi
ON oi.product_id = pi.id
WHERE oi.status = 'Complete'
GROUP BY pi.name
ORDER BY items DESC
limit 20