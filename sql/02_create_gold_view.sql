USE energy;
GO

-- Create view on GOLD layer (Parquet files)
CREATE OR ALTER VIEW dbo.v_GoldLoad AS
SELECT *
FROM OPENROWSET(
    BULK 'load/*.parquet',
    DATA_SOURCE = 'EnergyLakeGold',
    FORMAT = 'PARQUET'
) AS rows;
GO

-- Test
SELECT TOP 10 * FROM dbo.v_GoldLoad;
