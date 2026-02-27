---- MOST PROFITABLE STATES |
SELECT
  SUM(sale_price) as revenue,
  COUNT(order_id) as order_count,
  users.state
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
JOIN `bigquery-public-data.thelook_ecommerce.users` AS users
ON order_items.user_id = users.id
WHERE status = 'Complete'
GROUP BY state
ORDER BY revenue DESC
LIMIT 20