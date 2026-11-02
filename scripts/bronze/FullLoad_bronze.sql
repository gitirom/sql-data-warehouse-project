/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

-- BULK INSERT : => used to Loads large datasets from external src's csv...
-- => commonly used during the Bronze Layer ingestion process of a Data Warehouse.
===============================================================================
*/

/*
- if you run this command twice it gone load the file twice and this is so bad 
-> so we need to make the tab empty(** Truncate **) then load (** INSERT **)
*/

USE Datawarehouse;
GO 


-- FULL LOAD  crm_cust_info tab

PRINT '>> Inserting Data Into: bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;
GO

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    TABLOCK
);
GO

SELECT COUNT(*) FROM bronze.crm_cust_info;

-- FULL LOAD  crm_prd_info tab

PRINT '>> Inserting Data Into: bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;
GO

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

SELECT COUNT(*) FROM bronze.crm_prd_info;

-- FULL LOAD  crm_sales_details tab

PRINT '>> Inserting Data Into: bronze.sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
GO

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

SELECT COUNT(*) FROM bronze.crm_sales_details;


-- FULL LOAD  erp_loc_a101 tab

PRINT '>> Truncating Table: bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;
GO

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

SELECT COUNT(*) FROM bronze.erp_loc_a101;

-- FULL LOAD  erp_cust_az12 tab

PRINT '>> Truncating Table: bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
GO

BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

SELECT COUNT(*) FROM bronze.erp_cust_az12;

-- FULL LOAD  erp_px_cat_g1v2 tab

PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
GO

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\dell\OneDrive\Documents\Data_Projects\SQL_data_warehouse\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;







