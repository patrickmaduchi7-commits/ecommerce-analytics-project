---- MONTHLY REVENUE TREND
SELECT
  EXTRACT(YEAR FROM created_at) AS year,
  EXTRACT(MONTH FROM created_at) AS month,
  FORMAT_DATE('%B', DATE(created_at)) AS month_name,
  SUM(sale_price) AS total_revenue,
  COUNT(order_id) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete' AND EXTRACT(YEAR FROM created_at) = 2025
GROUP BY year, month, month_name
ORDER BY year DESC, month DESC;