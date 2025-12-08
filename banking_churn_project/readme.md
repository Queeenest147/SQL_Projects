# Banking Customer Churn Analysis

**"SQL officially became my happy place during this project 🤭💙"**

I had so much fun working on this bank churn dataset — not just because SQL makes me feel like a detective with superpowers, but because I finally got to apply window functions, aggregate logic, views, categorization, and analytical techniques I’ve been learning for months.

This project helped me uncover **customer behaviour patterns**, **risk segments**, and **insights that a real bank could use** to reduce churn. It was exciting to turn raw data into meaningful recommendations that actually matter in a business context.

---

## 🛠️ Tools & Technologies Used
### 🗄️ Database & Environment

PostgreSQL (relational database engine used for storing and querying the dataset)

pgAdmin (SQL development environment + GUI for running queries, inspecting tables, and managing the database)

### 💻 Query Language

PostgreSQL SQL (Postgres-flavoured SQL with support for analytical functions, NTILE, window functions, and other advanced features)

These tools provided everything I needed to clean the dataset, prepare features, perform in-depth analysis, and uncover meaningful churn insights.

---

## 📌 Project Summary

This project explores:

*  Data Cleaning & Quality Checks
*  Feature Engineering: Age Split, Wealth Levels, Credit Score Segments
*  Advanced SQL Analytics (NTILE, Window Functions, LAG, Running Averages)
*  Churn Insights & Customer Segmentation
*  Business Recommendations from my Findings

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

# 🔍 SECTION A — Data Cleaning & Inspection

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

# 🧱 SECTION B — Data Preparation (Feature Engineering)

*Problem → Raw data wasn’t descriptive enough for business insight.*

### 🛠️ Action

To make the data more meaningful and easier to analyse, I created several new categories from the raw columns. These transformed features helped me see patterns that weren’t obvious at first glance:

#### 1. 👶 Age Groups (18–25, 26–35, …)
Instead of treating age as just a number, I grouped customers into life stages. This made it easier to compare which age ranges were more likely to churn.

<img width="1783" height="562" alt="age_ii" src="https://github.com/user-attachments/assets/85be07c4-cc4a-4d4d-9fc2-55e548f0be5c" />


#### 2.💰 Balance Categories (Zero / Low / Medium / High)
Customer balances varied widely, so I categorized them into tiers. This helped me quickly spot whether people with higher or lower balances behaved differently.

<img width="691" height="244" alt="balance_ii" src="https://github.com/user-attachments/assets/cf604b2b-f8d3-4c32-84ab-128369e5febb" />


#### 3.🏦 Wealth Levels (using NTILE)
By combining estimated salary + balance, I generated a total wealth measure and used NTILE(4) to split customers into four buckets—Low, Medium, High, Very High.
NTILE made the segmentation neat and evenly distributed.

<img width="717" height="311" alt="wealth_ii" src="https://github.com/user-attachments/assets/004e4167-8c7a-4055-afd3-1e8cb1ee6c1e" />


#### 5.⭐ Credit Score Segmentation
Instead of looking at raw credit scores, I divided customers into tiers (Low → Very High). This helped reveal how creditworthiness corresponds to churn.

<img width="772" height="292" alt="credit_score_ii" src="https://github.com/user-attachments/assets/978ea592-2a39-484f-8fab-a10b0feab8c8" />


#### 6.⏳ Tenure Categories (New / Established / Loyal)
I grouped customers based on how long they’ve been banking with the company. This made it easier to understand loyalty trends.

<img width="795" height="220" alt="tenure_ii" src="https://github.com/user-attachments/assets/e127f5e0-9536-4b34-b305-d479d2542473" />

#### 7.⚠️ Risk Segmentation (High Risk → Excellent)
Using the credit score again, I created a simple risk label, which helped me see which risk groups were more likely to stay or leave.

<img width="805" height="323" alt="risk_ii" src="https://github.com/user-attachments/assets/eafcc1f4-bc3b-4ac9-8149-bfe19b1e7154" />


### 📊 Result
The dataset became “analytics-ready,” enabling powerful segmentation and comparison.

---

# 📈 SECTION C — Exploratory Data Analysis (EDA)

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


### 📊 Result

These analyses revealed the underlying behavioural patterns that feed churn prediction.



# 💡 SECTION D — Insights (Business Impact)

*This is where I translated SQL results into actual business meaning.*

✔️ Which segments had the highest churn
✔️ Behaviour differences between active vs inactive members
✔️ Risk levels connected to churn
✔️ Wealth distribution patterns
✔️ Credit score behaviour across geographic regions
✔️ Which customers should be prioritised for retention efforts


# 📌 SECTION E — Summary of Key Findings

Here are some examples of what your findings will summarise (adjust based on your results):

* 🚨 **Inactive members churn significantly more than active members**
* 🌍 **One country had disproportionately high churn rates**
* 💳 **Customers with lower credit scores showed higher churn patterns**
* 👵 **Middle-aged groups (36–50) showed notable churn behaviour**
* 💼 **Customers with more products had lower churn**
* 💰 **High wealth customers still churned — showing deeper issues with loyalty**

---

# 🚀 SECTION F — Recommendations to the Bank

Again, adjust these based on your analysis:

* Target high-risk customers with personalised retention plans
* Improve loyalty programs for mid-wealth & medium-risk segments
* Strengthen relationship management in the country with the highest churn
* Create financial education programs for low-credit-score customers
* Incentivise inactive members to re-engage
* Offer product bundles that reduce churn

---

# 🗂️ How to Use This Repository

1. **Clone the repo**
2. Import the SQL files into PostgreSQL
3. Run each script in order:

   * Cleaning & Inspection
   * Preparation
   * Analysis
4. Connect results to Excel / Power BI for visualisations if needed

---

# 💬 Final Thoughts

This project was one of my favourite SQL journeys so far — I loved uncovering hidden insights and using advanced SQL features like NTILE, window functions, LAG(), CASE logic, and churn analytics.

More SQL, Python, and Power BI projects on the way! 🚀✨
