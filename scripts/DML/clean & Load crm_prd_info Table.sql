INSERT INTO Silver.Crm_Prd_Info (Prd_Id, cat_id, Prd_Key, Prd_Nm, Prd_Cost, Prd_Line, Prd_Start_Dt, Prd_End_Dt)
SELECT Prd_Id,
       REPLACE(SUBSTRING(Prd_Key, 1, 5), '-', '_')                              AS cat_id,
       SUBSTRING(Prd_Key, 7, LENGTH(Prd_Key))                                   AS prd_key,
       Prd_Nm,
       COALESCE(Prd_Cost, 0)                                                    AS prd_cost,
       CASE UPPER(TRIM(Prd_Line))
           WHEN 'M' THEN 'Mountain'
           WHEN 'R' THEN 'Road'
           WHEN 'S' THEN 'Other Sales'
           WHEN 'T' THEN 'Touring'
           ELSE 'N/A'
           END                                                                  AS prd_line,
       Prd_Start_Dt,
       LEAD(Prd_Start_Dt) OVER (PARTITION BY Prd_Key ORDER BY Prd_Start_Dt) - 1 AS Prd_End_Dt
FROM Bronze.Crm_Prd_Info;