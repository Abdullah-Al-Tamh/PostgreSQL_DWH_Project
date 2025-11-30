\c datawarehouse

-- CRM Source Data Extraction Scripts

-- Extract cust_info.csv data into silver.crm_cust_info table
DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info
(
    cst_id             INT,
    cst_key            VARCHAR(50),
    cst_firstname      VARCHAR(50),
    cst_lastname       VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr           VARCHAR(50),
    cst_create_date    DATE,
    dwh_created_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Extract prd_info.csv data into silver.prod_prd_info table
DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info
(
    prd_id           INT,
    prd_key          VARCHAR(100),
    prd_nm           VARCHAR(100),
    prd_cost         INT,
    prd_line         VARCHAR(50),
    prd_start_dt     DATE,
    prd_end_dt       DATE,
    dwh_created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Extract sales_details.csv data into silver.sales_sales_details table
DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details
(
    sls_ord_num      VARCHAR(100),
    sls_prd_key      VARCHAR(100),
    sls_cust_id      INT,
    sls_order_dt     INT,
    sls_ship_dt      INT,
    sls_due_dt       INT,
    sls_sales        INT,
    sls_quantity     INT,
    sls_price        INT,
    dwh_created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ERP Source Data Extraction Scripts

-- Extract CUST_AZ12.csv data into silver.erp_cust_az12 table
DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12
(
    CID              VARCHAR(100),
    BDATE            DATE,
    GEN              VARCHAR(50),
    dwh_created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Extract LOC_A101.csv data into silver.erp_loc_a101 table
DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101
(
    CID              VARCHAR(100),
    CNTRY            VARCHAR(100),
    dwh_created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Extract PX_CAT_G1V2.csv data into silver.erp_px_cat_g1v2 table
DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2
(
    ID               VARCHAR(50),
    CAT              VARCHAR(100),
    SUBCAT           VARCHAR(100),
    MAINTENANCE      VARCHAR(50),
    dwh_created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dwh_updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);