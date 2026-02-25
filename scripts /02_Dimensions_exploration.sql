
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/


/* Identifying the unique values (or categories) in each dimension.
	Recognizing how data might be grouped or segmented which is useful
	for late analysis.. */
	

-- Explore All countries our customers come from

select distinct country from gold.dim_customer;


-- Explore All categories "The Major Divisions"

select distinct category,
subcategory,
product_name
from gold.dim_products;

