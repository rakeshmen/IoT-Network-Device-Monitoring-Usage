
-- DIM: DATE

DECLARE @StartDate DATE = '2022-01-01';
DECLARE @EndDate DATE = '2024-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO iot.Dim_Date (DateKey, FullDate, Year, Month, MonthName, Quarter, Week, DayName)
    SELECT 
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')),
        @StartDate,
        YEAR(@StartDate),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        CONCAT('Q', DATEPART(QUARTER, @StartDate)),
        DATEPART(WEEK, @StartDate),
        DATENAME(WEEKDAY, @StartDate);

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;
GO
