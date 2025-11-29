\echo '============================================================'
\echo '        BRONZE DATA LOAD - STARTING (LOCAL ETL RUN)'
\echo '============================================================'
\echo ''
\echo 'Target Database: :datawarehouse'
\echo 'Started at:      ' `date`
\echo ''

\c datawarehouse;

\echo '------------------------------------------------------------'
\echo 'Loading CRM SOURCE DATA into bronze...'
\echo '------------------------------------------------------------'
\echo ''

-- CRM Source Data

\echo '[CRM] Loading crm_cust_info...'
\echo ' - Truncating bronze.crm_cust_info'
TRUNCATE TABLE bronze.crm_cust_info;
\echo ' - Copying from datasets/source_crm/cust_info.csv'
COPY bronze.crm_cust_info
FROM 'datasets/source_crm/cust_info.csv'
      CSV HEADER;
\echo '[CRM] crm_cust_info - DONE'
\echo ''



\echo '[CRM] Loading crm_prd_info...'
\echo ' - Truncating bronze.crm_prd_info'
TRUNCATE TABLE bronze.crm_prd_info;
\echo ' - Copying from datasets/source_crm/prd_info.csv'
COPY bronze.crm_prd_info
FROM 'datasets/source_crm/prd_info.csv'
      CSV HEADER;
\echo '[CRM] crm_prd_info - DONE'
\echo ''


\echo '[CRM] Loading crm_sales_details...'
\echo ' - Truncating bronze.crm_sales_details'
TRUNCATE TABLE bronze.crm_sales_details;
\echo ' - Copying from datasets/source_crm/sales_details.csv'
COPY bronze.crm_sales_details
FROM 'datasets/source_crm/sales_details.csv'
      CSV HEADER;
\echo '[CRM] crm_sales_details - DONE'
\echo ''


-- ERP Source Data


\echo '------------------------------------------------------------'
\echo 'Loading ERP SOURCE DATA into bronze...'
\echo '------------------------------------------------------------'
\echo ''


\echo '[ERP] Loading erp_cust_az12...'
TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12
FROM 'datasets/source_erp/cust_az12.csv'
      CSV HEADER;
\echo '[ERP] erp_cust_az12 - DONE'
\echo ''



\echo '[ERP] Loading erp_loc_a101...'
TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101
FROM 'datasets/source_erp/loc_a101.csv'
      CSV HEADER;
\echo '[ERP] erp_loc_a101 - DONE'
\echo ''



\echo '[ERP] Loading erp_px_cat_g1v2...'
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
COPY bronze.erp_px_cat_g1v2
FROM 'datasets/source_erp/px_cat_g1v2.csv'
      CSV HEADER;
\echo '[ERP] erp_px_cat_g1v2 - DONE'
\echo ''


\echo ''
\echo '============================================================'
\echo ' BRONZE DATA LOAD - COMPLETED SUCCESSFULLY'
\echo ' Finished at: ' `date`
\echo '============================================================'
