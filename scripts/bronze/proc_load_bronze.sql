/*
	to use procedure
	exec bronze.load_bronze
*/


create or alter procedure bronze.load_bronze as
begin
	/*

	bulk load data from csv into respective tables

	*/


	--empty table
	truncate table bronze.crm_cust_info;

	--bulk load from csv
	bulk insert bronze.crm_cust_info
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
	-- firstrow starts at Row 2, ignoring header
	firstrow = 2,
	-- symbol separating data
	fieldterminator = ',',
	-- lock table while loading 
	tablock
	);

	--empty table
	truncate table bronze.crm_prd_info;

	--bulk load from csv
	bulk insert bronze.crm_prd_info
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);

	--empty table
	truncate table bronze.crm_sales_details;

	--bulk load from csv
	bulk insert bronze.crm_sales_details
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);

	--empty table
	truncate table bronze.erp_cust_az12;

	--bulk load from csv
	bulk insert bronze.erp_cust_az12
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);

	--empty table
	truncate table bronze.erp_loc_a101;

	--bulk load from csv
	bulk insert bronze.erp_loc_a101
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);

	--empty table
	truncate table bronze.erp_px_cat_g1v2;

	--bulk load from csv
	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\jolyn\Desktop\Baraa Course\SQL Course\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
end
