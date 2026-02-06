USE Retail_analysis;

SELECT * FROM retail_sales;

-- --Total number of records---

SELECT COUNT(*) AS cnt
FROM retail_sales;

-- --Checking for duplicate---

SELECT transactions_id, COUNT(*)
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

-- --Checking for NULL value--

SELECT * FROM retail_sales
WHERE age IS NULL
   OR transactions_id IS NULL
   OR sale_date is NULL
   OR sale_time is NULL
   OR age is NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
   
   
   -- --1.Top Revenue-Generating Categories--
   
   SELECT category, sum(total_sale) as total_revenue
   FROM retail_sales
   GROUP BY category
   ORDER BY total_revenue DESC;
   
-- --2.Low-Profit Categories (High Sales, Low Margin)--

SELECT category,
sum(total_sale) as revenue,
sum(cogs) as total_cost,
round((sum(total_sale)-sum(cogs))/sum(total_sale)*100,2) as profit_margin_pct
FROM retail_sales
GROUP BY category
ORDER BY profit_margin_pct;

-- --3.Calculate the Peak Sales Hours--

SELECT 
EXTRACT(hour from sale_time)as hour,
sum(total_sale) as revenue
FROM retail_sales
GROUP BY hour
ORDER BY revenue DESC;

-- --4.Which days of the week generate the highest sales--

SELECT 
DAYNAME(sale_date) AS day_name,
SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY day_name
ORDER BY total_revenue DESC;

-- --5.Top 10 High Value Customer--

SELECT customer_id, 
sum(total_sale) as high_value
FROM retail_sales
GROUP BY customer_id
ORDER BY high_value DESC
LIMIT 10;

-- --6.Repeat vs One-Time Customers--

SELECT
    customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        customer_id,
        CASE 
            WHEN COUNT(DISTINCT transactions_id) = 1 THEN 'One_time'
            ELSE 'Repeat'
        END AS customer_type
    FROM retail_sales
    GROUP BY customer_id
) t
GROUP BY customer_type;



-- --7.Gender-Based Category Preference--

SELECT gender, category,
sum(total_sale) as revenue
FROM retail_sales
GROUP BY gender,category
ORDER BY gender,revenue DESC;

-- --8.Revenue Contribution by Age Group--

SELECT
CASE WHEN age<=25 THEN 'Under 25'
WHEN age BETWEEN 25 AND 34 THEN '25-34'
WHEN age BETWEEN 35 AND 44 THEN '35-44'
WHEN age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END as age_group,
SUM(total_sale) as total_revenue
FROM retail_sales
GROUP BY age_group
ORDER BY total_revenue;

-- --9.Average Order Value (AOV) by Category--

SELECT category,
ROUND(sum(total_sale)/COUNT(DISTINCT transactions_id),2) as avg_order_value
FROM retail_sales
GROUP BY category
ORDER BY avg_order_value DESC;

-- --10.Monthly Sales Trend--

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(total_sale) AS monthly_sale
FROM retail_sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;

-- --11.Transaction Size Distribution--

SELECT VERSION();

SELECT 
CASE WHEN quantity=1 THEN 'Single Item'
WHEN quantity BETWEEN 2 AND 4 THEN 'Small Basket'
ELSE 'Bulk Purchase'
END AS purchase_type,
COUNT(*) as transactions
FROM retail_sales
GROUP BY purchase_type;

-- --12.Find customers whose most recent purchase was more than 90 days ago(Churn-Risk Customers)--

WITH no_recent_purchase AS(
SELECT 
customer_id,
MAX(sale_date) as last_purchase_date
FROM retail_sales
GROUP BY customer_id
)
SELECT customer_id,
last_purchase_date
FROM no_recent_purchase
WHERE last_purchase_date<CURRENT_DATE - INTERVAL 90 day;

-- --13.Cost-to-Revenue Efficiency by Category--

SELECT category,
ROUND(sum(cogs)/sum(total_sale),2) as cost_revenue_ratio
FROM retail_sales
GROUP BY category
ORDER BY cost_revenue_ratio DESC;

-- --14.Rank customers by total sales and identify the top 20% of customers contributing to revenue--

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(total_sale) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(total_sale) DESC) AS rn,
        COUNT(*) OVER () AS total_customers
    FROM retail_sales
    GROUP BY customer_id
)
SELECT
	rn,
    customer_id,
    total_revenue
FROM customer_revenue
WHERE rn <= total_customers * 0.2
ORDER BY total_revenue DESC;

-- --15.Best & Worst Performing Time Periods--alter

 WITH hourly_sales AS (
    SELECT
        HOUR(sale_time) AS sale_hour,
        SUM(total_sale) AS total_revenue
    FROM retail_sales
    GROUP BY HOUR(sale_time)
)
SELECT
    sale_hour,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS performance_rank
FROM hourly_sales;


-- --THE END-- --

