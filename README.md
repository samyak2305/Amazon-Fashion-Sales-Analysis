# 📊 Amazon Fashion Sales Analysis

![Executive Dashboard](screenshots/Executive_Dashboard.png)

A comprehensive end-to-end **Data Analytics** project that analyzes Amazon Fashion sales data using **Python, MySQL, and Power BI**.

## ⭐ Project Highlights
- Cleaned and analyzed **128,713** Amazon Fashion sales records.
- Performed business analysis using **MySQL**.
- Developed **30+ SQL queries**.
- Built **3 interactive Power BI dashboards**.
- Created DAX measures for KPIs.

## 📌 Project Overview
This project analyzes Amazon Fashion sales data (March–June 2022) covering:
- Sales Performance
- Product Analysis
- Geographic Analysis
- Fulfilment Analysis
- Promotion Analysis

## 🎯 Objectives
- Analyze business performance
- Identify top-performing products
- Evaluate fulfilment
- Measure promotion impact
- Build interactive dashboards

## 📂 Dataset
- Records: **128,713**
- Format: CSV

## 📋 Prerequisites
- Python 3.10+
- Jupyter Notebook/JupyterLab
- MySQL Server & Workbench
- Microsoft Power BI Desktop

## ⚙️ Installation
```bash
git clone https://github.com/samyak2305/Amazon-Fashion-Sales-Analysis.git
cd Amazon-Fashion-Sales-Analysis
pip install -r requirements.txt
```

Run `datasets/Data_Cleaning_Preprocessing.ipynb`, import the cleaned CSV into MySQL, execute the SQL scripts, then open `powerbi/Amazon_Fashion_Sales_Analysis.pbix`.

## 🛠️ Tools
- Python
- Pandas
- NumPy
- MySQL
- Power BI
- DAX
- Jupyter

## 🧹 Data Cleaning
- Removed duplicates
- Handled missing values
- Converted dates
- Standardized data types
- Created Year, Month, Quarter, Weekday and Promotion Used columns

## 🗄️ SQL Analysis
Modules:
- KPI Analysis
- Sales Analysis
- Product Analysis
- Geographic Analysis
- Fulfilment Analysis
- Promotion Analysis

## 💻 SQL Query Showcase

```sql
SELECT Year, Month_Num, Month,
ROUND(SUM(Amount),2) AS Revenue
FROM amazon_sales_data
GROUP BY Year, Month_Num, Month
ORDER BY Year, Month_Num;
```

```sql
SELECT Category,
ROUND(SUM(Amount),2) AS Revenue,
ROUND(SUM(Amount)*100/(SELECT SUM(Amount) FROM amazon_sales_data),2) AS Revenue_Percentage
FROM amazon_sales_data
GROUP BY Category;
```

```sql
SELECT ROUND(
COUNT(DISTINCT CASE WHEN Status='Cancelled' THEN `Order ID` END)*100/
COUNT(DISTINCT `Order ID`),2) AS Cancellation_Rate
FROM amazon_sales_data;
```

## 📊 Dashboards

### Executive Dashboard
![Executive Dashboard](screenshots/Executive_Dashboard.png)

### Product Insights Dashboard
![Product Insights Dashboard](screenshots/Product_Insights_Dashboard.png)

### Operations Dashboard
![Operations Dashboard](screenshots/Operations_Dashboard.png)

## 📌 Key Insights
- ₹78.57M revenue
- ~120K orders
- Set category generated the highest revenue
- Maharashtra was the top-performing state
- April recorded peak sales
- ~14.29% cancellation rate

## 📚 Skills Demonstrated
- Python
- SQL
- Power BI
- DAX
- Data Cleaning
- Business Intelligence
- Dashboard Design

## 🚀 Future Improvements
- Sales Forecasting
- Customer Segmentation
- Real-time Dashboards
- Inventory Analytics

## 👨‍💻 Author

**Samyak Gaikwad**

GitHub: https://github.com/samyak2305

LinkedIn: https://www.linkedin.com/in/samyak-gaikwad-30992236a/
