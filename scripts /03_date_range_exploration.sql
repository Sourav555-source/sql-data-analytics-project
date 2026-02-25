/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Date Exploration

-- Find the date of the first and last order

select 
min(order_date) as first_order,
max(order_date) as last_order,
datediff(year, min(order_date), max(order_date)) as order_range_years
from gold.fact_sales;


-- Find the youngest and oldest customer

select 
min(Birthday) as oldest_customer,
DateDiff(Year, min(Birthday), getdate()) as oldest_cust_age,
DateDiff(Year, max(Birthday), getdate()) as young_cust_age,
max(Birthday) as youngest_customer
from gold.dim_customer;
