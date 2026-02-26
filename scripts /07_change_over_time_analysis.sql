/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions

select 
year(Order_date) as order_Year,
month(order_date) as order_month,
count(distinct Customer_key) as total_customers,
sum(sales_amount) as total_revenue,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by YEAR(order_date),month(order_date)
order by YEAR(order_date),month(order_date);


-- DATETRUNC

SELECT
datetrunc(MONTH,order_date) as orderdate,
count(distinct Customer_key) as total_customers,
sum(sales_amount) as total_revenue,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by datetrunc(MONTH,order_date);

-- Format

select
Format(order_date,'yyyy-MMM') as order_date,
count(distinct Customer_key) as total_customers,
sum(sales_amount) as total_revenue,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by Format(order_date,'yyyy-MMM');

