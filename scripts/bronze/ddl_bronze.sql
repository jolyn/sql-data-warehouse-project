/*

Create tables obtained from sources in database under Bronze schema.

*/

create table bronze.crm_cust_info (
	cst_id int,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50), 
	cst_create_date Date
);

GO

create table bronze.crm_prd_info (
	prd_id Int,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost Int,
	prd_line NVARCHAR(50),
	prd_start_dt DateTime,
	prd_end_dt DateTime
);

GO

create table bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

GO

create table bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate Date,
	gen NVARCHAR(50)
);

GO

create table bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

GO

create table bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
