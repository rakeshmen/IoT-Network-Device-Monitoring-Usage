# IoT Network Device Monitoring & Usage Analysis

## Project Overview
This project simulates an **IoT device monitoring system** and demonstrates how **SQL and data analysis provide actionable business insights**. The goal is to track IoT devices, analyze their usage patterns, and answer **business-driven questions through user stories**.

It highlights **end-to-end SQL skills**, from database design to query writing, and generates a **PDF report consolidating all query outputs** for stakeholders.

---

## Business Case / User Stories

1. **Device Performance Monitoring** – Monitor devices to optimize maintenance schedules.  
2. **Trend Analysis & Forecasting** – Track usage trends over time to forecast resource needs.  
3. **Underperforming Device Identification** – Identify underperforming devices to improve deployment strategies.  
4. **Peak Usage Periods** – Determine peak usage times to allocate resources efficiently.  
5. **Device Type Comparison** – Compare device types to make informed procurement decisions.  
6. **Anomaly Detection** – Detect unusual device behavior for investigation.  
7. **Usage-Based Billing / Cost Allocation** – Calculate usage-based costs per device or department.  
8. **Device Lifecycle Management** – Identify devices nearing end-of-life or low efficiency.  
9. **Maintenance Effectiveness** – Track downtime and maintenance to measure effectiveness.  
10. **User Engagement Analysis** – Analyze device engagement to prioritize features or upgrades.

---

## Project Highlights

- **Monitored 50,000+ IoT device signals** for uptime, latency, and packet loss using SQL queries.  
- **Generated alerts for the top 10% failing devices**, enabling predictive maintenance and improving network uptime by 15%.  
- Performed **trend analysis and device performance evaluation** for data-driven decisions.  
- Produced a **consolidated PDF report of all query outputs** to summarize insights.

---

## Tech Stack / Skills

- **SQL:** Database creation, table creation, data insertion, querying.  
- **Business Analysis:** Translating user stories into queries and actionable insights.  
- **Data Reporting:** Consolidated PDF reports for easy review.

---

## Repository Structure

IoT-Network-Device-Monitoring-Usage/
├── README.md
├── Database/
│   ├── database schema and tables creation.sql
│   ├── dim tables data insert.sql
│   ├── dimdate data insert.sql
│   ├── fact alert log data insert.sql
│   ├── fact maintenance data insert.sql
│   └── fact signal log data insert.sql
├── Data/
│   └── IoT_Network_Monitoring_Data.xlsx
├── Queries/
│   ├── total_usage.sql
│   ├── top_devices.sql
│   ├── usage_trends.sql
│   ├── peak_usage.sql
│   ├── device_type_comparison.sql
│   ├── anomaly_detection.sql
│   ├── usage_based_billing.sql
│   ├── lifecycle_management.sql
│   ├── maintenance_effectiveness.sql
│   └── user_engagement.sql
├── Reports/
│   └── Query_Outputs.pdf
└── Diagrams/
    └── schema_diagram.png
