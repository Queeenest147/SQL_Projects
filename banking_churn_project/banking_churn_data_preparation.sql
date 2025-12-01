-- DATA PREPARATION TASKS

-- Categorising the age column
CREATE OR REPLACE VIEW customer_age_group AS
SELECT 
    customer_id,
    age,
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        WHEN age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+'
    END AS age_group
FROM BankingChurn;

-- Categorising the balance column
SELECT 
		customer_id,
		balance,
		CASE WHEN balance = 0 THEN 'Zero'
			WHEN balance > 0 AND balance <= 50000 THEN 'Low'
			WHEN balance > 50000 AND balance <= 150000 THEN 'Medium'
			ELSE 'High'
		END AS balance_category
FROM BankingChurn;

-- Wealth Level of the Customers 
SELECT
    customer_id,
    estimated_salary,
    balance,
    (estimated_salary + balance) AS total_wealth,
    CASE NTILE(4) OVER (ORDER BY (estimated_salary + balance))
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS wealth_level
FROM BankingChurn;

-- Categorising the churned column
SELECT 
	customer_id, 
	churned,
	CASE WHEN churned = TRUE THEN 'Churned'
	WHEN churned = FALSE THEN 'Active'
	END AS customer_churn_category
FROM BankingChurn;

--Which age group churned the most 
SELECT 
    cag.age_group,
    COUNT(*) AS churned_customers
FROM customer_age_group cag
JOIN BankingChurn bc
    ON cag.customer_id = bc.customer_id
WHERE bc.churned = TRUE
GROUP BY cag.age_group
ORDER BY churned_customers DESC;

-- Which Gender churned the most
SELECT
	gender,
	COUNT(*) AS churned_customers
FROM BankingChurn
WHERE churned = TRUE
GROUP BY gender
ORDER BY churned_customers;

-- Calculating the churn rate based on the country
CREATE OR REPLACE VIEW country_performance AS
SELECT 
    country,
    COUNT(customer_id) AS total_customers,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
	ROUND((COUNT(*) FILTER (WHERE churned = TRUE)::DECIMAL / COUNT(customer_id)) * 100, 2) AS churn_rate
FROM BankingChurn
GROUP BY country
ORDER BY churn_rate DESC;

-- Calculating the churn rate based on the customers that have credit cards
SELECT 
    num_of_products,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churned = TRUE)::DECIMAL / COUNT(*) * 100, 2
    ) AS churn_rate
FROM BankingChurn
GROUP BY num_of_products
ORDER BY churned_customers DESC;

SELECT 
    has_cr_card,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
	 ROUND(
        COUNT(*) FILTER (WHERE churned = TRUE)::DECIMAL / COUNT(*) * 100, 2
    ) AS churn_rate
FROM BankingChurn
GROUP BY has_cr_card
ORDER BY churn_rate DESC;


-- Created the credit_score_categories and find the churn rate in percentage for each category 
CREATE OR REPLACE VIEW credit_score_segmentation AS 
WITH credit_categories AS (
    SELECT
        customer_id,
        credit_score,
        churned,
        CASE NTILE(4) OVER (ORDER BY credit_score)
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
            WHEN 4 THEN 'Very High'
        END AS credit_score_category
    FROM BankingChurn
)
SELECT
    credit_score_category,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churned = TRUE) AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churned = TRUE)::DECIMAL / COUNT(*) * 100,
        2
    ) AS churn_rate
FROM credit_categories
GROUP BY credit_score_category
ORDER BY churn_rate DESC;


-- Creating a view category for the tenure the customers have with the bank
CREATE VIEW customer_banking_tenure_category AS
SELECT 
	tenure,
	CASE WHEN tenure BETWEEN 0 AND 3 THEN 'New'
	WHEN tenure BETWEEN 4 AND 7 THEN 'Established'
	WHEN tenure BETWEEN 8 AND 10 THEN 'Loyal'
	END AS tenure_categories
FROM BankingChurn;

--Created a view to segment the risks of customers based on their credit score
CREATE OR REPLACE VIEW risk_segmentation AS 
SELECT
    customer_id,
    credit_score,
    CASE NTILE(4) OVER (ORDER BY (credit_score))
        WHEN 1 THEN 'High Risk'
        WHEN 2 THEN 'Average Risk'
        WHEN 3 THEN 'Good'
        WHEN 4 THEN 'Excellent'
    END AS risk_segments
FROM BankingChurn;

