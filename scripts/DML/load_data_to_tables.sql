\set etl_start `date +"%Y-%m-%d %H:%M:%S"`

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
\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] Loading crm_cust_info... (start: :start_time)'
\echo ' - Truncating bronze.crm_cust_info'
TRUNCATE TABLE bronze.crm_cust_info;
\echo ' - Copying from datasets/source_crm/cust_info.csv'
COPY bronze.crm_cust_info
FROM 'datasets/source_crm/cust_info.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] crm_cust_info - DONE (end: :end_time)'
\echo ''


\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] Loading crm_prd_info... (start: :start_time)'
\echo ' - Truncating bronze.crm_prd_info'
TRUNCATE TABLE bronze.crm_prd_info;
\echo ' - Copying from datasets/source_crm/prd_info.csv'
COPY bronze.crm_prd_info
FROM 'datasets/source_crm/prd_info.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] crm_prd_info - DONE (end: :end_time)'
\echo ''


\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] Loading crm_sales_details... (start: :start_time)'
\echo ' - Truncating bronze.crm_sales_details'
TRUNCATE TABLE bronze.crm_sales_details;
\echo ' - Copying from datasets/source_crm/sales_details.csv'
COPY bronze.crm_sales_details
FROM 'datasets/source_crm/sales_details.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[CRM] crm_sales_details - DONE (end: :end_time)'
\echo ''


-- ERP Source Data

\echo '------------------------------------------------------------'
\echo 'Loading ERP SOURCE DATA into bronze...'
\echo '------------------------------------------------------------'
\echo ''


\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] Loading erp_cust_az12... (start: :start_time)'
TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12
FROM 'datasets/source_erp/cust_az12.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] erp_cust_az12 - DONE (end: :end_time)'
\echo ''


\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] Loading erp_loc_a101... (start: :start_time)'
TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101
FROM 'datasets/source_erp/loc_a101.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] erp_loc_a101 - DONE (end: :end_time)'
\echo ''


\set start_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] Loading erp_px_cat_g1v2... (start: :start_time)'
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
COPY bronze.erp_px_cat_g1v2
FROM 'datasets/source_erp/px_cat_g1v2.csv'
      CSV HEADER;
\set end_time `date +"%Y-%m-%d %H:%M:%S"`
\echo '[ERP] erp_px_cat_g1v2 - DONE (end: :end_time)'
\echo ''


\set etl_end `date +"%Y-%m-%d %H:%M:%S"`

\set etl_start_epoch `date -j -f "%Y-%m-%d %H:%M:%S" ":etl_start" "+%s"`
\set etl_end_epoch   `date -j -f "%Y-%m-%d %H:%M:%S" ":etl_end" "+%s"`

\set etl_duration `echo $(:etl_end_epoch - :etl_start_epoch | bc)`

\echo '============================================================'
\echo ' BRONZE DATA LOAD - COMPLETED SUCCESSFULLY'
\echo ' Start Time: :etl_start'
\echo ' End Time:   :etl_end'
\echo ' Total Duration: :etl_duration seconds'
\echo '============================================================'
