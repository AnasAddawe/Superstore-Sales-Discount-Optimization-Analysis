-- PROJECT: Superstore Sales Performance & Discount Optimization Analysis
-- Anas Addawe
-- PURPOSE: Extract business intelligence insights regarding profit margins, 
--          discount leakages and customer retention.
-- Query 1, High discount products

---- Purpose: Filters for orders with >40% discounts that managed to stay close 
--          to breaking even (profit greater than -10).

SELECT `Product Name`, `Sub-Category`, `discount`, `profit`
FROM `sample - superstore`
WHERE discount > 0.4 AND profit > -10
ORDER BY profit DESC;

-- QUERY 2: Unprofitable Products Search
-- Purpose: Identifies individual product transactions that resulted in a 
--          financial loss (profit below -1).

select `Product Name`, profit
from `sample - superstore`
where profit< -1 ;


-- QUERY 3: Total Revenue Lost from Discounts by Sub-Category
-- Purpose: Calculates the "ghost money" given away in discounts grouped by Sub-Category.

SELECT 
   `Sub-Category`, 
    SUM((`sales` / (1 - `discount`)) - `sales`) AS total_discount_loss
FROM `sample - superstore`
GROUP BY `Sub-Category`
ORDER BY total_discount_loss DESC;

-- QUERY 4: Geographic Discount Bias
-- Purpose: Determines which geographical regions receive the highest average 
--          discount rates compared to their total sales volume.

SELECT 
    `region`, 
    AVG(`discount`) AS avg_discount,
    SUM(`sales`) AS total_sales
FROM `sample - superstore`
GROUP BY `region`
ORDER BY avg_discount DESC;

-- QUERY 5: Financial Impact of Aggressive Discounting (>40%)
-- Purpose: Aggregates total revenue lost, actual profit remaining, and order 
--          volume for transactions heavily discounted above 40%

SELECT 
    SUM((`sales` / (1 - `discount`)) - `sales`) AS total_lost_revenue,
    SUM(`profit`) AS actual_profit_remaining,
    COUNT(*) AS high_discount_order_count
FROM `sample - superstore`
WHERE `discount` > 0.4;

-- QUERY 6: Monthly Revenue Trends (Time-Series)
-- Purpose: Converts text-based order dates to a unified date format to 
--          track month-over-month total revenue and identify seasonal peaks.


SELECT 
    DATE_FORMAT(STR_TO_DATE(`order date`, '%d/%m/%Y'), '%Y-%m') AS order_month, 
    SUM(sales) AS total_revenue
FROM `sample - superstore`
WHERE STR_TO_DATE(`order date`, '%d/%m/%Y') IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

-- QUERY 7: Average Order Count Per Customer
-- Purpose: Uses a subquery to calculate the frequency baseline of how many 
--          orders a unique customer places on average.

SELECT AVG(order_counts) AS average_orders_per_customer
FROM (
    SELECT `customer id`, COUNT(*) AS order_counts
    
    FROM `sample - superstore`
    GROUP BY `customer id`
) AS customer_totals;

-- QUERY 8: Repeat vs. One-Time Buyer Segmentation
-- Purpose: Categorizes customer profiles to compare the total count and 
--          revenue contributions of loyal repeat buyers vs. single-purchase buyers.

SELECT 
    CASE 
        WHEN order_count > 1 THEN 'Repeat Buyer'
        ELSE 'One-Time Buyer'
    END AS buyer_type,
    COUNT(*) AS total_customers,
    SUM(total_spent) AS total_revenue
FROM (
    SELECT 
        `customer name`, 
        COUNT(DISTINCT `order id`) AS order_count,
        SUM(`sales`) AS total_spent
    FROM `sample - superstore`
    GROUP BY `customer name`
) AS customer_profile
GROUP BY buyer_type;

-- QUERY 9: Top 10 Most Profitable Products
-- Purpose: Highlights the true "superstars" of the inventory by listing the 
--          top 10 items based on cumulative net profit, not just top-line revenue.

SELECT 
    `product name`, 
    SUM(`sales`) AS total_revenue,
    SUM(`profit`) AS total_profit
FROM `sample - superstore`
GROUP BY `product name`
ORDER BY total_profit DESC
LIMIT 10;

-- QUERY 10: The "Discount Trap" — High Volume, Zero/Negative Profit Products
-- Purpose: Uncovers high-performing revenue items ($5K+) that yield zero or 
--          negative net profits due to aggressive average discount rates.

SELECT 
    `product name`,
    `sub-category`,
    COUNT(*) AS total_orders_sold,
    SUM(`sales`) AS total_revenue,
    SUM(`profit`) AS total_profit,
    AVG(`discount`) AS average_discount_given
FROM `sample - superstore`
GROUP BY `product name`, `sub-category`
HAVING total_revenue > 5000 AND total_profit <= 0
ORDER BY total_revenue DESC;

-- QUERY 11: Profit by Discount Tier
-- Purpose: Shows exactly at which discount threshold profitability collapses.

SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.1 THEN 'Up to 10%'
        WHEN discount <= 0.2 THEN '10–20%'
        WHEN discount <= 0.3 THEN '20–30%'
        WHEN discount <= 0.4 THEN '30–40%'
        ELSE 'Above 40%'
    END AS discount_tier,
    COUNT(*) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit), 2) AS total_profit
FROM `sample - superstore`
GROUP BY discount_tier
ORDER BY MIN(discount);