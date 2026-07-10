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

