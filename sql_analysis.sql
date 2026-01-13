-- Total Revenue
SELECT SUM(sales_amount) AS total_revenue
FROM sales_data;

-- Monthly Revenue Trend
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales_amount) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- Top Products by Revenue
SELECT 
    product_name,
    SUM(sales_amount) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC;

-- City-wise Sales Performance
SELECT 
    city,
    SUM(sales_amount) AS city_revenue
FROM sales_data
GROUP BY city
ORDER BY city_revenue DESC;

-- Repeat Customers
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM sales_data
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
