-- =========================================================
-- KPI 1: Overall Retention Rate (%)
-- =========================================================
SELECT
    COUNT(CASE WHEN Churn = 'No' THEN 1 END) AS ActiveCustomers,
    COUNT(*) AS TotalCustomers,
    CAST(
        COUNT(CASE WHEN Churn = 'No' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)
    AS DECIMAL(5,2)) AS RetentionRatePct
FROM clean_telecom_data;


-- =========================================================
-- KPI 2: Averages Breakdown (MonthlyCharges, TotalCharges, Tenure)
-- =========================================================
SELECT
    CAST(AVG(MonthlyCharges) AS DECIMAL(10,2)) AS AvgMonthlyCharges,
    CAST(AVG(TotalCharges)   AS DECIMAL(10,2)) AS AvgTotalCharges,
    CAST(AVG(CAST(tenure AS FLOAT)) AS DECIMAL(10,2)) AS AvgTenureMonths
FROM clean_telecom_data;


-- =========================================================
-- KPI 3: Contract Distribution (Count + % of Total)
-- =========================================================
SELECT
    Contract,
    COUNT(*) AS CustomerCount,
    CAST(
        COUNT(*) * 100.0 / NULLIF(SUM(COUNT(*)) OVER (), 0)
    AS DECIMAL(5,2)) AS PctOfTotal
FROM clean_telecom_data
GROUP BY Contract
ORDER BY CustomerCount DESC;