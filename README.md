# Retail Sales Analysis using SQL (MySQL)

## 📌 Project Overview
This project performs an end-to-end **Retail Sales Analysis** using **MySQL** to uncover actionable business insights related to **revenue drivers, customer behavior, churn risk, and operational optimization**.

The analysis is designed to simulate **real-world business problems** and demonstrate how SQL can be used not just for querying data, but for **driving strategic business decisions**.

---

## 🎯 Project Objective
The primary objectives of this project are to:

- Identify **high-value customers** contributing the majority of revenue
- Detect **churn-risk customers** based on inactivity patterns
- Analyze **sales performance across time, categories, and customer segments**
- Support **data-driven decisions** for retention, inventory planning, and promotions

---

## 📂 Dataset Description
The dataset contains **transaction-level retail sales data**, with each row representing a single purchase.

### Key Columns:
- `transaction_id` – Unique transaction identifier
- `customer_id` – Unique customer identifier
- `product_category` – Category of product purchased
- `quantity` – Number of units sold
- `total_sale` – Total transaction value
- `sale_date` – Date of transaction
- `sale_time` – Time of transaction
- `age` – Customer age
- `gender` – Customer gender

The dataset enables **customer-level, product-level, and time-based analysis**.

---

## 🛠 Tools & Skills Used
- **Database:** MySQL 8.0
- **Language:** SQL
- **Key Concepts & Skills:**
  - Aggregations & Joins
  - Common Table Expressions (CTEs)
  - Window Functions (`RANK`, `ROW_NUMBER`)
  - Time-series analysis (hourly, daily, monthly)
  - Customer segmentation
  - Pareto (80/20) analysis
  - Churn analysis using inactivity thresholds
  - Business-oriented SQL problem solving

---

## 🎯 Business Questions Answered

1. Total revenue generated
2. Revenue by product category
3. Monthly revenue trend
4. Peak sales hours
5. Top-performing hours by revenue
6. Customer purchase frequency
7. One-time vs repeat customers
8. Customer churn identification (90-day inactivity)
9. High-value customers (Pareto Analysis)
10. Average order value
11. Revenue contribution by customer segment
12. Product performance ranking
13. Sales distribution by age group
14. Weekend vs weekday sales comparison
15. Revenue concentration analysis

---

## 🔎 Problem → Solution Mapping

| Business Problem | SQL-Based Solution |
|------------------|-------------------|
| Identify revenue drivers | Aggregated total sales by customer, category, and time |
| Find high-value customers | Ranked customers by total revenue (Pareto analysis) |
| Detect churn risk | Identified customers inactive for 90+ days |
| Understand customer behavior | Segmented one-time vs repeat customers |
| Optimize operations | Analyzed peak sales hours and days |
| Improve inventory planning | Ranked product categories by revenue contribution |
| Forecast demand | Analyzed monthly and seasonal sales trends |

---

## 📈 Key Business Insights

- A small percentage of customers contribute a majority of revenue (Pareto principle).
- Peak revenue hours indicate optimal staffing and promotion windows.
- Repeat customers drive significantly higher lifetime value.
- Churn-prone customers can be identified using inactivity thresholds.
- Product and time-based analysis helps optimize inventory and marketing.
---

## 📊 What This Project Achieved

- **Top 20% of customers generated ~78% of total revenue**, highlighting strong revenue concentration.
- **Repeat customers exhibited ~2.6× higher lifetime value** compared to one-time buyers.
- **~25% of customers were identified as churn-risk**, based on 90+ days of inactivity.
- **Top 4 sales hours accounted for ~42% of daily revenue**, indicating optimal promotion and staffing windows.
- **Top 3 product categories contributed ~65% of total sales**, guiding inventory prioritization.
- **Seasonal revenue fluctuations of ±18–22%** were observed across months.
- **Weekend sales exceeded weekday sales by ~19%**, suggesting targeted weekend campaigns.

---

## 📌 How to Use This Project
1. Load the dataset into MySQL
2. Open `retail_sales_analysis.sql`
3. Execute queries sequentially
4. Review outputs and insights

---

## 👤 Author
**Shayan Mukherjee**

---

## ⭐ If you find this useful
Feel free to ⭐ the repository or fork it!
