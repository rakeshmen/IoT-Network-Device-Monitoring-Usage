-- 1 CREATE DATABASE
CREATE DATABASE IoT_Network_Monitoring;
GO

USE IoT_Network_Monitoring;
GO


-- 2️  CREATE SCHEMA

CREATE SCHEMA iot AUTHORIZATION dbo;
GO


-- 3️  CREATE DIMENSION TABLES


-- Dim_Device
CREATE TABLE iot.Dim_Device (
    DeviceID INT IDENTITY(1,1) PRIMARY KEY,
    DeviceName VARCHAR(100) NOT NULL,
    DeviceType VARCHAR(50),
    Location VARCHAR(100),
    Manufacturer VARCHAR(50),
    InstallationDate DATE,
    Status VARCHAR(20)
);
GO

-- Dim_Date
CREATE TABLE iot.Dim_Date (
    DateKey INT PRIMARY KEY,               -- YYYYMMDD format
    FullDate DATE NOT NULL,
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    Quarter VARCHAR(10),
    Week INT,
    DayName VARCHAR(20)
);
GO

-- Dim_AlertType
CREATE TABLE iot.Dim_AlertType (
    AlertTypeID INT IDENTITY(1,1) PRIMARY KEY,
    AlertTypeName VARCHAR(100) NOT NULL,
    SeverityLevel VARCHAR(20)
);
GO

-- Dim_MaintenanceType
CREATE TABLE iot.Dim_MaintenanceType (
    MaintenanceTypeID INT IDENTITY(1,1) PRIMARY KEY,
    MaintenanceTypeName VARCHAR(50) NOT NULL,
    MaintenanceCategory VARCHAR(50)
);
GO

-- Dim_Technician
CREATE TABLE iot.Dim_Technician (
    TechnicianID INT IDENTITY(1,1) PRIMARY KEY,
    TechnicianName VARCHAR(100) NOT NULL,
    SkillLevel VARCHAR(10),
    Region VARCHAR(100)
);
GO


-- 4️  CREATE FACT TABLES


-- Fact_Signal_Log
CREATE TABLE iot.Fact_Signal_Log (
    SignalLogID BIGINT IDENTITY(1,1) PRIMARY KEY,
    DeviceID INT NOT NULL,
    DateKey INT NOT NULL,
    UptimePercent DECIMAL(5,2),
    LatencyMs DECIMAL(8,2),
    PacketLossPercent DECIMAL(5,2),
    SignalStrengthDbm DECIMAL(5,2),
    BatteryLevel DECIMAL(5,2),

    CONSTRAINT FK_Signal_Device FOREIGN KEY (DeviceID)
        REFERENCES iot.Dim_Device(DeviceID),
    CONSTRAINT FK_Signal_Date FOREIGN KEY (DateKey)
        REFERENCES iot.Dim_Date(DateKey)
);
GO

-- Fact_Alert_Log
CREATE TABLE iot.Fact_Alert_Log (
    AlertID BIGINT IDENTITY(1,1) PRIMARY KEY,
    DeviceID INT NOT NULL,
    DateKey INT NOT NULL,
    AlertTypeID INT NOT NULL,
    SeverityLevel VARCHAR(20),
    AlertDurationMin INT,
    AlertResolved BIT,

    CONSTRAINT FK_Alert_Device FOREIGN KEY (DeviceID)
        REFERENCES iot.Dim_Device(DeviceID),
    CONSTRAINT FK_Alert_Date FOREIGN KEY (DateKey)
        REFERENCES iot.Dim_Date(DateKey),
    CONSTRAINT FK_Alert_Type FOREIGN KEY (AlertTypeID)
        REFERENCES iot.Dim_AlertType(AlertTypeID)
);
GO

-- Fact_Maintenance
CREATE TABLE iot.Fact_Maintenance (
    MaintenanceID BIGINT IDENTITY(1,1) PRIMARY KEY,
    DeviceID INT NOT NULL,
    DateKey INT NOT NULL,
    MaintenanceTypeID INT NOT NULL,
    TechnicianID INT NOT NULL,
    DowntimeHours DECIMAL(6,2),
    Cost DECIMAL(10,2),
    Remarks VARCHAR(255),

    CONSTRAINT FK_Maint_Device FOREIGN KEY (DeviceID)
        REFERENCES iot.Dim_Device(DeviceID),
    CONSTRAINT FK_Maint_Date FOREIGN KEY (DateKey)
        REFERENCES iot.Dim_Date(DateKey),
    CONSTRAINT FK_Maint_Type FOREIGN KEY (MaintenanceTypeID)
        REFERENCES iot.Dim_MaintenanceType(MaintenanceTypeID),
    CONSTRAINT FK_Maint_Tech FOREIGN KEY (TechnicianID)
        REFERENCES iot.Dim_Technician(TechnicianID)
);
GO
