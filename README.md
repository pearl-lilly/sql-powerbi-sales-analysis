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
-*MySQL Workbench 8.x* – For structured SQL queries and database exploration
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
##  Highest Revenue-Generating Product (5-Year Overview)
Business Objective:
Identify the most profitable product and category over a 5-year period to guide strategic focus in marketing, inventory, and investment.

## Key Insight:
The Vitamin category led overall sales performance.
Within this category, Biotin generated the highest total revenue of $1,486,806 across all products.
Strategic Implication:
Biotin should be considered a flagship product. With its strong revenue performance, it's a top candidate for promotional campaigns, 
expanded distribution, or bundling strategies to drive even greater returns and capitalize on its proven market success.
## Recommendation
    * -*Marketing & Promotion:* Launch dedicated, high-impact campaigns positioning Biotin as a "hero product." Explore premium branding, influencer collaborations, and targeted digital advertising that highlight its long-term proven efficacy and customer loyalty.
    * -*Cross-Pollination of Success:** Analyze the marketing, pricing, and distribution strategies that work best for Biotin and assess their applicability to other products in the Vitamin category and potentially to high-potential products in *other* categories.
    * -*Experimentation Culture:* Implement A/B testing for product page optimization, marketing creatives, and pricing strategies across different product segments to continuously learn and improve.
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
###  Business Question  
**How has monthly revenue changed over time? Are there specific months or quarters when certain supplement products perform better?**

### 🔍 Summary of Findings  
To uncover seasonality patterns, I analyzed total revenue by product, year, and month.
 This helped identify peak performance months and revenue trends across the 5-year period.

### 💡 Key Insights:
- **Biotin** showed consistent peak performance, especially in:
  - **September 2024** ($38,346)
  - **June 2020** ($35,136)
  - **August 2020** ($35,039)
- **Melatonin** had high revenue in:
  - **July 2023** ($38,239)
  - **May 2021** ($34,463)
- **Whey Protein** peaked in **May 2023** ($38,217)
- **Pre-Workout** ranked high in:
  - **August 2020** ($37,575)
  - **January 2023** ($35,900)
  - **September 2024** ($34,616)
- **Vitamin C** revenue increased in cooler months:
  - **October 2023** ($36,244)
  - **July 2023** ($34,397)
