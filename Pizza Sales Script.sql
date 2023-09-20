-- KPI Query
select sum(total_price) as total_revenue from pizza_sales;
-- Average Order Revenue
select sum(total_price) / count(distinct order_id) as average_order_revenue from pizza_sales;
-- Total Pizzas Sold
select sum(quantity) as total_pizzas_sold from pizza_sales;
-- Total Pizzas Order
select count(distinct order_id) as total_orders from pizza_sales;
-- Average Pizzas per Order
select sum(quantity) / count(distinct order_id) as average_pizzas_per_order from pizza_sales;
-- Daily Trend per Total Orders
SELECT
    DAYOFWEEK(order_date) AS day_of_week,
    CASE
        WHEN DAYOFWEEK(order_date) = 1 THEN 'Domingo'
        WHEN DAYOFWEEK(order_date) = 2 THEN 'Lunes'
        WHEN DAYOFWEEK(order_date) = 3 THEN 'Martes'
        WHEN DAYOFWEEK(order_date) = 4 THEN 'Miércoles'
        WHEN DAYOFWEEK(order_date) = 5 THEN 'Jueves'
        WHEN DAYOFWEEK(order_date) = 6 THEN 'Viernes'
        WHEN DAYOFWEEK(order_date) = 7 THEN 'Sábado'
    END AS day_name,
    COUNT(*) AS pizzas_sold
FROM
    pizza_sales
GROUP BY
    day_of_week, day_name
ORDER BY
    day_of_week;
-- Hourly Trend per Orders
select hour(order_time) as order_hours , count(distinct order_id) as total_orders from pizza_sales
group by hour(order_time)
order by hour(order_time);
-- Percentage of Sales for Pizza Category
select pizza_category , sum(total_price) as total_sales , sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as total_sales_percentage
from pizza_sales 
group by pizza_category;
-- Percentage of Sales for Pizza Size
select pizza_size , sum(total_price) as total_sales , sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as total_sales_percentage
from pizza_sales 
group by pizza_size;
-- Totals Sold by Pizza Category
select pizza_category , sum(quantity) as total_pizzas_sold from pizza_sales
group by pizza_category;
-- Top 5 Best Sellers by Total Pizzas Sold
select pizza_name , sum(quantity) as Total_Pizzas_Sold from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold desc;
-- Top 5 Worst Sellers by Total Pizzas Sold
select pizza_name , sum(quantity) as Total_Pizzas_Sold from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold asc;










