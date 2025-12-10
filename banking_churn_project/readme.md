# Banking Customer Churn Analysis (SQL Project)

This project explores customer churn behaviour using a real-world–style banking dataset. It demonstrates how SQL can be used end-to-end for data cleaning, feature engineering, advanced analytics, segmentation, and business insight generation. The goal was to understand which customers are most likely to leave the bank and why, and to derive recommendations that can help reduce churn and improve retention.

The analysis covers:

- Data quality checks and validation

- Feature preparation to create meaningful customer segments

- Deep exploratory analytics using advanced SQL techniques

- Identification of high-risk churn groups

- Business insights that support better customer retention strategies

This project showcases both technical SQL competence and analytical thinking required in data analytics, business intelligence, and entry-level data science roles.

 # Dataset Description Section (Add Under Tools & Technologies)
**Dataset Description**

- Rows: 10,000 customer records

- Columns: 14 original variables + engineered features during preparation

- Dataset Purpose: Represents customer banking information, including demographics, account activity, credit scores, products owned, and churn behaviour.

Target Variable:

exited — indicates whether a customer left the bank

1 = churned (customer left)

0 = retained (customer stayed)

This dataset supports customer segmentation, churn analysis, and behavioural pattern discovery.

# Skills Demonstrated Section (Place After Dataset Description)
### Data Cleaning & Validation

- Checked for missing values, duplicates, and invalid ranges

- Verified the integrity of age, balance, credit score, tenure, and categorical fields

- Applied outlier detection using Interquartile Range (IQR)

### Feature Engineering

- Created age groups for behavioural comparison

- Generated balance categories (Zero, Low, Medium, High)

- Built total wealth and wealth NTILE segments

- Segmented credit scores into risk levels

- Categorised tenure (New, Established, Loyal)

- Added meaningful business-friendly attributes for deeper insights

### Advanced SQL Techniques

- Window functions: LAG, LEAD, ROW_NUMBER, NTILE, running averages

- Analytical aggregates and ranking

- Segmentation using conditional logic and CASE statements

- Country-specific and segment-based insights

### Exploratory Data Analysis (EDA)

- Churn distribution across demographics and behaviours

- Product usage patterns and churn correlation

- Geography-based spread, retention differences, and wealth distribution

- Identified high-risk customer groups

### Business Insight & Storytelling

- Explained why churn is happening in certain customer segments

- Translated SQL findings into meaningful business language

- Provided practical recommendations for reducing churn

- Connected technical results to real-world banking decisions

---

# Tools & Technologies Used
### Database & Environment

PostgreSQL (relational database engine used for storing and querying the dataset)

pgAdmin (SQL development environment + GUI for running queries, inspecting tables, and managing the database)

### Query Language

PostgreSQL SQL (Postgres-flavoured SQL with support for analytical functions, NTILE, window functions, and other advanced features)

These tools provided everything I needed to clean the dataset, prepare features, perform in-depth analysis, and uncover meaningful churn insights.

---
I divided the workflow into 3 core phases:

1. **Data Cleaning & Inspection**
2. **Data Preparation & Feature Structuring**
3. **Customer Behaviour Analysis & Insight Extraction**

---

# 🧩 Project Structure

```
📁 Banking Churn SQL Project
│
├── 📄 banking_churn_data_cleaning_and_inspection.sql
├── 📄 banking_churn_data_preparation.sql
├── 📄 banking_churn_data_analysis.sql
└── 📄 README.md   (this file!)
```

---

# SECTION A — Data Cleaning & Inspection

*Problem → The dataset needed quality checks before analysis.*

### 🛠️ Action

I performed a thorough inspection by doing the following:

* Created database and table

<img width="562" height="462" alt="Create Database_i" src="https://github.com/user-attachments/assets/bdd974b0-c449-4438-ae26-7d65e8f9e6b1" />

* Checked for nulls column-by-column
* Validated ranges (credit score, age, tenure, balance)
* Detected duplicates
* Searched for invalid categories

