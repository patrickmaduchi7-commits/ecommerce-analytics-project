---What's our average order value? How has it changed over time?
SELECT
  year,month,
  AVG(order_total) as avg_order_value
FROM (
  SELECT
    order_id,
    EXTRACT(YEAR FROM created_at) as year,
    EXTRACT(MONTH FROM created_at) as month,
    SUM(sale_price) as order_total
  FROM `bigquery-public-data.thelook_ecommerce.order_items` WHERE status = 'Complete'
  and EXTRACT(YEAR FROM created_at) =2025
  GROUP BY order_id, year, month)
GROUP BY year, month
ORDER BY year, month