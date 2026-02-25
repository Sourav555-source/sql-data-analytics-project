/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

- Measures Exploration

/* Calculate the key metric of the Business (Big Numbers)
** Highest Level of Aggregation ** Lowest Level of Details

*/

-- Find the total Sales
select 
sum(sales_amount) as total_sales
from gold.fact_sales;

-- Find how many items are sold
select 
sum(Quantity) as total_quantity
from gold.fact_sales;


-- Find the average selling price
select
avg(price) as avg_of_selling
from gold.fact_sales;


-- Find the total number of orders

select
count(order_number) as total_orders,
count(distinct(order_number))as Total_orders
from gold.fact_sales;


-- Find the total number of products
select 
count(product_key) as total_product
from gold.dim_products
select 
count(distinct(product_key))as totalproduct
from gold.dim_products;


-- Find the total number of customers
select count(distinct(customer_id))as total_customer
from gold.dim_customer;


-- Find the total number of customers that has placed an order
select count(customer_key) as total_custoemrs from gold.Fact_sales


-- Generate a Report that shows all key metrics of the business
select 'Total Sales' as Measure_name,Sum(sales_amount) as measure_value from gold.fact_sales
union all
select 'Total Quantity',sum(quantity) from gold.fact_sales
union all
select'Average Price', avg(price) from gold.fact_sales
union all
select 'Total Orders', count(Distinct  Order_number) from gold.fact_sales
union all
select 'Total Products', Count(distinct product_name) from gold.dim_products
union all
select 'Total Customers',count(customer_key) from gold.dim_customer
;
