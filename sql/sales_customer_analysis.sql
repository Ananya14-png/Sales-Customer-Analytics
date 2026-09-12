USE sales_customer_analysis;
SELECT COUNT(*) FROM orders;
LOAD DATA LOCAL INFILE 'C:/Users/anany/Downloads/sales_customer_analysis_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
USE sales_customer_analysis;
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT order_id) AS unique_orders,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM orders;
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY category
ORDER BY total_profit DESC;
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY sub_category
ORDER BY total_profit DESC;
SELECT
    discount,
    ROUND(AVG(profit), 2) AS average_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY discount
ORDER BY discount;
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY region
ORDER BY total_profit DESC;
SELECT
    state_province,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
    
FROM orders
GROUP BY state_province
ORDER BY total_profit ASC
LIMIT 10;
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
WHERE state_province = 'Texas'
GROUP BY category
ORDER BY total_profit ASC;
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
WHERE state_province = 'Texas'
  AND category = 'Office Supplies'
GROUP BY sub_category
ORDER BY total_profit ASC;
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount) * 100, 2) AS avg_discount
FROM orders
WHERE state_province = 'Texas'
  AND category = 'Office Supplies'
  AND sub_category = 'Binders'
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY customer_name
ORDER BY total_profit ASC
LIMIT 10;
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY segment
ORDER BY total_profit DESC;
SELECT
    YEAR(order_date) AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
SELECT
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY ship_mode
ORDER BY total_profit DESC;
SELECT
    region,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY region, category
ORDER BY region, total_profit ASC;
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY product_name, category, sub_category
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY product_name, category, sub_category
ORDER BY total_profit ASC
LIMIT 10;
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC
LIMIT 10;
SELECT
    discount,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS average_profit
FROM orders
GROUP BY discount
ORDER BY discount;
SELECT
    quantity,
    COUNT(*) AS transaction_count,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS average_profit
FROM orders
GROUP BY quantity
ORDER BY quantity;
SELECT
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY total_sales DESC;
WITH yearly AS (
    SELECT
        YEAR(order_date) AS year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY YEAR(order_date)
)
SELECT
    year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY year))
        / LAG(total_sales) OVER (ORDER BY year) * 100,
        2
    ) AS sales_growth_pct,
    ROUND(
        (total_profit - LAG(total_profit) OVER (ORDER BY year))
        / LAG(total_profit) OVER (ORDER BY year) * 100,
        2
    ) AS profit_growth_pct
FROM yearly
ORDER BY year;
WITH yearly AS (
    SELECT
        YEAR(order_date) AS year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM orders
    GROUP BY YEAR(order_date)
)
SELECT
    year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY year))
        / LAG(total_sales) OVER (ORDER BY year) * 100,
        2
    ) AS sales_growth_pct,
    ROUND(
        (total_profit - LAG(total_profit) OVER (ORDER BY year))
        / LAG(total_profit) OVER (ORDER BY year) * 100,
        2
    ) AS profit_growth_pct
FROM yearly
ORDER BY year;
SELECT
    YEAR(order_date) AS year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;
SELECT
    YEAR(order_date) AS year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;
SELECT
    state_province,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY state_province
ORDER BY total_profit DESC
LIMIT 10;
SELECT
    region,
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY region, ship_mode
ORDER BY region, total_profit DESC;
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY year, month;
SELECT
    region,
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY region, segment
ORDER BY region, total_profit DESC;
SELECT
    segment,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY segment, category
ORDER BY segment, total_profit DESC;
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY customer_name
HAVING SUM(sales) > 1000
ORDER BY profit_margin DESC
LIMIT 10;
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 20;
SELECT
    category,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM orders
GROUP BY category
ORDER BY avg_discount_pct DESC;
