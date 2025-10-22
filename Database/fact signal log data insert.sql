
-- FACT: SIGNAL LOG (Random 3 years of data)

DECLARE @i INT = 0;
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);

WHILE @i < 500  -- 500 random records
BEGIN
    INSERT INTO iot.Fact_Signal_Log (DeviceID, DateKey, UptimePercent, LatencyMs, PacketLossPercent, SignalStrengthDbm, BatteryLevel)
    SELECT 
        FLOOR(RAND()*@DeviceCount) + 1,                   -- DeviceID (1–10)
        (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID()),  -- Random Date
        ROUND(RAND()*5 + 95, 2),                          -- Uptime 95–100%
        ROUND(RAND()*50 + 20, 2),                         -- Latency 20–70ms
        ROUND(RAND()*2, 2),                               -- Packet loss 0–2%
        ROUND(RAND()*10 - 60, 2),                         -- Signal strength -70 to -60 dBm
        ROUND(RAND()*40 + 60, 2);                         -- Battery 60–100%

    SET @i = @i + 1;
END;
GO



-- Insert additional Fact_Signal_Log records to reach 50,000+
-- Adjust @RecordsToInsert as needed

DECLARE @i INT = 0;
DECLARE @RecordsToInsert INT = 45000; -- Add 45,000 more to reach 50k+
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);

WHILE @i < @RecordsToInsert
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey 
                            FROM iot.Dim_Date 
                            ORDER BY NEWID());

    INSERT INTO iot.Fact_Signal_Log 
        (DeviceID, DateKey, UptimePercent, LatencyMs, PacketLossPercent, SignalStrengthDbm, BatteryLevel)
    VALUES (
        @DeviceID,
        @DateKey,
        ROUND(RAND() * 5 + 95, 2),       -- Uptime 95-100%
        ROUND(RAND() * 50 + 20, 2),      -- Latency 20-70 ms
        ROUND(RAND() * 2, 2),            -- Packet Loss 0-2%
        ROUND(RAND() * 10 - 60, 2),      -- Signal strength -70 to -60 dBm
        ROUND(RAND() * 40 + 60, 2)       -- Battery 60-100%
    );

    SET @i = @i + 1;
END;
GO


-- Add 10,000 more records to Fact_Signal_Log
DECLARE @i INT = 0;
DECLARE @RecordsToInsert INT = 10000; 
DECLARE @DeviceCount INT = (SELECT COUNT(*) FROM iot.Dim_Device);
DECLARE @DateCount INT = (SELECT COUNT(*) FROM iot.Dim_Date);

WHILE @i < @RecordsToInsert
BEGIN
    DECLARE @DeviceID INT = FLOOR(RAND() * @DeviceCount) + 1;
    DECLARE @DateKey INT = (SELECT TOP 1 DateKey FROM iot.Dim_Date ORDER BY NEWID());

    INSERT INTO iot.Fact_Signal_Log 
        (DeviceID, DateKey, UptimePercent, LatencyMs, PacketLossPercent, SignalStrengthDbm, BatteryLevel)
    VALUES (
        @DeviceID,
        @DateKey,
        ROUND(RAND() * 5 + 95, 2),       -- Uptime 95-100%
        ROUND(RAND() * 50 + 20, 2),      -- Latency 20-70 ms
        ROUND(RAND() * 2, 2),            -- Packet Loss 0-2%
        ROUND(RAND() * 10 - 60, 2),      -- Signal strength -70 to -60 dBm
        ROUND(RAND() * 40 + 60, 2)       -- Battery 60-100%
    );

    SET @i = @i + 1;
END;
GO
