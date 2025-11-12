select * from mytable;

-- Q1. What are the top-performing stores and product categories?

SELECT store_id, product_category,units_sold
FROM mytable 
GROUP BY store_id, product_category,units_sold 
ORDER BY units_sold DESC;

-- Q2. How do sales vary by city, month, and season?

SELECT city, MONTH(Date) AS Month, seasons,
ROUND(SUM(units_sold), 2) AS Total_Sales,
ROUND(AVG(units_sold), 2) AS Avg_Sales
FROM mytable
GROUP BY city, Month, seasons
ORDER BY city, Month;

-- Q3. Which products are often overstocked or understocked?

select product_category, AVG(inventory_used) as avg_inventory from mytable
group by product_category order by avg_inventory desc;

-- Q4. Which products are often overstocked or understocked?

SELECT
    product_id,
    ROUND(AVG(inventory_available) / AVG(units_sold), 2) AS inventory_to_sales_ratio
FROM
    mytable  
GROUP BY
    product_id
HAVING
    AVG(units_sold) > 0
ORDER BY
    ROUND(inventory_to_sales_ratio,2) DESC
LIMIT 10;

-- Q5. How do discounts and promotions affect total sales?

SELECT
    promotion,
    CASE
        WHEN "discount_(%)" > 0 THEN 'Discounted'
        ELSE 'Not Discounted'
    END AS discount_status,
    AVG(total_sales) AS average_sales,
    COUNT(*) AS number_of_transactions
FROM
    mytable
GROUP BY
    promotion,
    discount_status
ORDER BY
    promotion,
    discount_status;
    
-- Q6. Which city has the highest average transaction value?

SELECT
    city,
    AVG(total_sales) AS average_transaction_value
FROM
    mytable
GROUP BY
    city
ORDER BY
    average_transaction_value DESC
LIMIT 1;

-- Q7. Which products show consistent growth or decline?

WITH DateRange AS (
    -- Find the min, max, and midpoint dates
    SELECT
        MIN(date) AS min_date,
        MAX(date) AS max_date,
        (MIN(date) + (MAX(date) - MIN(date)) / 2) AS mid_point
    FROM
        mytable  -- <-- Corrected table name
),
ProductSales AS (
    -- Calculate sales for each product in each half
    SELECT
        product_id,
        SUM(CASE
                WHEN date < (SELECT mid_point FROM DateRange) THEN total_sales
                ELSE 0
            END) AS first_half_sales,
        SUM(CASE
                WHEN date >= (SELECT mid_point FROM DateRange) THEN total_sales
                ELSE 0
            END) AS second_half_sales
    FROM
        mytable  -- <-- Corrected table name
    GROUP BY
        product_id
)
-- Calculate the final growth/decline percentage
SELECT
    product_id,
    first_half_sales,
    second_half_sales,
    (second_half_sales - first_half_sales) / first_half_sales AS growth_percentage
FROM
    ProductSales  -- <-- Corrected: Select from the CTE
WHERE
    first_half_sales > 0 -- Ensure we don't divide by zero
ORDER BY
    growth_percentage DESC;
    
-- Q8. Are there any correlations between temperature, holidays and sales?

SELECT
    holiday,
    FLOOR(temperature / 10) * 10 AS temperature_bucket,
    AVG(total_sales) AS average_sales,
    SUM(total_sales) AS total_sales,
    COUNT(*) AS num_transactions
FROM
    mytable
GROUP BY
    holiday,
    temperature_bucket
ORDER BY
    holiday,
    temperature_bucket;