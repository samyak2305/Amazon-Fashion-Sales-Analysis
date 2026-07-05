-- ==========================================================
-- AMAZON FASHION SALES ANALYSIS
-- FILE: 02_Sales_Analysis.sql
--
-- Objective:
-- Analyze sales performance over time by examining revenue,
-- order volume, units sold, and customer purchasing behavior
-- to identify trends and business insights.
-- ==========================================================

USE amazon_sales;

-- ----------------------------------------------------------
-- 1. Monthly Revenue Trend
-- Business Question:
-- How has the company's revenue changed month by month?
-- ----------------------------------------------------------

SELECT Year,Month_Num,Month,ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Year,Month_Num,Month
order by Year,Month_Num;

-- ----------------------------------------------------------
-- 2. Monthly Order Trend
-- Business Question:
-- How has the number of customer orders changed each month?
-- ----------------------------------------------------------

SELECT Year,Month_Num,Month,COUNT(DISTINCT `Order ID`) AS Orders
FROM amazon_sales_data
GROUP BY Year,Month_Num,Month
order by Year,Month_Num;

-- ----------------------------------------------------------
-- 3. Monthly Units Sold
-- Business Question:
-- How many products were sold each month?
-- ----------------------------------------------------------

SELECT Year,Month_Num,Month,SUM(Qty) AS Units_Sold
FROM amazon_sales_data
GROUP BY Year,Month_Num,Month
order by Year,Month_Num;

-- ----------------------------------------------------------
-- 4. Average Order Value (AOV)
-- Business Question:
-- What is the average value of a customer order each month?
-- ----------------------------------------------------------

SELECT Year,Month_Num,Month,ROUND(SUM(Amount) / COUNT(DISTINCT `Order ID`),2) AS Average_Order_Value
FROM amazon_sales_data
GROUP BY Year,Month_Num,Month
order by Year,Month_Num;

-- ----------------------------------------------------------
-- 5. Revenue by Weekday
-- Business Question:
-- Which day of the week generates the highest revenue?
-- ----------------------------------------------------------

SELECT Weekday, ROUND(SUM(Amount),2) AS Revenue
from amazon_sales_data
GROUP BY Weekday
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 6. Orders by Weekday
-- Business Question:
-- Which day of the week receives the highest number of orders?
-- ----------------------------------------------------------

SELECT Weekday, COUNT(DISTINCT `Order ID`) AS Orders
from amazon_sales_data
GROUP BY Weekday
ORDER BY Orders DESC;

-- ----------------------------------------------------------
-- 7. Revenue by Order Status
-- Business Question:
-- How is revenue distributed across different order statuses?
-- ----------------------------------------------------------

SELECT
    Status,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Status
ORDER BY Revenue DESC;

-- ==========================================================
-- End of File: 02_Sales_Analysis.sql
-- ==========================================================