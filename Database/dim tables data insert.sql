-- DIM: DEVICE

INSERT INTO iot.Dim_Device (DeviceName, DeviceType, Location, Manufacturer, InstallationDate, Status)
VALUES
('Sensor_A01', 'Temperature Sensor', 'New York', 'Bosch', '2022-01-05', 'Active'),
('Sensor_A02', 'Humidity Sensor', 'Los Angeles', 'Siemens', '2022-02-12', 'Active'),
('Router_B01', 'Router', 'Dallas', 'Cisco', '2022-03-25', 'Active'),
('Gateway_G01', 'IoT Gateway', 'Chicago', 'Dell', '2022-04-18', 'Active'),
('Camera_C01', 'Security Camera', 'New York', 'Xiaomi', '2022-05-02', 'Inactive'),
('Camera_C02', 'Security Camera', 'Boston', 'Xiaomi', '2022-05-03', 'Active'),
('Sensor_A03', 'Pressure Sensor', 'San Francisco', 'Honeywell', '2022-06-01', 'Active'),
('Router_B02', 'Router', 'Seattle', 'Cisco', '2022-07-10', 'Active'),
('Gateway_G02', 'IoT Gateway', 'Miami', 'Dell', '2022-07-20', 'Active'),
('Sensor_A04', 'Temperature Sensor', 'Austin', 'Bosch', '2022-08-15', 'Active');
GO


-- DIM: ALERT TYPE

INSERT INTO iot.Dim_AlertType (AlertTypeName, SeverityLevel)
VALUES
('Device Offline', 'Critical'),
('High Latency', 'High'),
('Packet Loss', 'Medium'),
('Low Battery', 'Medium'),
('Temperature Spike', 'Low');
GO


-- DIM: MAINTENANCE TYPE

INSERT INTO iot.Dim_MaintenanceType (MaintenanceTypeName, MaintenanceCategory)
VALUES
('Preventive', 'Hardware'),
('Corrective', 'Hardware'),
('Firmware Update', 'Software'),
('Calibration', 'Connectivity');
GO


-- DIM: TECHNICIAN

INSERT INTO iot.Dim_Technician (TechnicianName, SkillLevel, Region)
VALUES
('John Smith', 'L1', 'East Coast'),
('Emily Davis', 'L2', 'West Coast'),
('Ravi Kumar', 'L3', 'South'),
('Amit Patel', 'L2', 'North'),
('Sarah Johnson', 'L1', 'Central');
GO