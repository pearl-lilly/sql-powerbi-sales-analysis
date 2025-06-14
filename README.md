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

## 1. Highest Revenue-Generating Product (5-Year Overview)
Business Objective:
Identify the most profitable product and category over a 5-year period to guide strategic focus in marketing, inventory, and investment.

## Key Insight:
The Vitamin category led overall sales performance.
Within this category, Biotin generated the highest total revenue of $1,486,806 across all products.
Strategic Implication:
Biotin should be considered a flagship product. With its strong revenue performance, it's a top candidate for promotional campaigns, 
expanded distribution, or bundling strategies to drive even greater returns and capitalize on its proven market success.

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

* column chart visualizing the top selling product, i used powerbi generated this chart from mysql query results*




     
