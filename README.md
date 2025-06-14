# sql-powerbi-supplement-sales-analysis
# Introduction
Unlock the true potential of your supplement sales data. This project delivers a sharp, business-focused analysis of key performance indicators, designed to support strategic decision-making and operational excellence. Utilizing SQL for robust data manipulation and Power BI for compelling visualizations, provides clear answers to critical business questions: Where are we generating the most revenue? Which products are driving growth (or returns)? How are our sales channels performing? Dive into the queries and interactive dashboards to leverage data for smarter investments, optimized inventory, and a stronger market position.
# Background
In today's data-rich environment, the ability to derive actionable insights from sales operations is a key differentiator. The supplement market, known for its high volume of transactions, diverse product categories (e.g., vitamins, minerals, protein, herbal), and multiple sales platforms (Amazon, Walmart, iHerb), generates a wealth of transactional data. This project was undertaken to harness this raw sales data, transforming it into clear, quantifiable metrics that reveal performance across products, locations, and e-commerce channels, ultimately guiding efforts to boost revenue and enhance efficiency in our supplement sales initiatives.

### To understand sales, profit across categories and locations in the supplement dataset, i asked this,
1. Which product categories and specific products generated the highest total revenue over the 5-year period?
2. How has  monthly revenue changed over time? Are there specific months or quarters when certain supplements sell better?
3. What is the distribution of sales across the three locations (USA, UK, Canada)? Has this distribution changed over the years?
4.  Which e-commerce platform (Amazon, Walmart, iHerb) has performed best in terms of revenue and units sold?
5.  How do return rates vary across different product categories? Which products have the highest and lowest return rates?
6.  For each location, which product categories are most popular based on units sold?
7. What is the average revenue per product category over time? Have certain categories shown consistent growth?
8. Which combination of product, platform, and location yields the highest revenue?
9. If we calculate net revenue (after accounting for returns), how does the ranking of products or categories change compared to gross revenue?

# 🛠 Tools Used
- *MySQL Workbench 8.x* – For structured SQL queries and database exploration
- *Power BI Desktop (June 2024 update)* – For visualizing trends and metrics
- *DAX (Data Analysis Expressions)* – For dynamic aggregations and custom metrics in Power BI

