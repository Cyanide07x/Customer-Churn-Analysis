    -- ==========================================
-- Customer Churn Analysis SQL Queries
-- Author : Utsav Sachan
-- Project: Customer Churn Analysis
-- ==========================================

USE customer_churn;

SELECT COUNT(*) AS Total_Customers
FROM customer_churn;


--Total Churned Customers
SELECT COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes';


--Churn Rate
SELECT                 
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS Churn_Rate
FROM customer_churn;

--Churn by Gender
SELECT
gender,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned_Customers
FROM customer_churn
GROUP BY gender;

--Churn by Contract Type
SELECT
Contract,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY Contract
ORDER BY Churned DESC;

--Churn by Internet Service
SELECT
InternetService,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY InternetService
ORDER BY Churned DESC;

--Average Monthly Charges by Churn
SELECT
Churn,
ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM customer_churn
GROUP BY Churn;

--Average Total Charges by Churn
SELECT
Churn,
ROUND(AVG(TotalCharges),2) AS Avg_Total_Charges
FROM customer_churn
GROUP BY Churn;

--Churn by Payment Method
SELECT
PaymentMethod,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Churned DESC;

--Churn by Senior Citizen
SELECT
SeniorCitizen,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY SeniorCitizen;

-- Churn by Tenure Group
SELECT
CASE
WHEN tenure <= 12 THEN '0-12 Months'
WHEN tenure <= 24 THEN '13-24 Months'
WHEN tenure <= 48 THEN '25-48 Months'
ELSE '49+ Months'
END AS Tenure_Group,

COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned

FROM customer_churn

GROUP BY Tenure_Group
ORDER BY Customers DESC;

--Churn by Tech Support
SELECT
TechSupport,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY TechSupport;

--Churn by Online Security
SELECT
OnlineSecurity,
COUNT(*) AS Customers,
SUM(Churn='Yes') AS Churned
FROM customer_churn
GROUP BY OnlineSecurity;

--Top Payment Methods
SELECT
PaymentMethod,
COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Total_Customers DESC;

--Customers with Highest Monthly Charges
SELECT
customerID,
MonthlyCharges,
Contract,
InternetService
FROM customer_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;

--Contract-wise Revenue
SELECT
Contract,
ROUND(AVG(tenure),2) AS Avg_Tenure
FROM customer_churn
GROUP BY Contract;

--Average Tenure by Contract
SELECT
Contract,
ROUND(AVG(tenure),2) AS Avg_Tenure
FROM customer_churn
GROUP BY Contract;

--Customers without Tech Support
SELECT COUNT(*) AS Customers_Without_TechSupport
FROM customer_churn
WHERE TechSupport='No';

--Fiber Optic Customers Who Churned
SELECT COUNT(*) AS Fiber_Churn
FROM customer_churn
WHERE InternetService='Fiber optic'
AND Churn='Yes';

--Monthly Charges Distribution
SELECT
MIN(MonthlyCharges) AS Minimum,
MAX(MonthlyCharges) AS Maximum,
ROUND(AVG(MonthlyCharges),2) AS Average
FROM customer_churn;



