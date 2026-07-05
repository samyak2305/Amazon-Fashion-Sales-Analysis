-- ==========================================================
-- AMAZON FASHION SALES ANALYSIS
-- FILE: 01_KPI_Queries.sql
--
-- Objective:
-- Calculate key business performance indicators (KPIs)
-- to evaluate overall sales performance.
-- ==========================================================

USE amazon_sales;

-- ----------------------------------------------------------
-- KPI 1: Total Orders
-- Business Question:
-- How many unique customer orders were placed?
-- ----------------------------------------------------------

SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 2: Total Revenue
-- Business Question:
-- What is the total revenue generated from all orders?
-- ----------------------------------------------------------

SELECT ROUND(SUM(Amount),2) AS Total_Revenue
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 3: Total Units Sold
-- Business Question:
-- How many product units were sold?
-- ----------------------------------------------------------

SELECT SUM(Qty) AS Units_Sold
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 4: Total Product Categories
-- Business Question:
-- How many unique product categories are available?
-- ----------------------------------------------------------

SELECT COUNT(DISTINCT Category) AS Total_Categories
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 5: Geographic Coverage
-- Business Question:
-- In how many states were orders shipped?
-- ----------------------------------------------------------

SELECT COUNT(DISTINCT `ship-state`) AS Total_States
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 6: Total Product Styles
-- Business Question:
-- How many unique product styles are present?
-- ----------------------------------------------------------

SELECT COUNT(DISTINCT Style) AS Total_Styles
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- KPI 7: Average Order Value (AOV)
-- Business Question:
-- What is the average value of a customer order?
-- ----------------------------------------------------------

SELECT
    ROUND(AVG(Order_Total),2) AS Average_Order_Value
FROM
(
    SELECT
        `Order ID`,
        SUM(Amount) AS Order_Total
    FROM amazon_sales_data
    GROUP BY `Order ID`
) AS OrderTotals;

-- ==========================================================
-- End of KPI Queries
-- ==========================================================