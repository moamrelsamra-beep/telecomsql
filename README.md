# 📊 Telecom Customer Churn SQL Analysis

## 📌 Project Overview
This project focuses on cleaning, structuring, and analyzing a telecommunications customer dataset using SQL Server (T-SQL). The goal is to clean raw transactional data, normalize the schema, and extract key performance indicators (KPIs) regarding customer retention and contract distribution.

## 🛠️ Tools & Technologies
- **Database Engine:** Microsoft SQL Server (SSMS)
- **Language:** T-SQL
- **Concepts Used:** CTEs, Window Functions (`ROW_NUMBER`, `SUM OVER`), Data Type Casting, Table Normalization, Primary/Foreign Keys.

## 🗂️ Database Schema (ERD)
The flat dataset was normalized into 4 relational entities: `CUSTOMERS`, `SERVICES`, `CONTRACTS_BILLING`, and `CHURN_TRACKING`.

*(يمكنك سحب صورة الـ ERD وإسقاطها هنا داخل المحرر لتظهر فوراً)*

## 📈 Key KPIs Extracted
- **Retention Rate (%)**
- **Average Monthly & Total Charges**
- **Customer Tenure Distribution**
- **Contract Type Breakdown**
