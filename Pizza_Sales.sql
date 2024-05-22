-- View pizza_sales table
SELECT * FROM pizza_sales
-- There are 48620 rows and 11 columns

-- Total revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

-- There are approximately 817860.05 of the total price of pizza order

-- Total number of order
SELECT * FROM pizza_sales
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

-- There are 38.30 total number of order

-- Total pizza sold
SELECT * FROM pizza_sales
SELECT SUM(quantity) AS Total_Pizza FROM pizza_sales

-- 49574 pizzas sold

-- Total order
SELECT * FROM pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales

-- There were 21350 total orders

--Average Pizzas per order
SELECT * FROM pizza_sales
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Avg_Pizza_Order FROM  pizza_sales

-- There are 2.32 Average Pizzas per order

-- Daily trend for Total orders
SELECT * FROM pizza_sales
SELECT DATENAME(DW, Order_date) AS Daily_Order, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(DW, Order_date)

-- Daily trend for Total orders
SELECT * FROM pizza_sales
SELECT DATEPART(HOUR, Order_time) AS Hourly_Order, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATEPART(HOUR, Order_time)
ORDER BY DATEPART(HOUR, Order_time)

-- Change pizza_categorry column name
EXEC sp_RENAME '[dbo].[pizza_sales].[pizza_categorry]', 'pizza_category', 'COLUMN';

-- Percentage of sales by pizza category
SELECT * FROM pizza_sales
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category
/*Here MONTH(order_date) = 1 indicates that the output is for the month of January*/

-- Percentage of sales by pizza size
SELECT * FROM pizza_sales
SELECT pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS PCT
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1 
GROUP BY pizza_size
ORDER BY PCT DESC

-- Total pizza sold by pizza category
SELECT * FROM pizza_sales
SELECT pizza_category, sum(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_category

-- Top 5 best sellers pizza
SELECT * FROM pizza_sales
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity)DESC

-- 5 bottom sellers pizza

SELECT * FROM pizza_sales
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC

-- That is the end of the data cleaning and analysis section of this pizza sales study
-- Data visualization will be carried out using Excel