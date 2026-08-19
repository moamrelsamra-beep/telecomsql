-- إنشاء جدول البيانات المتنظفة مباشرة
WITH Deduped AS (
    SELECT
        customerID,
        gender,
        SeniorCitizen,
        Partner,
        Dependents,
        CAST(tenure AS INT) AS tenure,

        PhoneService,
        CASE WHEN MultipleLines = 'No phone service' THEN 'No' ELSE MultipleLines END AS MultipleLines,
        InternetService,
        CASE WHEN OnlineSecurity   = 'No internet service' THEN 'No' ELSE OnlineSecurity   END AS OnlineSecurity,
        CASE WHEN OnlineBackup     = 'No internet service' THEN 'No' ELSE OnlineBackup     END AS OnlineBackup,
        CASE WHEN DeviceProtection = 'No internet service' THEN 'No' ELSE DeviceProtection END AS DeviceProtection,
        CASE WHEN TechSupport      = 'No internet service' THEN 'No' ELSE TechSupport      END AS TechSupport,
        CASE WHEN StreamingTV      = 'No internet service' THEN 'No' ELSE StreamingTV      END AS StreamingTV,
        CASE WHEN StreamingMovies  = 'No internet service' THEN 'No' ELSE StreamingMovies  END AS StreamingMovies,

        Contract,
        PaperlessBilling,
        PaymentMethod,

        CAST(MonthlyCharges AS DECIMAL(10,2)) AS MonthlyCharges,

        CAST(
            COALESCE(NULLIF(TRIM(TotalCharges), ''), '0')
            AS DECIMAL(10,2)
        ) AS TotalCharges,

        Churn,
        ROW_NUMBER() OVER (PARTITION BY customerID ORDER BY customerID) AS rn

    FROM raw_telecom_data
)
SELECT
    customerID, gender, SeniorCitizen, Partner, Dependents, tenure,
    PhoneService, MultipleLines, InternetService, OnlineSecurity,
    OnlineBackup, DeviceProtection, TechSupport, StreamingTV,
    StreamingMovies, Contract, PaperlessBilling, PaymentMethod,
    MonthlyCharges, TotalCharges, Churn
INTO clean_telecom_data
FROM Deduped
WHERE rn = 1;