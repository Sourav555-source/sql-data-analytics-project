
/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/



-- Which 5 products Generating the Highest Revenue?

Select top 5
product_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
left join gold.dim_products as p
on f.product_key = p.Product_key
group by product_name
order by total_revenue desc

-- Complex but Flexibly Ranking Using Window Functions
with rank_wise as(
select
product_name,
sum(f.sales_amount) as total_revenue,
rank() over (order by sum(f.sales_amount) desc) rank_product
from gold.fact_sales as f
left join gold.dim_products as p
on f.product_key = p.Product_key
group by product_name)

select  top 5 *
from rank_wise;


-- What are the 5 worst-performing products in terms of sales?
select top 5
product_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales as f
left join gold.dim_products as p
on f.product_key = p.Product_key
group by product_name
order by total_revenue asc


-- Find the top 10 customers who have generated the highest revenue
select top 10
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold.dim_customer as c
left join gold.fact_sales as f
on c.customer_key = f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by total_revenue desc;


-- The 3 customers with the fewest orders placed

select top 3
c.customer_key,
c.first_name,
c.last_name,
count(DISTINCT order_number) as total_orders
from  gold.fact_sales as f
left join gold.dim_customer as c
on c.customer_key = f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by total_orders 
