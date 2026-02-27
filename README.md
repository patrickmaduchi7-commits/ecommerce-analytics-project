# E-commerce Business Intelligence Analysis

**Comprehensive SQL-powered analysis of $1.2M e-commerce revenue across growth, product performance, and customer retention (2019-2026 dataset)**

![Project Banner](https://img.shields.io/badge/SQL-BigQuery-blue) ![Status](https://img.shields.io/badge/Status-Complete-success) ![Tools](https://img.shields.io/badge/Tools-Looker%20Studio-orange)

---

## Project Overview

Analyzed 7 interconnected tables containing e-commerce transaction data to deliver actionable insights across three strategic pillars:
- **Growth & Revenue Performance** - Revenue trends, geographic distribution, and order patterns
- **Product Performance & Inventory Health** - Profitability analysis, return rates, and fulfillment metrics  
- **Customer Growth & Retention** - Lifetime value segmentation, churn risk assessment, and channel effectiveness

**Key Metrics:**
-  $1.2M Total Revenue Analyzed
- 125K+ Product Sales
- 19.6K Total Orders
- 100% YoY Revenue Growth (2025)

---

## Business Impact

### Strategic Recommendations Delivered:
1. **Q4 Revenue Optimization** - Identified 100% YoY growth pattern → Recommended October inventory increase
2. **Return Rate Reduction** - Flagged 50%+ return rates on 20 products → $50K+ potential savings
3. **Customer Retention** - Identified 2,769 at-risk VIP customers → Automated win-back campaign proposed
4. **Channel Reallocation** - Shifted budget from Facebook/Display to Search/Organic based on LTV data

---

## Repository Structure
```
📁 ecommerce-analytics-project/
├── 📂 queries/
│   ├── 📂 growth/          # Revenue trends, geographic, daily patterns (4 queries)
│   ├── 📂 product/         # Profitability, returns, brands, seasonality (7 queries)
│   └── 📂 customer/        # LTV, churn, traffic sources (3 queries)
├── 📂 dashboards/          # Executive-ready PDF reports
└── 📂 documentation/       # Data dictionary, methodology
```

---

## Key Analyses

### 1 Growth & Revenue Performance
**Questions Answered:**
- What is our monthly revenue trend and growth rate?
- Which geographic markets drive the most revenue?
- What days of the week generate peak sales?
- How has average order value changed over time?

**Key Findings:**
- Revenue doubled from $60K (Jan) to $120K (Dec) in 2025
- Wednesday generates 15% more revenue than weekend days
- California and Guangdong lead with $142K combined revenue
- AOV stable at $83.92 across 12 months

📊 [View Growth Dashboard](./dashboards/growth_dashboard.pdf)

---

### 2 Product Performance & Inventory Health
**Questions Answered:**
- Which product categories are most profitable?
- What brands drive the highest margins?
- Which products have concerning return rates?
- How do sales vary by season?

**Key Findings:**
- Outerwear & Coats: $182K profit (55.7% margin) - top category
- Calvin Klein leads volume ($28K profit), Carhartt leads efficiency (60% margin)
- 5 products with 50%+ return rates identified for quality review
- 25% order leakage from cancellations + returns

📊 [View Product Dashboard](./dashboards/product_dashboard.pdf)

---

### 3 Customer Growth & Retention
**Questions Answered:**
- Who are our most valuable customers?
- Which customers are at risk of churning?
- Which marketing channels bring high-quality vs. high-volume customers?
- What is the average customer lifetime value?

**Key Findings:**
- Top 10% customers (2,769 users) drive 40%+ of revenue
- 45% of VIP customers inactive 180+ days (churn emergency)
- Display ads: Lowest volume but highest LTV ($99.40/customer)
- Search: Highest volume but lower retention than Display/Organic

📊 [View Customer Dashboard](./dashboards/customer_dashboard.pdf)

---

## Technologies Used

| Category | Tools |
|----------|-------|
| **Data Source** | Google BigQuery Public Dataset |
| **Query Language** | SQL (BigQuery dialect) |
| **Visualization** | Looker Studio |
| **Analysis** | SQL aggregations, window functions, CTEs, joins |

---

##  SQL Techniques Demonstrated

- ✅ Complex multi-table `JOIN`s (3-4 tables)
- ✅ Window functions (`NTILE`, `ROW_NUMBER`, aggregates with `OVER()`)
- ✅ CTEs (Common Table Expressions) for readability
- ✅ `CASE WHEN` for conditional logic (seasonal patterns, risk tiers)
- ✅ Date functions (`EXTRACT`, `DATE_DIFF`, `FORMAT_DATE`)
- ✅ Aggregate functions with `GROUP BY` and `HAVING`
- ✅ Subqueries for complex calculations

---

## Sample Query

**Top 10% Customers by Lifetime Value:**
```sql
SELECT 
  users.id AS user_id,
  CONCAT(users.first_name, ' ', users.last_name) AS full_name,
  SUM(order_items.sale_price) AS lifetime_value,
  COUNT(DISTINCT orders.order_id) AS total_orders,
  ROUND(AVG(order_items.sale_price), 2) AS avg_order_value
FROM `bigquery-public-data.thelook_ecommerce.users` AS users
JOIN `bigquery-public-data.thelook_ecommerce.orders` AS orders
  ON users.id = orders.user_id
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
  ON orders.order_id = order_items.order_id
WHERE order_items.status = 'Complete'
GROUP BY users.id, full_name
ORDER BY lifetime_value DESC
LIMIT 2769;  -- Top 10% of 27,690 customers
```

[View all queries →](./queries/)

---

## 📊 Dashboard Previews

### Growth Dashboard
![Growth Preview](./dashboards/TheLook_eCommerce_Growth_dashboard.pdf)

### Product Dashboard
![Product Preview](./dashboards/TheLook_eCommerce_Product_dashboard.pdf)

### Customer Dashboard
![Customer Preview](./dashboards/TheLook_eCommerce_Customer_dashboard.pdf)

---

## Skills Demonstrated

**Technical:**
- SQL (advanced joins, CTEs, window functions)
- Data visualization (12+ chart types)
- BigQuery proficiency
- Statistical analysis

**Business:**
- Strategic thinking & recommendations
- Executive communication
- ROI-focused analysis
- Risk identification
- Customer segmentation

---

## Contact

**Maduchi Patrick**
- 💼 [LinkedIn](https://www.linkedin.com/in/maduchi-patrick-90ba27336)
- 📧 patrickmaduchi7@gmail.com


---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Data Source: [BigQuery Public Datasets - TheLook E-commerce](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce)
- Analysis Period: 2019-2026 dataset
- Tools: BigQuery, Looker Studio, SQL

---

**⭐ If you found this project useful, please consider giving it a star!**

---

## Statement of Authenticity

All analytical queries and strategic recommendations are the original work of the author. No generative AI was utilized for the technical execution or strategic formulation phases of this project.
