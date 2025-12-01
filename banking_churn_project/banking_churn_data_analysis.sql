-- DATA EXPLORATION AND ANALYSIS

-- SECTION A: Descriptive Analysis


-- What is the total number of customers?
SELECT 
	COUNT(*) AS total_numbers
FROM
	BankingChurn;

-- How many customers churned vs retained
SELECT
	COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
	COUNT(*) FILTER (WHERE churned = FALSE) AS retained_customers
FROM BankingChurn;

-- What is the average age of churned customers vs retained?
SELECT
	churned,
	ROUND(AVG(age)) AS avg_age,
	COUNT(*) 
FROM 
	BankingChurn
GROUP BY churned;

-- What is the customer distribution by geography?
SELECT
	country,
	COUNT(*) AS total_customers
FROM BankingChurn
GROUP BY country
ORDER BY country;

-- Which gender has the highest churn percentage?
SELECT
    gender,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
    ROUND(
      (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100,
      2
    ) AS churn_rate_pct
FROM BankingChurn
GROUP BY gender
ORDER BY churn_rate_pct DESC;


-- SECTION B: Statistical & Aggregation Analysis

-- What is the average credit score by churn status?
SELECT 
	churned,
	ROUND(AVG(credit_score), 2) AS avg_credit_score
FROM 
	BankingChurn
GROUP BY churned;

--What is the average balance by geography and churn?
SELECT
	churned,
	country,
	ROUND(AVG(balance),2) AS avg_balance
FROM
	BankingChurn
GROUP BY 
	country,
	churned
ORDER BY 
	country;

-- Is there a pattern between number of products and churn?
SELECT 
	num_of_products,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
    ROUND(
      (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100,
      2
    ) AS churn_rate_pct
FROM BankingChurn
GROUP BY num_of_products
ORDER BY num_of_products;

-- What percentage of customers are active members?
SELECT 
	is_active_member, 
	ROUND( (COUNT(*) FILTER (WHERE is_active_member = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS active_cust_pct 
FROM BankingChurn 
GROUP BY is_active_member;


-- SECTION C: Segmentation Analysis
-- Which country shows the highest churn rate?
SELECT 
	country,
	COUNT(*) AS total_customers,
	COUNT(*) FILTER(WHERE churned = TRUE)::NUMERIC AS total_churned_customers,
	ROUND( (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS churn_rate
FROM BankingChurn
GROUP BY country
ORDER BY churn_rate DESC;

--  Among high-balance customers, which gender churns more?
SELECT
	gender,
	ROUND( (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS churn_rate_pct
FROM BankingChurn
WHERE balance > 150000
GROUP BY gender
ORDER BY churn_rate_pct DESC;

-- Does having a credit card affect churn probability?
SELECT
	has_cr_card,
	COUNT(*) AS total_customers,
	ROUND( (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS churn_rate_pct
FROM BankingChurn
GROUP BY has_cr_card 
ORDER BY churn_rate_pct DESC;

--Which wealth level has the highest retention?
SELECT
	CASE WHEN balance = 0 THEN 'Zero'
		WHEN balance > 0 AND balance <= 50000 THEN 'Low'
		WHEN balance > 50000 AND balance <= 150000 THEN 'Medium'
		ELSE 'High'
	END AS balance_category,
	COUNT(*) AS total_customers,
	(COUNT(*) FILTER (WHERE churned = FALSE)::NUMERIC) AS retained_customers,
	ROUND( (COUNT(*) FILTER (WHERE churned = FALSE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS retention_rate
FROM BankingChurn
GROUP BY balance_category
ORDER BY retention_rate DESC;

-- What is the churn rate for customers with 3+ products?
SELECT 
	num_of_products,
	COUNT(*) AS total_customers,
	COUNT(*) FILTER(WHERE churned = TRUE)::NUMERIC AS total_churned_customers,
	ROUND( (COUNT(*) FILTER (WHERE churned = TRUE)::NUMERIC / NULLIF(COUNT(*), 0)) * 100, 
	2 ) AS churn_rate_pSECTION D: Advanced SQL (CTEs, Window Functions, Subqueries)ct
FROM BankingChurn
WHERE num_of_products >= 3
GROUP BY num_of_products
ORDER BY churn_rate_pct DESC;

-- SECTION D: Advanced SQL (CTEs, Window Functions, Subqueries)

-- Ranking the customers by balance within each geography 
SELECT 
	customer_id,
	surname,
	DENSE_RANK() OVER (
		PARTITION BY country
		ORDER BY balance DESC
	) AS ranking_by_balance
FROM BankingChurn;

SELECT * FROM BankingChurn;

-- Find the top 5 highest credit score customers who churned.
SELECT 
    customer_id,
    surname,
    credit_score,
    country
FROM BankingChurn
WHERE churned = TRUE
ORDER BY credit_score DESC
LIMIT 5;

--  Show each customer’s balance compared to the average balance of their country
SELECT 
	customer_id,
	surname,
	balance,
	country,
	ROUND(AVG(balance) OVER (PARTITION BY country),2) AS country_avg_balance,
	balance - AVG(balance) OVER (PARTITION BY country) AS balance_difference
FROM BankingChurn
ORDER BY balance_difference;

-- Use LAG() to compare a customer’s credit score to the previous customer’s score.
SELECT 
	customer_id,
	surname,
	credit_score,
	LAG(credit_score) OVER(ORDER BY customer_id) AS prev_credit_score,
	(credit_score - LAG(credit_score) OVER(ORDER BY customer_id))  AS credit_score_diff
FROM BankingChurn;

-- Compute a running average of salary by geography.
SELECT
    customer_id,
    country,
    estimated_salary,
    ROUND(AVG(estimated_salary) OVER (
        PARTITION BY country
        ORDER BY customer_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ), 2) AS running_avg_salary
FROM BankingChurn
ORDER BY country, customer_id;

-- SECTION E: Insight Extraction (Business Impact)
