create and load the data from bigquery public dataset iowa_liquor_sales. size  8.5gb

create table if not exists gcpde04.liquor_sales_data as select * FROM bigquerypublicdata.iowa_liquor_sales.sales



--creating new table with partition  with creation_date cloumn.  
 CREATE TABLE
 gcpde04.liquor_sales_data_partition ( 
invoice_and_item_number STRING,
date DATE,
store_number STRING,
store_name STRING,
address STRING,
city STRING,
zip_code STRING,
store_location GEOGRAPHY,
county_number STRING,
county STRING,
category STRING,
category_name STRING,
vendor_number STRING,
vendor_name STRING,
item_number STRING,
item_description STRING,
pack INTEGER,
bottle_volume_ml INTEGER,
state_bottle_cost FLOAT,
state_bottle_retail FLOAT,
bottles_sold INTEGER,
sale_dollars FLOAT,
volume_sold_liters FLOAT,
volume_sold_gallons FLOAT)
PARTITION BY date
  cluster by store_number,store_name,city;