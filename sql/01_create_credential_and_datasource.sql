-- Run inside the 'energy' database

-- Create master key (only once)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword!123';
GO

-- Create credential for storage account (using Key)
CREATE DATABASE SCOPED CREDENTIAL Cred_Lake
WITH IDENTITY = 'Storage Account Key',
     SECRET   = 'YOUR_STORAGE_ACCOUNT_KEY';
GO

-- External data source pointing to GOLD container
CREATE EXTERNAL DATA SOURCE EnergyLakeGold
WITH (
    LOCATION   = 'abfss://gold@energydatalaketest.dfs.core.windows.net',
    CREDENTIAL = Cred_Lake
);
GO