<img width="1917" height="1077" alt="null_checking_i" src="https://github.com/user-attachments/assets/041b1b29-b360-4d2e-ac16-4df2005ad070" />

* Spotted outliers using Interquartile range (IQR) (for balance & credit score)

  <img width="1918" height="1040" alt="outlier_detection_1_i" src="https://github.com/user-attachments/assets/6456b5ad-0e6b-4243-ab83-c5336d5aae36" />


<img width="813" height="430" alt="outlier_detection_2_i" src="https://github.com/user-attachments/assets/56aee29d-dab8-4314-8b74-1f8dbf6fa20d" />


### The Result

A Dataset confirmed clean, values validated, outliers detected, and data ready for transformation.

---

# SECTION B — Data Preparation (Feature Engineering)

*Problem → Raw data wasn’t descriptive enough for business insight.*

## Action

To make the data more meaningful and easier to analyse, I created several new categories from the raw columns. These transformed features helped me see patterns that weren’t obvious at first glance:

### 1. Age Groups (18–25, 26–35, …)
Instead of treating age as just a number, I grouped customers into life stages. This made it easier to compare which age ranges were more likely to churn.

<img width="1783" height="562" alt="age_ii" src="https://github.com/user-attachments/assets/85be07c4-cc4a-4d4d-9fc2-55e548f0be5c" />


### 2. Balance Categories (Zero / Low / Medium / High)
Customer balances varied widely, so I categorised them into tiers. This helped me quickly spot whether people with higher or lower balances behaved differently.

<img width="691" height="244" alt="balance_ii" src="https://github.com/user-attachments/assets/cf604b2b-f8d3-4c32-84ab-128369e5febb" />


### 3. Wealth Levels (using NTILE)
By combining estimated salary + balance, I generated a total wealth measure and used NTILE(4) to split customers into four buckets—Low, Medium, High, Very High.
NTILE made the segmentation neat and evenly distributed.

<img width="717" height="311" alt="wealth_ii" src="https://github.com/user-attachments/assets/004e4167-8c7a-4055-afd3-1e8cb1ee6c1e" />


### 5. Credit Score Segmentation
Instead of looking at raw credit scores, I divided customers into tiers (Low → Very High). This helped reveal how creditworthiness corresponds to churn.

<img width="772" height="292" alt="credit_score_ii" src="https://github.com/user-attachments/assets/978ea592-2a39-484f-8fab-a10b0feab8c8" />


### 6. Tenure Categories (New / Established / Loyal)
I grouped customers based on how long they’ve been banking with the company. This made it easier to understand loyalty trends.

<img width="795" height="220" alt="tenure_ii" src="https://github.com/user-attachments/assets/e127f5e0-9536-4b34-b305-d479d2542473" />

### 7.Risk Segmentation (High Risk → Excellent)
Customers were segmented into four credit risk groups using NTILE:

- High Risk

- Medium Risk

- Good

- Excellent

This segmentation allows churn analysis by financial reliability.
<img width="805" height="323" alt="risk_ii" src="https://github.com/user-attachments/assets/eafcc1f4-bc3b-4ac9-8149-bfe19b1e7154" />


### Result
The dataset became “analytics-ready,” enabling powerful segmentation and comparison.

---

#  SECTION C — Exploratory Data Analysis (EDA)

I used SQL to answer analytical questions such as:

* Which gender has the highest churn percentage?

<img width="836" height="304" alt="image" src="https://github.com/user-attachments/assets/972887ec-e817-4717-992c-a3f073158e2a" />

* Which age group churned the most?

<img width="392" height="103" alt="image" src="https://github.com/user-attachments/assets/1466c6a0-b365-4ed4-b4ea-fc1994ecd188" />

* Which country had the highest churn rate?

<img width="517" height="122" alt="image" src="https://github.com/user-attachments/assets/534a0f3f-e370-46c5-aa8d-d8740449525b" />

* What is the impact of product usage on the churn rate?

<img width="452" height="129" alt="image" src="https://github.com/user-attachments/assets/2eb75dec-6b71-4551-ad27-d295cf5d631c" />


