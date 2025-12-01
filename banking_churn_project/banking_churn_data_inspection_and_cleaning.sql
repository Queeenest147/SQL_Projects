-- A banking churn database 

CREATE DATABASE banking_churn
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

DROP TABLE IF EXISTS public.bankingchurn;

CREATE TABLE BankingChurn (
    customer_id INT PRIMARY KEY,
    surname VARCHAR(50),
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance NUMERIC(12,2),
    num_of_products INT,
    has_cr_card BOOLEAN,
    is_active_member BOOLEAN,
    estimated_salary NUMERIC(12,2),
    churned BOOLEAN
);

-- DATA INSPECTION SECTION

SELECT COUNT(*) AS total_rows FROM BankingChurn;

--Checking the total null values in each columns 
CREATE OR REPLACE VIEW view_null_counts AS
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
    COUNT(*) FILTER (WHERE surname IS NULL OR surname = '') AS surname_nulls,
    COUNT(*) FILTER (WHERE credit_score IS NULL) AS credit_score_nulls,
    COUNT(*) FILTER (WHERE country IS NULL OR country = '') AS country_nulls,
    COUNT(*) FILTER (WHERE gender IS NULL OR gender = '') AS gender_nulls,
    COUNT(*) FILTER (WHERE age IS NULL) AS age_nulls,
    COUNT(*) FILTER (WHERE tenure IS NULL) AS tenure_nulls,
    COUNT(*) FILTER (WHERE balance IS NULL) AS balance_nulls,
    COUNT(*) FILTER (WHERE num_of_products IS NULL) AS num_of_products_nulls,
    COUNT(*) FILTER (WHERE has_cr_card IS NULL) AS has_cr_card_nulls,
    COUNT(*) FILTER (WHERE is_active_member IS NULL) AS is_active_member_nulls,
    COUNT(*) FILTER (WHERE estimated_salary IS NULL) AS estimated_salary_nulls,
    COUNT(*) FILTER (WHERE churned IS NULL) AS churned_nulls
FROM BankingChurn;

SELECT * FROM view_null_counts;

--Check duplicates by customer_id
SELECT customer_id, COUNT(*) AS duplicates
FROM BankingChurn
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check duplicates by surname, estimated_salary and country
SELECT surname, estimated_salary, country, COUNT(*) AS duplicates
FROM BankingChurn
GROUP BY surname, estimated_salary, country
HAVING COUNT(*) > 1;

SELECT gender FROM BankingChurn 
WHERE gender IN ('Male','Female');

SELECT DISTINCT country FROM BankingChurn;

-- Check if the credit score is within the range of 300-900
SELECT credit_score 
FROM BankingChurn
WHERE credit_score < 300 OR credit_score > 900;

-- Check for balance of customers debt that are in ngeative values 
SELECT balance FROM BankingChurn
WHERE balance < 0;

-- Check for age that are lower than or greater than the age range 
SELECT age
FROM BankingChurn
WHERE age < 18 OR age > 100;

-- Check if the tenure exceeds customer age 
SELECT customer_id, surname, age, tenure
FROM BankingChurn 
WHERE tenure > age;

-- Check for invalid number of products
SELECT surname, num_of_products
FROM BankingChurn
WHERE num_of_products < 1 OR num_of_products > 4;

-- OUTLIER DETECTION on credit_score
WITH stats AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY credit_score) AS q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY credit_score) AS q3
    FROM BankingChurn
)
SELECT *
FROM BankingChurn, stats
WHERE credit_score < (q1 - 1.5 * (q3 - q1))
   OR credit_score > (q3 + 1.5 * (q3 - q1));

-- OUTLIER DETECTION on balance
WITH stats_balance AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY balance) AS q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY balance) AS q3
    FROM BankingChurn
)
SELECT *,
       CASE 
           WHEN balance < (q1 - 1.5 * (q3 - q1)) THEN 'Low Outlier'
           WHEN balance > (q3 + 1.5 * (q3 - q1)) THEN 'High Outlier'
           ELSE 'Normal'
       END AS balance_outlier
FROM BankingChurn, stats_balance
WHERE balance < (q1 - 1.5 * (q3 - q1))
   OR balance > (q3 + 1.5 * (q3 - q1));


-- A check for customers with more than 4 products
SELECT num_of_products FROM BankingChurn WHERE num_of_products > 4;