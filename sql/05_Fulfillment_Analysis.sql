-- ==========================================================
-- AMAZON FASHION SALES ANALYSIS
-- FILE: 05_Fulfillment_Analysis.sql
--
-- Objective:
-- Analyze fulfillment operations, courier performance,
-- and order statuses to evaluate operational efficiency
-- and identify areas for process improvement.
-- ==========================================================

USE amazon_sales;

-- ----------------------------------------------------------
-- 1. Revenue by Fulfillment Method
-- Business Question:
-- Which fulfillment method generates the highest revenue?
-- ----------------------------------------------------------

SELECT
	Fulfilment,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Fulfilment
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 2. Fulfillment Revenue Contribution
-- Business Question:
-- What percentage of total revenue is contributed by each
-- fulfillment method?
-- ----------------------------------------------------------

SELECT
	Fulfilment,
    ROUND(SUM(Amount),2) AS Revenue,
    ROUND(
		SUM(Amount) * 100 /
        (SELECT SUM(Amount) FROM amazon_sales_data),
        2
	) AS Revenue_Percentage
FROM amazon_sales_data
GROUP BY Fulfilment
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 3. Order Status Distribution
-- Business Question:
-- How are customer orders distributed across different
-- order statuses?
-- ----------------------------------------------------------

SELECT
	Status,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Status
ORDER BY Revenue DESC;

-- ----------------------------------------------------------
-- 4. Courier Status Distribution
-- Business Question:
-- How are orders distributed across courier statuses?
-- ----------------------------------------------------------

SELECT
	`Courier Status`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(
		COUNT(DISTINCT `Order ID`) * 100 /
        (SELECT COUNT(DISTINCT `Order ID`) FROM amazon_sales_data),
        2
    ) AS Order_Percentage
FROM amazon_sales_data
GROUP BY `Courier Status`
ORDER BY Total_Orders DESC;

-- ----------------------------------------------------------
-- 5. Cancellation Rate
-- Business Question:
-- What percentage of customer orders were cancelled?
-- ----------------------------------------------------------

SELECT
	ROUND(
		COUNT(
			DISTINCT CASE
				WHEN Status = 'Cancelled'
				THEN `Order ID`
			END
		) * 100 /
		COUNT(DISTINCT `Order ID`),
		2
    ) AS Cancellation_Rate
FROM amazon_sales_data;

-- ----------------------------------------------------------
-- 6. Cancellation by Fulfillment Method
-- Business Question:
-- Which fulfillment method experiences more cancellations?
-- ----------------------------------------------------------

SELECT
	Fulfilment,
    COUNT(DISTINCT CASE
			WHEN Status = 'Cancelled'
			THEN `Order ID`
		END
	) AS Cancelled_Orders,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
	ROUND(
		COUNT(
			DISTINCT CASE
				WHEN Status = 'Cancelled'
				THEN `Order ID`
			END
		) * 100 /
		COUNT(DISTINCT `Order ID`),
		2
	) AS Cancellation_Rate
FROM amazon_sales_data
GROUP BY  Fulfilment;

-- ----------------------------------------------------------
-- 7. Shipping Service Level Analysis
-- Business Question:
-- Which shipping service level is most frequently used?
-- ----------------------------------------------------------

SELECT
    `ship-service-level`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Qty) AS Units_Sold,
    ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY `ship-service-level`
ORDER BY Revenue DESC;


-- ----------------------------------------------------------
-- 8. Revenue Lost Due to Cancellations
-- Business Question:
-- How much revenue was lost due to cancelled orders?
-- ----------------------------------------------------------


SELECT
	ROUND(SUM(Amount),2) AS Cancelled_Revenue
FROM amazon_sales_data
WHERE Status = 'Cancelled';


-- ==========================================================
-- End of File: 05_Fulfillment_Analysis.sql
-- ==========================================================