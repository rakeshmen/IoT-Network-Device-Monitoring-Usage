-- FACT: MAINTENANCE
DECLARE @i INT = 0;
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);
DECLARE @MaintenanceTypeCount INT = (SELECT COUNT(*) FROM iot.Dim_MaintenanceType);
DECLARE @TechnicianCount INT = (SELECT COUNT(*) FROM iot.Dim_Technician);

WHILE @i < 50
BEGIN
    DECLARE @DeviceID INT;
    DECLARE @DateKey INT;
    DECLARE @MaintenanceTypeID INT;
    DECLARE @TechnicianID INT;

    SET @DeviceID = FLOOR(RAND() * @DeviceCount) + 1;
    SET @DateKey = (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID());
    SET @MaintenanceTypeID = FLOOR(RAND() * @MaintenanceTypeCount) + 1;
    SET @TechnicianID = FLOOR(RAND() * @TechnicianCount) + 1;

    INSERT INTO iot.Fact_Maintenance 
        (DeviceID, DateKey, MaintenanceTypeID, TechnicianID, DowntimeHours, Cost, Remarks)
    VALUES (
        @DeviceID, 
        @DateKey, 
        @MaintenanceTypeID, 
        @TechnicianID, 
        ROUND(RAND()*5 + 1, 2),      -- DowntimeHours 1–6
        ROUND(RAND()*1000 + 500, 2), -- Cost ₹500–1500
        'Routine maintenance or repair'
    );

    SET @i = @i + 1;
END;
GO




-- Insert additional maintenance records (multiple per day)
DECLARE @i INT = 0;
DECLARE @RecordsToInsert INT = 50; -- number of extra records

DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @MaintenanceTypeCount INT = (SELECT COUNT(*) FROM iot.Dim_MaintenanceType);
DECLARE @TechnicianCount INT = (SELECT COUNT(*) FROM iot.Dim_Technician);

WHILE @i < @RecordsToInsert
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey 
                            FROM iot.Dim_Date 
                            WHERE DateKey IN (SELECT DateKey FROM iot.Dim_Date) -- optional filter
                            ORDER BY NEWID());
    DECLARE @MaintenanceTypeID INT = FLOOR(RAND() * @MaintenanceTypeCount) + 1;
    DECLARE @TechnicianID INT = FLOOR(RAND() * @TechnicianCount) + 1;

    INSERT INTO iot.Fact_Maintenance 
        (DeviceID, DateKey, MaintenanceTypeID, TechnicianID, DowntimeHours, Cost, Remarks)
    VALUES (
        @DeviceID,
        @DateKey,
        @MaintenanceTypeID,
        @TechnicianID,
        ROUND(RAND()*5 + 1, 2),      -- DowntimeHours 1–6
        ROUND(RAND()*1000 + 500, 2), -- Cost
        'Additional maintenance record'
    );

    SET @i = @i + 1;
END;
GO


-- Insert additional maintenance records
DECLARE @i INT = 0;
DECLARE @RecordsToInsert INT = 500; -- Adjust to scale
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @MaintenanceTypeCount INT = (SELECT COUNT(*) FROM iot.Dim_MaintenanceType);
DECLARE @TechnicianCount INT = (SELECT COUNT(*) FROM iot.Dim_Technician);

WHILE @i < @RecordsToInsert
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID());
    DECLARE @MaintenanceTypeID INT = FLOOR(RAND() * @MaintenanceTypeCount) + 1;
    DECLARE @TechnicianID INT = FLOOR(RAND() * @TechnicianCount) + 1;

    INSERT INTO iot.Fact_Maintenance 
        (DeviceID, DateKey, MaintenanceTypeID, TechnicianID, DowntimeHours, Cost, Remarks)
    VALUES (
        @DeviceID,
        @DateKey,
        @MaintenanceTypeID,
        @TechnicianID,
        ROUND(RAND()*5 + 1, 2),      -- DowntimeHours 1–6
        ROUND(RAND()*1000 + 500, 2), -- Cost
        'Routine maintenance or repair'
    );

    SET @i = @i + 1;
END;
GO
