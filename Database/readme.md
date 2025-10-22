### Database Folder

The `Database/` folder contains all scripts required to **set up the relational database** for the IoT device monitoring project. The scripts are organized to create the database, dimension tables, fact tables, and insert sample data.  

1. **`database schema and tables creation.sql`** – Creates the database and all tables, including both **dimension (dim) and fact tables**, with proper primary and foreign key relationships.  
2. **`dim tables data insert.sql`** – Inserts sample data into all **dimension tables** (e.g., devices, device types, users).  
3. **`dimdate data insert.sql`** – Inserts date and calendar-related data into the **DimDate** table for time-based analysis.  
4. **`fact alert log data insert.sql`** – Inserts sample data into the **FactAlertLog** table, representing device alerts or notifications.  
5. **`fact maintenance data insert.sql`** – Inserts sample data into the **FactMaintenance** table, tracking maintenance activities on devices.  
6. **`fact signal log data insert.sql`** – Inserts sample data into the **FactSignalLog** table, capturing device signal events or readings.  

> **Purpose:** These scripts allow anyone to **recreate the complete database with dimension and fact tables** and populate it with sample data, enabling analysis and reporting on IoT device usage and performance.
