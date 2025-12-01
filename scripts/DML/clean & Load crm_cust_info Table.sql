\c datawarehouse

INSERT INTO Silver.Crm_Cust_Info(Cst_Id,
                                 Cst_Key,
                                 Cst_Firstname,
                                 Cst_Lastname,
                                 Cst_Marital_Status,
                                 Cst_Gndr,
                                 Cst_Create_Date)
WITH latest_customer_record AS (SELECT Cst_Id,
                                       Cst_Key,
                                       TRIM(Cst_Firstname) AS Cst_Firstname,
                                       TRIM(Cst_Lastname)  AS Cst_Lastname,
                                       CASE
                                           WHEN UPPER(TRIM(Cst_Marital_Status)) = 'S' THEN 'Single'
                                           WHEN UPPER(TRIM(Cst_Marital_Status)) = 'M' THEN 'Married'
                                           ELSE 'N/A'
                                           END             AS Cst_Marital_Status,
                                       CASE
                                           WHEN UPPER(TRIM(Cst_Gndr)) = 'M' THEN 'Male'
                                           WHEN UPPER(TRIM(Cst_Gndr)) = 'F' THEN 'Female'
                                           ELSE 'N/A'
                                           END             AS Cst_Gndr,
                                       Cst_Create_Date,
                                       ROW_NUMBER() OVER (
                                           PARTITION BY Cst_Id
                                           ORDER BY Cst_Create_Date DESC
                                           )               AS Flag_Last
                                FROM Bronze.Crm_Cust_Info)
SELECT Cst_Id,
       Cst_Key,
       Cst_Firstname,
       Cst_Lastname,
       Cst_Marital_Status,
       Cst_Gndr,
       Cst_Create_Date
FROM latest_customer_record
WHERE Flag_Last = 1;
