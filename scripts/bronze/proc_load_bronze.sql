/*

Stored Procedure:
	Load Bronze Layer (Source -> Bronze)

Usage Example:
	exec bronze.load_bronze;
*/

create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time DATETIME, @batch_end_time DATETIME;
	begin try
		set @batch_start_time = GETDATE();
		print '=============================';
		print 'Loading Bronze Layer';
		print '=============================';

		print '-----------------------------';
		print 'Loading CRM Tables';
		print '-----------------------------';

		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.crm_cust_info';
		Truncate table bronze.crm_cust_info;

		print '>> Inserting Data Into: bronze.crm_cust_info'
		BULK insert bronze.crm_cust_info
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		
		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.crm_prd_info';
		Truncate table bronze.crm_prd_info;

		print '>> Inserting Data Into: bronze.crm_prd_info'
		BULK insert bronze.crm_prd_info
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		
		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.crm_sales_details';
		Truncate table bronze.crm_sales_details;

		print '>> Inserting Data Into: bronze.crm_sales_details'
		BULK insert bronze.crm_sales_details
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';

		print '-----------------------------';
		print 'Loading ERP Tables';
		print '-----------------------------';
		
		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.erp_CUST_AZ12';
		Truncate table bronze.erp_CUST_AZ12;

		print '>> Inserting Data Into: bronze.erp_CUST_AZ12'
		BULK insert bronze.erp_CUST_AZ12
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		
		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.erp_LOC_A101';
		Truncate table bronze.erp_LOC_A101;

		print '>> Inserting Data Into: bronze.erp_LOC_A101'
		BULK insert bronze.erp_LOC_A101
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		
		print '-----------';
		set @start_time = GETDATE();
		print '>> Truncating Table: bronze.erp_PX_CAT_G1V2';
		Truncate table bronze.erp_PX_CAT_G1V2;

		print '>> Inserting Data Into: bronze.erp_PX_CAT_G1V2'
		BULK insert bronze.erp_PX_CAT_G1V2
		From 'C:\Users\Abdul.Rahmaan\Downloads\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		with(
			firstrow=2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DateDiff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '-----------';
		
		set @batch_end_time = GETDATE()
		print '======================================';
		print 'Loading Bronze Layer is Completed';
		print '- Total Load Duration: ' + cast(DateDiff(second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds';
		print '======================================';

	end try
	begin catch
		print '==========================================';
		print 'Error Occurred During Loading Bronze Layer';
		print 'Error Message' + Error_Message();
		print 'Error Message' + Cast (Error_Number() as Nvarchar);
		print 'Error Message' + Cast (Error_State() as Nvarchar);
		print '==========================================';
	end catch
end
