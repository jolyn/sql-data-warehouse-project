/*
Create tables in database under Bronze schema, with in accordance to obtained sources.
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
	prd_start_dt Date,
	prd_end_dt Date
);

GO

create table bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt Date,
	sls_ship_dt Date,
	sls_due_dt Date,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

GO

create table bronze.erp_CUST_AZ12 (
	CID NVARCHAR(50),
	BDATE Date,
	GEN NVARCHAR(50)
);

GO

create table bronze.erp_LOC_A101 (
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50)
);

GO

create table bronze.erp_PX_CAT_G1V2 (
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
);
