---BESST PERFOMING BRANDS
SELECT
  p.brand, COUNT(DISTINCT oi.order_id) AS total_orders,
  SUM(oi.sale_price - p.cost) AS total_profit,
  SUM(oi.sale_price) AS total_revenue,
  SUM(p.cost) AS total_cost,
  ROUND((SUM(oi.sale_price - p.cost) / SUM(oi.sale_price)) * 100, 2) AS profit_margin_pct
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY p.brand
ORDER BY total_profit DESC