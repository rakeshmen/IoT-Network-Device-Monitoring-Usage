-- FACT: ALERT LOG
DECLARE @i INT = 0;
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @AlertTypeCount INT = (SELECT COUNT(*) FROM iot.Dim_AlertType);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);

WHILE @i < 100
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @AlertTypeID INT = FLOOR(RAND() * @AlertTypeCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID());
    DECLARE @Severity VARCHAR(20) = (SELECT SeverityLevel FROM iot.Dim_AlertType WHERE AlertTypeID = @AlertTypeID);

    INSERT INTO iot.Fact_Alert_Log (DeviceID, DateKey, AlertTypeID, SeverityLevel, AlertDurationMin, AlertResolved)
    VALUES (@DeviceID, @DateKey, @AlertTypeID, @Severity, FLOOR(RAND()*60) + 10, FLOOR(RAND()*2));

    SET @i = @i + 1;
END;
GO


-- Insert additional alerts for top failing devices / random devices
DECLARE @i INT = 0;
DECLARE @RecordsToInsert INT = 3000; -- Adjust for desired alert volume
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @AlertTypeCount INT = (SELECT COUNT(*) FROM iot.Dim_AlertType);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);

WHILE @i < @RecordsToInsert
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @AlertTypeID INT = FLOOR(RAND() * @AlertTypeCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID());
    DECLARE @Severity VARCHAR(20) = (SELECT AlertTypeName FROM iot.Dim_AlertType WHERE AlertTypeID = @AlertTypeID);

    INSERT INTO iot.Fact_Alert_Log 
        (DeviceID, DateKey, AlertTypeID, SeverityLevel, AlertDurationMin, AlertResolved)
    VALUES (
        @DeviceID,
        @DateKey,
        @AlertTypeID,
        @Severity,
        ROUND(RAND()*60 + 10, 2),
        FLOOR(RAND()*2)
    );

    SET @i = @i + 1;
END;
GO

