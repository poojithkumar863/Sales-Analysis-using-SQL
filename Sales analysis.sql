-- SQL Queries on project sales analysis

create database project;   -- creating a database named 'project'

-- import dataset

select * from da_sales;  -- display table



-- 1) Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
SELECT 
    *
FROM
    da_sales
WHERE
    ship_mode = 'Economy'
        AND total_amount > 25000;



-- 2) Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
SELECT 
    *
FROM
    da_sales
WHERE
    Category = 'Technology'
        AND Country = 'Ireland'
        AND Order_Date > '2020-01-01';
        
        
        
-- 3) List the top 10 most profitable sales transactions in descending order.
SELECT 
    *, unit_profit * sold_quantity AS net_profit
FROM
    da_sales
ORDER BY net_profit DESC
LIMIT 10;



-- 4) Find all customers whose name starts with 'J' and ends with 'n'.
SELECT 
    *
FROM
    da_sales
WHERE
    customer_name LIKE 'j%n';
    
    
    
-- 5) Retrieve all product names that contain 'Acco' anywhere in the name
SELECT 
    product_name
FROM
    da_sales
WHERE
    product_name LIKE '%acco%';
    
    
    
-- 6) Get the top 5 cities with the highest total sales amount.
SELECT 
    city, SUM(Total_amount) AS total_sales_amt
FROM
    da_sales
GROUP BY city
ORDER BY total_sales_amt DESC
LIMIT 5;



-- 7) Find the total revenue, average unit cost, and total number of orders.
SELECT 
    SUM(total_amount) AS total_revenue,
    AVG(unit_cost) AS average_unitcost,
    COUNT(order_id) AS total_orders
FROM
    da_sales;



-- 8) Get total sales per product category.
SELECT 
    category, SUM(total_amount) AS total_sales
FROM
    da_sales
GROUP BY category;



-- 9) Get customers who have placed orders worth more than ₹50,000.
SELECT 
    Customer_Name, SUM(Total_Amount) AS Customer_Total
FROM
    da_sales
GROUP BY Customer_Name
HAVING SUM(Total_Amount) > 50000;



-- 10) Find the top 5 customers by sales revenue using DENSE_RANK ()
 SELECT Customer_Name,SUM(Total_Amount) AS Total_Sales, 
DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Rnk
FROM sales
GROUP BY Customer_Name
order by rnk
limit 5;
