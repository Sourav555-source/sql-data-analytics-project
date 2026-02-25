/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

--Explore All Object in the Database

select * from INFORMATION_SCHEMA.TABLES

-- Explore All Columns in the Database

select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'dim_customer'