# Dashboard Overview
To translate the comprehensive SQL analysis into tangible, actionable insights, a dynamic Power BI dashboard has been developed. This interactive dashboard serves as the central hub for exploring the key findings, allowing stakeholders to easily visualize trends, drill down into specific performance metrics, and gain a holistic understanding of supplement sales. 
![Dashboard overview (2)](https://github.com/user-attachments/assets/a8eb9bcd-b20b-4bb9-bac6-ddbea5313719)
![Dashboard](https://github.com/user-attachments/assets/8e8f5949-157b-40c9-8ce9-72ce545ab383)

# 🔍 The Analysis

This project was designed to answer key business questions around supplement sales performance using SQL for data exploration
and Power BI for visualization. Each query provided insight into different aspects of the dataset, from revenue patterns to product and platform performance.

### 🧪 Business Question
## 1. Highest Revenue-Generating Product (5-Year Overview)
Business Objective:
Identify the most profitable product and category over a 5-year period to guide strategic focus in marketing, inventory, and investment.

## Key Insight:
The Vitamin category led overall sales performance.
Within this category, Biotin generated the highest total revenue of $1,486,806 across all products.
Strategic Implication:
Biotin should be considered a flagship product. With its strong revenue performance, it's a top candidate for promotional campaigns, 
expanded distribution, or bundling strategies to drive even greater returns and capitalize on its proven market success.
### 🧾 SQL Query Used
```sql
select 
       Category,
        Product_Name,
        sum(Revenue) as total_revenue
from sales_data
where
     sale_date between '2020-01-01' and '2025-03-31'
group by Category, Product_Name
order by total_revenue desc
limit 1;
```
 

### 🧪 Business Question  
**How has monthly revenue changed over time? Are there specific months or quarters when certain supplement products perform better?**

### 🔍 Summary of Findings  
To uncover seasonality patterns, I analyzed total revenue by product, year, and month.
 This helped identify peak performance months and revenue trends across the 5-year period.

### 💡 Key Insights:
- **Biotin** showed consistent peak performance, especially in:
  - **September 2024** (₦38,346)
  - **June 2020** (₦35,136)
  - **August 2020** (₦35,039)
- **Melatonin** had high revenue in:
  - **July 2023** (₦38,239)
  - **May 2021** (₦34,463)
- **Whey Protein** peaked in **May 2023** (₦38,217)
- **Pre-Workout** ranked high in:
  - **August 2020** (₦37,575)
  - **January 2023** (₦35,900)
  - **September 2024** (₦34,616)
- **Vitamin C** revenue increased in cooler months:
  - **October 2023** (₦36,244)
  - **July 2023** (₦34,397)
- Supplements like **BCAA**, **Zinc**, **Iron Supplement**, and **Multivitamin** showed stable demand with strong seasonal variations.

### 🧾 SQL Query Used
```sql
select 
       Product_Name,
       year(sale_date) as year,
       date_format(sale_date,'%m') as month,
       sum(Revenue) as total_revenue
from sales_data
group by
        year(sale_date), month, Product_Name
order by
        total_revenue desc;
```

### 🧪 Business Question  
**What is the distribution of sales across the three locations (Canada, USA, UK), and has this changed over the years?**


### 🔍 Summary of Findings  
By grouping total revenue by country and year, I identified how each region contributed to total sales over a 6-year period. The analysis highlights shifting market dominance and performance stability by geography.

### 💡 Key Insights:

- **2020–2022**: Sales were fairly competitive across all three countries, with Canada and the UK slightly ahead of the USA.
- **2023**: The UK took the lead with ₦1,572,626 in revenue, followed by Canada and then the USA.
- **2024**: Canada saw a major spike, generating ₦1,563,908 — overtaking both the UK and the USA.
- **2025 (YTD)**: The revenue gap has narrowed significantly — Canada (₦356,967), UK (₦354,328), and USA (₦311,303) are nearly equal, indicating a **balanced distribution** and possibly a plateau.

This shows that while Canada and the UK have alternated leadership over the years, the **USA has maintained steady growth**, and **2025 indicates a shift toward equal market presence**.


### 🧾 SQL Query Used
```sql
select 
       Location,
       year(sale_date) as year,
       sum(Revenue) as  revenue
from sales_data
group by
        Location, year(sale_date)
order by
        year(sale_date) desc;
```
| Year | Canada($)   | USA($)      | UK($)       |
|------|----------|----------|----------|
| 2020 | 1,474,112 | 1,327,318 | 1,521,966 |
| 2021 | 1,423,500 | 1,391,720 | 1,479,048 |
| 2022 | 1,538,239 | 1,400,584 | 1,434,000 |
| 2023 | 1,491,903 | 1,406,354 | 1,572,626 |
| 2024 | 1,563,908 | 1,523,470 | 1,342,008 |
| 2025 |   356,967 |   311,303 |   354,328 |
*Table for distribution of sales across location* 



### 🧪 Business Question  
**Which e-commerce platform (Amazon, Walmart, iHerb) has performed best in terms of total revenue and total units sold?**

---

### 💡 Key Insights:

- **iHerb** leads in both categories:
  - 🧾 **Total Revenue**: $7,855,289
  - 📦 **Total Units Sold**: 225,427
- **Amazon** follows closely:
  - 🧾 **Revenue**:  $7,669,489 
  - 📦 **Units Sold**: 220,623
- **Walmart** ranks third:
  - 🧾 **Revenue**: $7,388,576
  - 📦 **Units Sold**: 212,428

This indicates that **iHerb is the most effective platform** for supplement sales, outperforming its competitors in both sales volume and earnings. The tight margin between platforms also suggests strong market competition.

### 🧾 SQL Query Used
```sql
select
        Plaform,
       sum(Units_Sold) as total_units,
       sum(Revenue) as total_revenue
from
       sales_data
group by
        Plaform
order by
        total_revenue desc;
```
| Platform | Total Revenue ($) | Total Units Sold |
|----------|-------------------|------------------|
| iHerb    | 7,855,289         | 225,427          |
| Amazon   | 7,669,489         | 220,623          |
| Walmart  | 7,388,576         | 212,428          |
*Table for revenue, units sold by platform*







     
