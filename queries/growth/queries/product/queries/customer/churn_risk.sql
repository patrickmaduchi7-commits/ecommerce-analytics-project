----CUSTOMERS AT CHURNING RISK
SELECT
  users.id AS user_id,
  CONCAT(users.first_name, ' ', users.last_name) AS customer_name,
  users.email AS email,
  MAX(orders.created_at) AS last_order_date,
  DATE_DIFF(CURRENT_DATE(), DATE(MAX(orders.created_at)), DAY)
   AS days_since_last_order,
  COUNT(DISTINCT orders.order_id) AS total_orders,
  SUM(order_items.sale_price) AS lifetime_value,
FROM `bigquery-public-data`.`thelook_ecommerce`.`users` AS users
LEFT JOIN `bigquery-public-data`.`thelook_ecommerce`.`orders` AS orders
  ON users.id = orders.user_id
LEFT JOIN
  `bigquery-public-data`.`thelook_ecommerce`.`order_items` AS order_items
  ON orders.order_id = order_items.order_id
GROUP BY users.id, customer_name, users.email
ORDER BY last_order_date DESC;