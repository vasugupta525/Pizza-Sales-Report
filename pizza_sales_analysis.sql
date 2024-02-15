use pizza_sales_dataset;

select * from pizza_sales;

select count(*) from pizza_sales;

-- Total Revenue:
SELECT Round(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;


-- Average Order Value:
SELECT Round((SUM(total_price) / COUNT(DISTINCT order_id)),2) AS Avg_order_Value FROM pizza_sales;


-- Total Pizzas Sold:
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;


-- Total Orders Count:
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;


-- Average Pizzas Per Order:
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;


-- %ge of Sales by Pizza Revenue:
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS percentage
FROM pizza_sales
GROUP BY pizza_category;


-- %ge of Sales by Pizza Size:
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


-- Total Pizzas Sold by Pizza Category:
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;


-- Top 5 Pizzas by Revenue:
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5; 


-- Bottom 5 Pizzas by Revenue:
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;


-- Top 5 Pizzas by Quantity:
SELECT pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;


-- Bottom 5 Pizzas by Quantity:
SELECT pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


-- Top 5 Pizzas by Total Orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;


-- Bottom 5 Pizzas by Total Orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;