---TOP 20 ITEMS BY REVENUE
SELECT
  SUM(sale_price) AS revenue,
  pi.name AS product_name
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` as pi
ON oi.product_id = pi.id
WHERE oi.status = 'Complete'
GROUP BY pi.name
ORDER BY revenue DESC
limit 20