- Supplements like **BCAA**, **Zinc**, **Iron Supplement**, and **Multivitamin** showed stable demand with strong seasonal variations.
## Strategic Recommendation
* **Action:** Adjust purchasing and inventory levels to accurately match anticipated seasonal demand for each product.
* **Why it helps:** This strategy prevents costly **stockouts** during peak seasons, avoiding lost sales, and simultaneously reduces **excess inventory** during off-peak times, minimizing carrying costs and potential waste.
* **How to do it:**
    * **Forecasting:** Develop refined monthly forecasts for each product, leveraging the 5-year historical data you've gathered.
    * **Pre-ordering:** Place larger orders for **Vitamin C** well in advance of October, and for **Whey Protein, Melatonin, and Pre-Workout** before May.
    * **Buffer Stock:** Maintain a slightly higher buffer stock for consistently high-performing products like **Biotin** around its peak months to ensure availability.
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
### Business Question  
**What is the distribution of sales across the three locations (Canada, USA, UK), and has this changed over the years?**
### 🔍 Summary of Findings  
By grouping total revenue by country and year, I identified how each region contributed to total sales over a 6-year period. The analysis highlights shifting market dominance and performance stability by geography.
### 💡 Key Insights:
- **2020–2022**: Sales were fairly competitive across all three countries, with Canada and the UK slightly ahead of the USA.
- **2023**: The UK took the lead with $1,572,626 in revenue, followed by Canada and then the USA.
- **2024**: Canada saw a major spike, generating $1,563,908 — overtaking both the UK and the USA.
- **2025 (YTD)**: The revenue gap has narrowed significantly — Canada ($356,967), UK ($354,328), and USA ($311,303) are nearly equal, indicating a **balanced distribution** and possibly a plateau.
This shows that while Canada and the UK have alternated leadership over the years, the **USA has maintained steady growth**, and **2025 indicates a shift toward equal market presence**.
### Strategic Recommendations
* **Action:** Proactively plan for a future where all three markets contribute equally, leveraging the strengths of each to build a truly diversified global strategy.
* **Why it helps:** This forward-looking approach ensures that your international strategy remains coherent and maximizes the collective potential of your top markets, providing diversification and reducing reliance on any single region.
* **How to do it:**
    * **Shared Best Practices:** Establish a system for sharing successful marketing campaigns, sales tactics, and operational efficiencies between the USA, Canada, and UK teams. What works well in the USA might be adaptable for the others.
    * **Global Resource Allocation Model:** Develop a flexible model for allocating marketing and operational resources across these three markets based on real-time performance and growth potential, rather than fixed budgets.
    * **Cross-Market Campaigns:** Explore unified campaigns or product launches that can run simultaneously across all three markets, leveraging economies of scale where cultural relevance allows.
    * **Benchmarking:** Continue to monitor competitor performance and market trends across all three regions to identify new opportunities or threats and maintain your competitive edge in a balanced market.
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
### Business Question  
**Which e-commerce platform (Amazon, Walmart, iHerb) has performed best in terms of total revenue and total units sold?**
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
##  Business Question
**How do return rates vary across different product categories? Which products have the highest and lowest return rates?**
To understand product performance and customer satisfaction, I calculated the return rate for each product by comparing
the number of units returned to units sold. This helps identify which products are more frequently returned and which ones maintain consistent buyer trust.
### 💡 Key Insights
Highest return rates were seen in **Vitamin C**, **Electrolyte Powder**, and **Magnesium**.
Lowest return rates occurred in **Ashwagandha**, **Zinc**, and **Fish Oil**.
This analysis reveals product satisfaction trends and helps guide inventory and marketing decisions.
### Strategic Recommendations
### Benchmarking & Context
- *Exceptional Performance*: The  observed return rates (around 1%) are remarkably low, especially compared to the typical e-commerce average of 15-20%. This suggests strong customer satisfaction, accurate product descriptions, or effective quality control.
It's valuable to know if these low rates are consistent across all product categories.
### Understanding "Why" (Critical Next Step)
- *Reasons for Returns*: The most impactful insight will come from understanding why products are being returned. Without this data, solutions are speculative. Implement a system to collect categorized return reasons (e.g., damaged, wrong item, didn't meet expectations, change of mind).
For **Vitamin C**, **Electrolyte Powder**, and **Magnesium** (the highest return items), dive into specific customer feedback.
Are there common complaints about taste, **effectiveness**, **packaging**, **or perceived quality**?
### 🧾 SQL Query Used
```sql
select  
       Category,
       Product_Name,
       sum(Units_Returned) as returned,
       sum(Units_Sold) AS total_sold,
  ROUND(SUM(Units_Returned) / SUM(Units_Sold) * 100, 2) AS return_rate_per
from
       sales_data
group by
        Category, Product_Name
order by
       returned desc;
```
### 🔍 Business Question  
**For each location, which supplement category drives the most unit sales?**
Understanding Regional Supplement Preferences
This analysis identifies the most popular product categories (based on units sold) for key international markets: the USA, UK, and Canada.
The findings highlight distinct regional health priorities, informing tailored marketing and product development strategies.
### 💡 Core Insights
**Vitamins** dominate in the **USA and UK**, indicating a strong consumer focus on general wellness and immune support in these regions.
Mineral supplements are the top choice in Canada, suggesting different, perhaps more specific, health concerns or awareness among Canadian consumers.
###  Strategic Recommendations
- *. Product Development & Bundling*
- *USA & UK*: Consider vitamin bundles tailored to specific needs (e.g., "Winter Wellness Vitamin Pack," "Daily Vitality Multivitamin"). Explore niche vitamin formulations.
- *Canada*: Develop or highlight mineral blends that address common Canadian health concerns (e.g., a "Stress & Sleep Mineral Complex" featuring Magnesium, or "Bone & Joint Support" including Calcium and trace minerals).
###  🧾 SQL Query Used
```sql
select 
       Location,
        highest_unit as Units_Sold,
       Category
from(
select
       Location,
       sum(Units_Sold) as highest_unit,
       Category,
rank() over(partition by Location order by sum(Units_Sold) desc ) as total_unit
from
       sales_data
group by
        Category ,Location) cat_unit
where
        total_unit = 1
order by
        Location desc ;
```
| Location | Units Sold | Top Product Category |
|----------|------------|----------------------|
| USA      | 41,713     | Vitamin              |
| UK       | 43,533     | Vitamin              |
| Canada   | 41,642     | Mineral              |
*Table for location, category based on units solds*

### 🔍 Business Question 
**What is the average annual revenue generated by each supplement product category from 2020 to 2025?**
Understanding these averages allows us to identify the most consistent and significant revenue contributors over a multi-year period, guiding long-term strategic investments and resource allocation.
### 💡 Insights from Average Revenue & Trends
Combining these average figures with our understanding of recent trends:
- *Strong Core Performers*: Categories like Performance, **Amino Acid** , **Omega**, **Fat Burner**, **Protein**, and **Vitamin** demonstrate consistently high average annual revenues. These are the established pillars of our revenue stream.
- *Note for Amino Acid & Omega*: While their averages are high, previous trend analysis indicates recent fluctuations (Amino Acid peaking in 2023 and declining, Omega showing general volatility). Their high average is largely driven by strong performance in earlier years.
- *Rising Star*: Hydration holds a respectable average, and its previous trend analysis showed consistent year-over-year growth. This suggests it's a rapidly expanding market segment that is increasing its overall contribution.
- *Areas for Re-evaluation*: Herbal and especially Sleep Aid exhibit the lowest average annual revenues. Sleep Aid's lower average is directly linked to its significant decline in 2024-2025 from a 2023 peak, indicating potential market shifts or competitive pressures.
### 🚀 Strategic Recommendations
- *Maximize & Diversify Strong Performers (Performance, Amino Acid, Omega, Fat Burner)*:
- *Action*: Continue strong support and marketing for these categories, but with an emphasis on understanding the drivers of volatility (for Performance and Omega) and addressing recent declines (for Amino Acid).
- *Tactics*: For volatile categories, monitor market trends closely, explore new formulations or use cases, and diversify sourcing if raw material price fluctuations are an issue. For Amino Acid, a deep dive into competitive landscape and consumer needs is crucial to stabilize or reverse the decline.
###  🧾 SQL Query Used
```sql
select
        Category,
       avg(Revenue) as average,
       year(sale_date) as year
from
        sales_data
group by
        Category, year(sale_date)
order by
        year(sale_date) desc;
```
| Product Category | Average Annual Revenue (2020–2025) |
|------------------|-------------------------------------|
| Performance      | $5,270.53                          |
| Amino Acid       | $5,267.28                          |
| Omega            | $5,237.31                          |
| Fat Burner       | $5,226.78                          |
| Protein          | $5,212.23                          |
| Vitamin          | $5,208.91                          |
| Hydration        | $5,184.11                          |
| Mineral          | $5,117.11                          |
| Herbal           | $5,113.03                          |
| Sleep Aid        | $5,032.95                          |
*Table for Average Annual Revenue by Product Category (2020–2025)*

### 🔍 Business Question 
**Which specific combination of product category, retail platform, and location yields the highest revenue?**
This analysis aims to pinpoint the most financially impactful segment of the business as represented in the provided data.

### 💡 Insight
The **Electrolyte Powder** sold through **iHerb** in the **UK** is identified as the absolute top-performing specific combination in this dataset, indicating it's generating the most substantial revenue for the business, given our assumption that higher units sold equates to higher revenue. This highlights a particularly potent alignment between product demand, a specific sales channel, and a receptive market. It suggests a "sweet spot" where product appeal is maximized by its distribution method and market fit.

### Strategic Recommendations
* -*Deep Dive into Revenue Drivers:
- *Action*: Beyond just units, investigate the specific factors that make Electrolyte Powder on iHerb UK a revenue powerhouse. This includes analyzing its average selling price, any promotions run, marketing spend, customer acquisition cost, and repeat purchase rates within this exact channel.
- *Tactics*: Conduct detailed cost-per-acquisition analysis, profitability analysis for this specific SKU/channel, and qualitative research (e.g., customer surveys, review analysis) to understand the value proposition resonating most.
- *Rationale*: Gain a comprehensive understanding of the true profitability and scalability of this segment to maximize its financial yield.
###  🧾 SQL Query Used
```sql
select
       Product_Name,
       Location,
       Plaform,
       sum(Revenue) as highest_revenue
from
        sales_data
group by
        Product_Name, Location,Plaform
order by
        highest_revenue desc;
```

##  🔍 Business Question 
**Product Return Analysis: Gross vs. Net Revenue Performance**
This analysis compares gross and net revenue rankings across our product categories to understand the impact of customer returns. We aimed to identify if return behavior disproportionately affects any specific category or alters their overall performance ranking.
### 💡 Insight
Our investigation reveals a **consistent return pattern across all product categories**. Despite varying return volumes, every category maintained its relative ranking when comparing gross revenue to net revenue (after accounting for returns). This suggests a healthy and proportional relationship between sales and returns.

* **Rank Stability:** All product categories retained their original positions in the ranking, even after accounting for returns. This indicates that return behavior is relatively consistent and does not skew category performance.
* **Top Performers Remain Strong:** The **Vitamin and Mineral** categories continue to be our top performers in both gross and net revenue. While they experience the highest absolute number of returns in units, this is primarily due to their higher sales volume, not a result of poor product performance or disproportionately high return rates.
* **Proportional Return Patterns:** No single category stands out as underperforming due to an unusually high return rate. Return patterns are proportional across the board.
##  Strategic Recommendation
  **Prioritize High Net Revenue Categories:**
    * **Action:** Focus retention and marketing efforts on high net revenue categories like **Vitamin, Mineral, and Performance**.
    * **Reason:** These categories consistently deliver the most value even after returns. Leverage data to **personalize marketing** and consider enhanced **loyalty programs** for customers in these segments.
 **Refine Return Process and Policy (Consideration):**
    * **Action:** Review the current return process for efficiency and customer experience. Explore options like incentivizing **exchanges over refunds** or, for very low-value items, potentially allowing customers to keep the product to save on reverse logistics costs.
    * **Reason:** A transparent and easy return process builds customer confidence, but optimizing it can also reduce operational costs and retain more revenue.
### 🧾 SQL Query Used
```sql
SELECT
    Category,
    SUM(Revenue) AS gross_revenue,
    SUM(Units_Returned) AS total_units_returned,
    SUM(Units_Sold) AS total_units_sold,

    -- Calculate the estimated revenue lost due to returns for each product
    SUM(
        CASE
            WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
            ELSE 0 
        END
    ) AS estimated_return_revenue_loss,

    -- Calculate Net Revenue
    SUM(Revenue) - SUM(
        CASE
            WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
            ELSE 0
        END
    ) AS net_revenue,

    -- Rank based on Gross Revenue
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS gross_revenue_rank,

    -- Rank based on Net Revenue
    RANK() OVER (ORDER BY (
        SUM(Revenue) - SUM(
            CASE
                WHEN Units_Sold > 0 THEN Units_Returned * (Revenue / Units_Sold)
                ELSE 0
            END
        )
    ) DESC) AS net_revenue_rank
FROM
    sales_data
GROUP BY
    Category
ORDER BY
    gross_revenue_rank;
<details>
<summary>✅ Conclusion</summary>

This project provided a comprehensive analysis of supplement sales data using **SQL** for robust querying and **Power BI** for dynamic visualization. By exploring sales trends, product performance, return rates, and revenue breakdowns across platforms and regions, we uncovered key insights that support strategic decision-making.

Each finding was paired with clear, business-focused recommendations to help drive growth, reduce inefficiencies, and optimize marketing and inventory strategies.

This project not only demonstrates proficiency in SQL and Power BI, but also highlights the value of translating raw data into actionable insights that address real-world business challenges in the health and wellness sector.
<summary>🔍 Limitations</summary>

- The dataset does not include customer-level information, which limits behavioral or demographic analysis.  
- External factors like marketing campaigns, seasonal demand, or stock availability were not included in the dataset.    
- Return reasons were not specified, so return rate insights are based solely on quantity, not context.

<summary>🚀 Next Steps</summary>
- Incorporate time series analysis to uncover seasonal trends and performance over specific periods.  
- Enrich the dataset with customer demographics or feedback data to gain deeper consumer insights.  
- Analyze customer retention or product repurchase rates (if data becomes available).  
- Include cost of goods sold (COGS) data to enhance profitability analysis and refine margin insights.  












     
