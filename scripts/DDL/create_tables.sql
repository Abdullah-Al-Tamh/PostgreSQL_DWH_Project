\c datawarehouse

-- CRM Source Data Extraction Scripts

-- Extract cust_info.csv data into bronze.crm_cust_info table
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info
(
    cst_id             INT,
    cst_key            VARCHAR(50),
    cst_firstname      VARCHAR(50),
    cst_lastname       VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr           VARCHAR(50),
    cst_create_date    DATE
);

-- Extract prd_info.csv data into bronze.prod_prd_info table
DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info
(
    prd_id       INT,
    prd_key      VARCHAR(100),
    prd_nm       VARCHAR(100),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt   DATE

);

-- Extract sales_details.csv data into bronze.sales_sales_details table
DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num  VARCHAR(100),
    sls_prd_key  VARCHAR(100),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT

);


-- ERP Source Data Extraction Scripts

-- Extract CUST_AZ12.csv data into bronze.erp_cust_az12 table
DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12
(
    CID   VARCHAR(100),
    BDATE DATE,
    GEN   VARCHAR(50)
);

-- Extract LOC_A101.csv data into bronze.erp_loc_a101 table
DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101
(
    CID   VARCHAR(100),
    CNTRY VARCHAR(100)
);

-- Extract PX_CAT_G1V2.csv data into bronze.erp_px_cat_g1v2 table
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2
(
    ID  VARCHAR(50),
    CAT VARCHAR(100),
    SUBCAT VARCHAR(100),
    MAINTENANCE VARCHAR(50)

);