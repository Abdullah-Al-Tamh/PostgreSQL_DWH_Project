-- Switch to the default 'postgres' database to perform administrative tasks
\c postgres

-- Drop and recreate the 'datawarehouse' database
DROP DATABASE IF EXISTS datawarehouse;
CREATE DATABASE datawarehouse;

-- Connect to the newly created 'datawarehouse' database
\c datawarehouse

-- Create the bronze, silver, and gold schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;