*Among High-balance customers, which gender churns more?

<img width="443" height="112" alt="image" src="https://github.com/user-attachments/assets/03587652-33ee-487d-b1e1-370174e73db8" />


* What are the running salary averages per country?

<img width="314" height="151" alt="image" src="https://github.com/user-attachments/assets/cc848144-331b-411e-b733-0aa8d22ce021" />

* What is the credit score comparison using LAG()

<img width="457" height="123" alt="image" src="https://github.com/user-attachments/assets/f2a7576b-cd7f-49d8-8a41-e1118a4eff84" />


* Who are the top-ranking customers within a particular country/geography?

<img width="298" height="133" alt="image" src="https://github.com/user-attachments/assets/c70e3c9e-fdea-43f4-ac04-169152ba1186" />


* What is the wealth distribution and retention rate based on the wealth distribution?

<img width="455" height="166" alt="image" src="https://github.com/user-attachments/assets/ea28b7dd-001e-4a6c-9b0a-b02d8929ba86" />


### Result

These analyses revealed the underlying behavioural patterns that feed churn prediction.


# Key Insights From the Data Preparation & Exploration

While preparing and segmenting the dataset, several strong patterns began to emerge across age groups, gender, geography, product usage, and credit card ownership. These insights shaped the later analysis and helped highlight where customer dissatisfaction was concentrated.

### 1. Age Groups & Churn Behaviour
The age segmentation immediately revealed that middle-aged customers churn the most:
Age Group	Churn Count
- 36–50	1127 (highest)
- 51–65	528
- 26–35	301
- 18–25	46
- 66+	35

**Interpretation:**
Customers between 36–50 and 51–65 are the most likely to leave.
These age ranges typically represent financially active adults—mortgages, investments, business activities—so poor service or better offers elsewhere may influence their decisions more strongly.

### 2. Gender & Churn

A quick breakdown by gender showed a clear imbalance:

Females: 1139 churned

Males: 898 churned

**Interpretation:**
Females churn slightly more than males in this dataset. This could imply:

- different customer service experiences

- different product expectations

- or varying financial behaviour patterns


### 3. Geography Matters

Only three countries exist in the dataset: Germany, Spain, and France.

Their churn rates tell a powerful story:

Country	Churn Rate
- 🇩🇪 Germany – 32.44%	
- 🇪🇸 Spain – 16.67%	
- 🇫🇷 France – 16.15%	

**Interpretation:**
Germany’s churn rate is twice that of the other countries.

This strongly signals:

- service dissatisfaction

- unmet expectations

- or uncompetitive banking products in that region.

Germany is a high-priority region for retention efforts.

### 4. Number of Bank Products & Churn

This was one of the biggest surprises in the entire dataset.

```sql
Products	  Churn Rate
4 products	100% (all customers churned)
3 products	82.71%
1 product	  27.71%
2 products	7.58% (lowest churn)
```
**Interpretation:**
This is an unusual and concerning pattern:

Customers with more products (3–4 services) are the most unhappy.

Customers with 2 products are the most loyal.

Possible reasoning:

Customers with many products may require more support, more benefits, and more value.

If the bank cannot meet those needs, it may switch to competitors offering better bundles or incentives.

This segment needs urgent investigation.

### 5. Credit Card Ownership & Churn

```sql
Has a Credit Card?	Churn Rate
No (False)	          20.81%
Yes (True)	          20.18%
```
**Interpretation:**
Credit card ownership has almost no effect on churn.
The slight difference (0.6%) is too small to be meaningful.

This means the credit card feature is not a major driver of churn and is not a strong loyalty factor.

### 6. Risk Segmentation (Credit Score NTILE)

Customers were segmented into four credit risk groups using NTILE:

High Risk

Medium Risk

Good

Excellent

**Interpretation:**
This segmentation allows churn analysis by financial reliability.
It helps identify whether churn comes from customers with:

poor credit scores

or even high-value, low-risk customers (which signals lost revenue opportunity)

This becomes essential for a retention strategy.

# Advanced Analysis Insights

