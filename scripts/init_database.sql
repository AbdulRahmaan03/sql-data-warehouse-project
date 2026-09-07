/*

Create Database and Schemas
If the database exists, it is dropped and recreated.

*/

use master;
Go

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

create database DataWarehouse;
Go
  
use DataWarehouse;
Go

-- Create Schemas
create schema bronze;
Go
create schema silver;
Go
create schema gold;
Go
