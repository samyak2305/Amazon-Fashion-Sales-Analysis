-- ==========================================================
-- AMAZON FASHION SALES ANALYSIS
-- FILE: 03_Product_Analysis.sql
--
-- Objective:
-- Analyze product performance to identify the highest
-- performing categories, styles, sizes, and SKUs based on
-- revenue, sales volume, and customer demand.
-- ==========================================================

USE amazon_sales;

-- ----------------------------------------------------------
-- 1. Category-wise Revenue
-- Business Question:
-- Which product categories generate the highest revenue?
-- ----------------------------------------------------------

SELECT
	Category,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Category
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 2. Category-wise Units Sold
-- Business Question:
-- Which product categories sell the most units?
-- ----------------------------------------------------------

SELECT
	Category,
    SUM(Qty) AS Units_Sold
FROM amazon_sales_data
GROUP BY Category
ORDER BY Units_Sold DESC;

-- ----------------------------------------------------------
-- 3. Top 10 Product Styles
-- Business Question:
-- Which product styles generate the highest revenue?
-- ----------------------------------------------------------

SELECT
	Style,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Style
ORDER BY Revenue DESC
LIMIT 10;

-- ----------------------------------------------------------
-- 4. Size-wise Demand
-- Business Question:
-- Which clothing sizes are most popular?
-- ----------------------------------------------------------

SELECT
	Size,
    SUM(Qty) AS Units_Sold
FROM amazon_sales_data
GROUP BY Size
ORDER BY Units_Sold DESC;

-- ----------------------------------------------------------
-- 5. Top 10 Products (SKU)
-- Business Question:
-- Which individual products generate the highest revenue?
-- ----------------------------------------------------------

SELECT
	SKU,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY SKU
ORDER BY Revenue DESC
LIMIT 10;

-- ----------------------------------------------------------
-- 6. Average Selling Price by Category
-- Business Question:
-- Which product categories have the highest average selling price?
-- ----------------------------------------------------------

SELECT
	Category,
    ROUND(SUM(Amount)/SUM(Qty),2) AS Average_Selling_Price
FROM amazon_sales_data
GROUP BY Category
ORDER BY Average_Selling_Price DESC;

-- ----------------------------------------------------------
-- 7. Top 10 Categories by Average Selling Price
-- Business Question:
-- Which premium product categories have the highest average
-- selling price?
-- ----------------------------------------------------------

SELECT
    Category,
    ROUND(SUM(Amount)/SUM(Qty),2) AS Average_Selling_Price
FROM amazon_sales_data
GROUP BY Category
ORDER BY Average_Selling_Price DESC
LIMIT 10;


-- ----------------------------------------------------------
-- 8. Category Contribution to Total Revenue
-- Business Question:
-- What percentage of the company's total revenue is contributed
-- by each product category?
-- ----------------------------------------------------------

SELECT
    Category,
    ROUND(SUM(Amount),2) AS Revenue,
    ROUND(
        SUM(Amount) * 100 /
        (SELECT SUM(Amount) FROM amazon_sales_data),
        2
    ) AS Revenue_Percentage
FROM amazon_sales_data
GROUP BY Category
ORDER BY Revenue DESC;

-- ==========================================================
-- End of File: 03_Product_Analysis.sql
-- ==========================================================