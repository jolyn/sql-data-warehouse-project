
-- data cleanup checks

-- check for nulls or duplicates in primary key
-- expection: no results
select 
cst_id,
count(*)
from bronze.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null


-- check for unwanted spaces
select cst_firstname
from bronze.crm_cust_info
where cst_firstname != trim(cst_firstname)



-- check for data standardization & consistency
select distinct
cst_marital_status
from
bronze.crm_cust_info
