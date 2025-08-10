/* 

own notes

*/


-- data cleanup checks

-- check for nulls or duplicates in primary key
-- expection: no results
select 
sls_ord_num,
count(*)
from bronze.crm_sales_details
group by sls_ord_num
having count(*) > 1 or sls_ord_num is null


-- check for unwanted spaces
-- expection: no results
select sls_prd_key
from bronze.crm_sales_details
where sls_prd_key != trim(sls_prd_key)



-- check for data standardization & consistency
-- replace as necessary
select distinct
prd_line
from bronze.crm_prd_info


-- check for null or negative numbers
-- replace as necessary
select 
sls_price
from bronze.crm_sales_details
where sls_price < 0 or sls_price is null


-- check for invalid dates
-- 
select
sls_order_dt,
sls_due_dt
from bronze.crm_sales_details
where sls_order_dt > sls_due_dt


-- check for invalid dates
-- set invalid dates to null using nullif 
select
nullif(sls_due_dt,0)
from bronze.crm_sales_details
where sls_due_dt <= 0 
or len(sls_due_dt) != 8
or sls_due_dt > 20500101
or sls_due_dt < 19000101


-- check for consistency: quantity, price, sales
-- where quantity x price = sales
-- values must not be zero, negative or null

select
sls_sales as old_sls_sales,
sls_quantity as old_sls_quantity,
sls_price as old_sls_price,

case when sls_sales is null or sls_sales <= 0 or sls_sales != sls_quantity * abs(sls_price)
	then sls_quantity * abs(sls_price)
	else sls_sales
end as sls_sales,

sls_quantity as sls_quantity,

case when sls_price is null or sls_price <= 0
	then abs(sls_sales) / nullif(sls_quantity,0)
	else sls_price
end as sls_price

from bronze.crm_sales_details
where sls_sales != sls_quantity*sls_price
or sls_sales <= 0 or sls_quantity <= 0 or sls_price <= 0
or sls_sales is null or sls_quantity is null or sls_price is null
order by sls_sales, sls_quantity, sls_price




select
*
from
silver.crm_cust_info

select
*
from
silver.crm_prd_info

select
*
from
silver.crm_sales_details

select
*
from
silver.erp_cust_az12

select
*
from
silver.erp_loc_a101

select
*
from
silver.erp_px_cat_g1v2
