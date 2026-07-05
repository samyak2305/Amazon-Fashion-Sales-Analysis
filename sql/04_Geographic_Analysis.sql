-- ==========================================================
-- AMAZON FASHION SALES ANALYSIS
-- FILE: 04_Geographic_Analysis.sql
--
-- Objective:
-- Analyze sales performance across different geographic
-- locations to identify high-performing states and cities
-- based on revenue, order volume, and customer demand.
-- ==========================================================

USE amazon_sales;

-- ----------------------------------------------------------
-- 1. Revenue by State
-- Business Question:
-- Which states generate the highest revenue?
-- ----------------------------------------------------------

SELECT
	`ship-state`,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY `ship-state`
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 2. Orders by State
-- Business Question:
-- Which states place the highest number of customer orders?
-- ----------------------------------------------------------

SELECT
	`ship-state`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM amazon_sales_data
GROUP BY `ship-state`
ORDER BY Total_Orders DESC;

-- ----------------------------------------------------------
-- 3. State Contribution to Total Revenue
-- Business Question:
-- What percentage of total revenue is contributed by each state?
-- ----------------------------------------------------------

SELECT
	`ship-state`,
    ROUND(SUM(Amount),2) AS Revenue,
    ROUND(SUM(Amount) * 100 /
    (SELECT SUM(Amount) FROM amazon_sales_data),
    2
    )AS Revenue_Percentage
FROM amazon_sales_data
GROUP BY `ship-state`
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 4. Top 10 Cities by Revenue
-- Business Question:
-- Which cities generate the highest revenue?
-- ----------------------------------------------------------

SELECT
	`ship-city`,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY `ship-city`
ORDER BY Revenue DESC
LIMIT 10;

-- ----------------------------------------------------------
-- 5. Top 10 Cities by Orders
-- Business Question:
-- Which cities place the highest number of customer orders?
-- ----------------------------------------------------------

SELECT
	`ship-city`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM amazon_sales_data
GROUP BY `ship-city`
ORDER BY Total_Orders DESC
LIMIT 10;

-- ----------------------------------------------------------
-- 6. Average Order Value by State
-- Business Question:
-- Which states have the highest average order value?
-- ----------------------------------------------------------

SELECT
	`ship-state`,
    ROUND(
		SUM(Amount)/
        COUNT(DISTINCT `Order ID`),
        2
	)AS Average_Order_Value
FROM amazon_sales_data
GROUP BY `ship-state`
ORDER BY Average_Order_Value DESC;

-- ----------------------------------------------------------
-- 7. Top 10 Cities by Average Order Value
-- Business Question:
-- Which cities have the highest average customer order value?
-- ----------------------------------------------------------

SELECT
    `ship-city`,
    `ship-state`,
    ROUND(
        SUM(Amount) /
        COUNT(DISTINCT `Order ID`),
        2
    ) AS Average_Order_Value
FROM amazon_sales_data
GROUP BY
    `ship-city`,
    `ship-state`
ORDER BY Average_Order_Value DESC
LIMIT 10;

-- ==========================================================
-- End of File: 04_Geographic_Analysis.sql
-- ==========================================================