This part of the project moved beyond basic segmentation and explored deeper customer behaviour, uncovering patterns in churn, retention, spending, product usage, and geography. These insights helped paint a sharper picture of who leaves the bank, why they leave, and what signals predict churn the most.

### 1. Total Churn vs Retention

The dataset showed a clear imbalance between customers who stayed and those who left:

Churned Customers: 2,037

Retained Customers: 7,963

This means roughly 20% of customers churned. This is consistent with global retail banking benchmarks.

### 2. Average Age of Churned vs Retained
```sql
Status	   Average Age
Churned	   37 years
Retained	 45 years
```
**Insight:**
Churn tends to happen more often among younger to middle-aged customers, while older customers remain more loyal.

3. Customer Distribution by Geography

Total customers per country:
```sql
Country	 Customers
France	  5,014
Germany	  2,509
Spain	    2,477
```
France holds the largest customer base, but churn behaviour varies significantly across these regions (as seen earlier).

### 4. Average Balance by Geography & Churn Status

This analysis compared the average account balance between customers who stayed vs those who churned:

🇫🇷 France

Not Churned: The average balance is 71,192.80

Churned: The average balance is 60,339.28

🇩🇪 Germany

Not Churned: The average balance is 120,361.08

Churned: The average balance is 119,427.71

🇪🇸 Spain

Not Churned: The average balance is 72,513.35

Churned: The average balance is 59,678.07

**Insight:**
In all three countries, customers who remained tend to have higher balances. Lower balance customers are more likely to leave. This is a key signal for early intervention.

5. Number of Products & Churn (Strongest Pattern)

This pattern repeated itself across multiple analyses:
```sql
Products	   Churn Rate	  Churn Count
4 Products	  100%	          60
3 Products	  82.71%	       220
1 Product	    27.71%	      1,409
2 Products	  7.58%	          348
``` 
**Insight:**
Shockingly, customers with 3 or 4 bank products churn at extremely high rates.
This suggests dissatisfaction despite using multiple services, possibly due to:

- unmet expectations

- complex product requirements

- poor service experience

- or a better competitor offers

Customers with 2 products are the most stable segment.

7. High-Balance Customers — Which Gender Churns More?

Among customers with high account balances of over $150,000, churn rates were:

Females: 28.30%

Males: 19.08%

**Insight:**
Even within high-value customers, female clients churn more frequently, signalling a potential service or satisfaction gap.

### 9. Wealth Level & Retention

Wealth categories and retention rates:
```sql
Wealth Level	  Retention Rate	Retained Customers
Zero	            86.18%	            3,117
High	            76.88%	             745
Medium	          75.89%	            4,052
Low	              65.33%	              49
```
Insight:
Surprisingly, customers with zero balance have the highest retention.
Low-wealth customers leave the most. tHis suggests financial instability or dissatisfaction.

11. Ranking Customers by Balance (Within Each Country)

Each customer was ranked by balance inside their country group.
This helped identify top-value customers in each region for targeted retention strategies.

12. Top 5 Highest Credit Score Customers Who Churned

All five customers had a perfect credit score of 850 — a major red flag.
High-credit customers are extremely valuable, so losing them is costly.

France: 3 high-score churners

Germany: 2 high-score churners

Customer Names:

- **Zikoranaudodimma**

- **Stevenson**

- **Douglas**

- **Macartney**

- **Matthias**

### 13. Customer Balance vs Country Average Balance

For every customer, I compared:

- their individual balance

- the average balance in their country

- the difference between both

This helped identify:

- customers far below their country’s average (potential churn risks)

- customers far above the average (high-value retention targets)

### 14. Credit Score Trend Using LAG()

Using the LAG() function, each customer’s credit score was compared to the score of the previous customer, helping observe patterns like:

- sudden credit score drops

- improving trends

- unusual irregularities

### 15. Running Average Salary by Geography

A running average (cumulative average) was calculated for each country to understand:

- salary progression

- income distribution

- financial stability trends

This was computed using window functions with ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.

