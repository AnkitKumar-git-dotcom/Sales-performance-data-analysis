-- Create the table based on your dataset
CREATE TABLE sales_performance (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    product_name VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50),
    sales_amount DECIMAL(10,2)
);

-- Insert your specific data
INSERT INTO sales_performance (order_id, order_date, customer_id, product_name, category, city, sales_amount)
VALUES 
(1001,'2024-01-05','C001','Laptop','Electronics','Delhi',55000),
(1002,'2024-01-07','C002','Smartphone','Electronics','Mumbai',30000),
(1003,'2024-01-10','C003','Headphones','Accessories','Bangalore',2000),
(1004,'2024-02-02','C001','Laptop','Electronics','Delhi',55000),
(1005,'2024-02-14','C004','Keyboard','Accessories','Pune',1500),
(1006,'2024-03-01','C002','Smartphone','Electronics','Mumbai',30000),
(1007,'2024-03-10','C005','Monitor','Electronics','Hyderabad',12000),
(1008,'2024-03-15','C001','Mouse','Accessories','Delhi',800),
(1009,'2024-04-05','C006','Laptop','Electronics','Chennai',54000),
(1010,'2024-04-18','C002','Headphones','Accessories','Mumbai',2200);

-- Total Revenue
SELECT SUM(sales_amount) AS total_revenue
FROM sales_performance;

-- Monthly Revenue Trend
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales_amount) AS monthly_revenue
FROM sales_performance
GROUP BY month
ORDER BY month;

-- Top Products by Revenue
SELECT 
    product_name,
    SUM(sales_amount) AS total_sales
FROM sales_performance
GROUP BY product_name
ORDER BY total_sales DESC;

-- City-wise Sales Performance
SELECT 
    city,
    SUM(sales_amount) AS city_revenue
FROM sales_performance
GROUP BY city
ORDER BY city_revenue DESC;

-- Repeat Customers
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM sales_performance
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