--- 
#  Business Recommendations Based on Findings

Based on the patterns uncovered in this analysis, here are clear and actionable steps the bank can take to reduce churn and improve customer satisfaction:

**1. Prioritise Retention for Middle-Aged Customers (36–50 & 51–65)**

These groups churn the most.

**Recommendation:**

Introduce loyalty rewards or exclusive offers for this age segment.

Provide personalised financial advisory services focused on mortgages, investments, and retirement planning.

**2. Investigate Customer Experience in Germany (Highest Churn Rate)**

Germany’s churn rate is double that of France and Spain.

**Recommendation:**

Conduct region-specific customer satisfaction surveys.

Review pricing, service quality, and product competitiveness in Germany.

Strengthen German customer support teams.

**3. Urgent Intervention Needed for Customers with 3–4 Products**

This is the strongest red flag in the entire dataset.
100% churn for 4 products and 82.71% for 3 products.

**Recommendation:**

Audit the complexity, fees, and usability of bundled products.

Identify pain points such as:

- overlapping services

- hidden charges

- poor onboarding experience

Create a “Product Experience Team” to improve multi-product satisfaction.

**4. Improve Female Customer Engagement (Higher Churn Among Women)**

Female customers churn more, even in the high-balance segment.

**Recommendation:**

- Introduce women-focused financial programs.

- Offer tailored communication and relationship management for female clients.

- Review service quality across gender—there may be subtle biases.

**5. Strengthen High-Value Customer Retention (High Balance & Perfect Credit Score)**

Even customers with an 850 credit score are leaving, which is a major loss for the bank.

Recommendation:

- Assign personal relationship managers to high-value clients.

- Offer exclusive savings rates, investment perks, and priority support.

- Monitor their accounts for early signs of dissatisfaction.

**6. Support Low-Wealth Customers (Lowest Retention Rate)**

- Low-wealth customers have the poorest retention.

**Recommendation:**

- Offer budget-friendly financial products.

- Provide free financial literacy workshops.

- Reduce small fees that can frustrate financially sensitive clients.

**7. Identify At-Risk Customers Early Using Key Signals**

The strongest churn indicators from my analysis are:

- Customers with many products (3+)

- Customers living in Germany

- Middle-aged customers (36–50)

- Customers with low balance

- Customers with low wealth level

- Customers with high-balance that are females

- Customers whose account balance is far below their country's average balance

**8. Expand the Digital Experience for Younger Customers**

Younger clients (18-35) churn less but are more tech-driven.

**Recommendation:**

- Offer better mobile banking tools, budgeting features, and instant support.

- Promote youth savings plans and beginner investment products.

**9. Maintain Current Strategy for Credit Cards**

Credit card ownership does not impact churn.

**Recommendation:**

- No major changes are needed in the credit card program.

- The bank should focus retention efforts elsewhere (multi-product customers, Germany, high-value clients, etc.)

**10. Use Salary & Balance Insights to Personalise Offers**

Running averages and balance comparisons reveal spending power differences across countries.


# 🗂️ How to Use This Repository

1. **Clone the repo**
2. Import the SQL files into PostgreSQL
3. Run each script in order:

   * Cleaning & Inspection
   * Preparation
   * Analysis
4. Connect results to Excel / Power BI for visualisations if needed

---

#  Final Thoughts

Working on this project reminded me of why I love data so much — it turns confusion into clarity, and simple tables into powerful stories. Every SQL query I wrote revealed something new about customer behaviour, business risk, and opportunities for improvement.

I didn’t just clean data; I learned how real-world decisions can be shaped by patterns hiding inside millions of rows. I didn’t just analyse churn; I discovered how small signals (like age, geography, or product usage) can translate into millions in revenue impact. This project strengthened my confidence in SQL, analytical thinking, and problem-solving.
It pushed me to explore functions like NTILE, LAG, and running aggregates.

There’s still so much more to learn, but this project proved to me that I’m on the right path and that data analytics is not just something I’m studying, but something I genuinely enjoy. 💙


Like i always say on to the next challenge! 🚀
