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

### 1. **Amplify Flagship Product (Biotin) Dominance**

* **Action:** **Allocate disproportionate resources** to Biotin across marketing, inventory, and product development to solidify its market leadership and extract maximum value.
* **Implementation:**
    * **Marketing & Promotion:** Launch dedicated, high-impact campaigns positioning Biotin as a "hero product." Explore premium branding, influencer collaborations, and targeted digital advertising that highlight its long-term proven efficacy and customer loyalty.
    * **Inventory & Supply Chain Optimization:** Implement a robust forecasting model for Biotin to ensure **zero stockouts**. Negotiate more favorable bulk purchasing agreements with suppliers to improve margins. Consider dedicated warehousing space or faster fulfillment paths for this product.
    * **Product Evolution:** Invest in R&D to explore Biotin variations (e.g., higher potency, different delivery methods like liquid/gummies, specialized formulations) or complementary products that can be bundled to increase Average Order Value (AOV).
    * **Customer Experience:** Prioritize customer support and feedback channels specifically for Biotin to maintain its high satisfaction levels and identify opportunities for continuous improvement.

### 2. **Leverage Category Leadership (Vitamin) Insights for Portfolio Expansion**


* **Action:** **Deep-dive into the Vitamin category's success factors** and apply them to identify and nurture the *next* wave of high-growth products within this category and potentially others.
* **Implementation:**
    * **Sub-Category Analysis:** Break down the Vitamin category further. What specific trends or customer needs within "Vitamins" are driving Biotin's success? (e.g., beauty from within, general wellness, specific deficiencies).
    * **Identify "Rising Stars":** Within the Vitamin category, pinpoint other products that show significant growth potential (e.g., high year-over-year growth, strong customer reviews, emerging market trends) even if their current revenue is modest compared to Biotin.
    * **Cross-Pollination of Success:** Analyze the marketing, pricing, and distribution strategies that work best for Biotin and assess their applicability to other products in the Vitamin category and potentially to high-potential products in *other* categories.
    * **Innovation Pipeline:** Use insights from the Vitamin category's success to inform the entire product development pipeline, focusing on areas with proven customer demand and high profitability.


### 3. **Enhance Data-Driven Decision Making & Feedback Loops**

* **Action:** **Integrate deeper analytics and customer feedback mechanisms** to inform every aspect of product management, from development to marketing and sales.
* **Implementation:**
    * **Unified Data Platform:** Ensure that sales, marketing, returns, customer service, and inventory data are integrated for a holistic view of product performance.
    * **Customer Journey Mapping:** Understand how customers discover, purchase, use, and potentially return products across all categories. Identify friction points and opportunities for delight.
    * **Voice of Customer (VoC):** Systematically collect and analyze customer reviews, surveys, and direct feedback for *all* products, not just Biotin. This can reveal unexpected insights for improvement or new product ideas.
    * **Experimentation Culture:** Implement A/B testing for product page optimization, marketing creatives, and pricing strategies across different product segments to continuously learn and improve.


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

### 1. **Implement Season-Specific Marketing Campaigns**


* **Action:** Align marketing efforts precisely with identified peak performance months for each product.
* **Why it helps:** This ensures your promotional spend is most effective when customer interest is naturally highest, leading to higher conversion rates and better return on investment (ROI).
* **How to do it:**
    * **Cooler Months (October - January):** Heavily promote **Vitamin C** and **Multivitamin** as essential for immune support. Consider bundling them with other "wellness" products.
    * **Pre-Summer/Fitness Season (May - August):** Focus on **Melatonin** (for summer travel/sleep cycle changes), **Whey Protein**, and **Pre-Workout** for fitness goals. Tailor messaging to "summer body," "energy boost," or "recovery."
    * **Consistent/All-Year:** While Biotin has specific peaks, its overall consistency means it should have a baseline marketing presence, with additional boosts during its identified high months (June, August, September).
    * **Always-On (Stable Demand):** For **BCAA, Zinc, and Iron Supplement**, maintain a consistent presence, but look for micro-seasonal opportunities (e.g., "energy for busy holiday season" for Iron, "recovery after intense summer workouts" for BCAA).


### 2. **Optimize Inventory and Supply Chain Based on Peaks**


* **Action:** Adjust purchasing and inventory levels to accurately match anticipated seasonal demand for each product.
* **Why it helps:** This strategy prevents costly **stockouts** during peak seasons, avoiding lost sales, and simultaneously reduces **excess inventory** during off-peak times, minimizing carrying costs and potential waste.
* **How to do it:**
    * **Forecasting:** Develop refined monthly forecasts for each product, leveraging the 5-year historical data you've gathered.
    * **Pre-ordering:** Place larger orders for **Vitamin C** well in advance of October, and for **Whey Protein, Melatonin, and Pre-Workout** before May.
    * **Buffer Stock:** Maintain a slightly higher buffer stock for consistently high-performing products like **Biotin** around its peak months to ensure availability.

</details>

### 3. **Bundle and Cross-Promote Strategically**

<details>
<summary>Details for Bundling & Cross-Promotion</summary>

* **Action:** Create compelling product bundles that leverage seasonal relevance and the complementary usage of different supplements.
* **Why it helps:** This tactic effectively increases your **average order value (AOV)** and introduces customers to other relevant products in your catalog, fostering broader product discovery.
* **How to do it:**
    * **"Immunity Boost" Bundle:** Combine **Vitamin C + Zinc + Multivitamin** for the cooler months (October-March).
    * **"Workout Power Pack" Bundle:** Group **Whey Protein + Pre-Workout + BCAA** for the fitness-focused season (April-August).
    * **"Rest & Restore" Bundle:** Pair **Melatonin** with a calming supplement or a specific vitamin (e.g., Magnesium) during periods associated with sleep changes or stress (e.g., summer travel).


### 4. **Deep Dive into Peak Drivers (Beyond Seasonality)**


* **Action:** Investigate the underlying reasons *why* certain products peak in specific months, looking beyond general seasonality to identify specific external factors.
* **Why it helps:** Understanding these deeper drivers allows you to replicate past success and predict future trends with greater accuracy, making your strategies more proactive.
* **How to do it:**
    * **External Events:** Did any specific health trends, social media challenges, competitor campaigns, or major holidays coincide with the observed peaks? For instance, **January peaks for Pre-Workout** strongly align with New Year's fitness resolutions.
    * **Marketing Correlation:** Review your own past marketing activities. Were there specific campaigns or promotions that directly contributed to these peak sales periods?
    * **Customer Feedback:** Analyze patterns in customer reviews or inquiries during peak times; these often provide direct insights into why demand increased.

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
# Recommendations: Optimizing International Market Strategy for Balanced Growth


## Strategic Recommendations

### 1. **Solidify and Accelerate Growth in the USA**

* **Action:** Double down on strategies that have driven the consistent growth in the USA market, while exploring avenues for further acceleration.
* **Why it helps:** The USA is a reliable growth engine. Understanding and replicating its success, and then pushing for more, will yield significant returns and provide a stable base for international operations.
* **How to do it:**
    * **Deep-Dive Analysis:** Identify the specific factors contributing to the USA's steady growth. Is it specific product lines, marketing channels, customer segments, or distribution efficiencies? Pinpoint these drivers.
    * **Increased Investment:** Allocate additional marketing budget and sales resources to the USA, focusing on channels and campaigns proven to be effective. Consider expanding your sales force or digital advertising spend.
    * **Localization Refinement:** Even with current growth, continuously refine product messaging, promotional offers, and customer service to resonate even more deeply with the diverse US consumer base.
    * **Strategic Partnerships:** Explore new retail partnerships, e-commerce platforms, or collaborations within the USA that align with your brand and can unlock new customer segments.


### 2. **Stabilize and Optimize Performance in Canada & the UK**

* **Action:** Implement strategies to ensure consistent growth and reduce volatility in the Canadian and UK markets, moving them towards sustained performance rather than alternating leadership.
* **Why it helps:** While historically strong, their fluctuating leadership indicates potential for optimization. Achieving steady growth in these markets will create a more predictable and robust international portfolio, reducing overall business risk.
* **How to do it:**
    * **Identify Volatility Drivers:** Analyze the periods of decline or slower growth in Canada and the UK. Were these linked to specific product launches, competitor activity, economic shifts, or marketing changes?
    * **Targeted Marketing Campaigns:** Develop agile marketing strategies for each market that can quickly adapt to local trends or competitive pressures. Focus on building consistent brand awareness and loyalty.
    * **Localized Product & Pricing Strategies:** Review if product assortments or pricing structures in Canada and the UK are optimally aligned with local demand and competitive landscapes. Small adjustments can yield significant stability.
    * **Strengthen Distribution Channels:** Ensure robust and efficient supply chains and distribution networks in both countries to prevent delays or stockouts that could impact customer satisfaction and sales.

### 3. **Strategize for Future Balanced Market Presence**

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



### 🧪 Business Question  
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


##  🧪 Business Question
**How do return rates vary across different product categories? Which products have the highest and lowest return rates?**
To understand product performance and customer satisfaction, I calculated the return rate for each product by comparing
the number of units returned to units sold. This helps identify which products are more frequently returned and which ones maintain consistent buyer trust.

### 💡 Key Insights
Highest return rates were seen in **Vitamin C**, **Electrolyte Powder**, and **Magnesium**.
Lowest return rates occurred in **Ashwagandha**, **Zinc**, and **Fish Oil**.
This analysis reveals product satisfaction trends and helps guide inventory and marketing decisions.
### 🚀 Further Insights for Action
initial analysis highlights products with varying return rates, but to truly drive action, let's explore deeper:

### Benchmarking & Context
- *Exceptional Performance*: The  observed return rates (around 1%) are remarkably low, especially compared to the typical e-commerce average of 15-20%. This suggests strong customer satisfaction, accurate product descriptions, or effective quality control.
It's valuable to know if these low rates are consistent across all product categories.
- *Industry Comparison*: If available, compare the overall and category-specific return rates to industry benchmarks for health and wellness products. This provides crucial context on how well you're performing against competitors.
### Understanding "Why" (Critical Next Step)
- *Reasons for Returns*: The most impactful insight will come from understanding why products are being returned. Without this data, solutions are speculative. Implement a system to collect categorized return reasons (e.g., damaged, wrong item, didn't meet expectations, change of mind).
For **Vitamin C**, **Electrolyte Powder**, and **Magnesium** (the highest return items), dive into specific customer feedback.
Are there common complaints about taste, **effectiveness**, **packaging**, **or perceived quality**?
- *Cost of Returns*: Quantify the financial impact beyond just the rate. This includes **refunds**, **shipping costs (both ways)**, **restocking**, and **potential loss** if items can't be resold. Even **low rates** can accumulate significant costs.
### Trends & Customer Behavior
- *Return Rate Trends Over Time*: Are return rates for specific products increasing or decreasing? Are there seasonal patterns (e.g., post-holiday returns)? Trends can indicate underlying issues like a new quality control problem or a shift in customer expectations.
- *Customer Segmentation*: Do specific customer groups (e.g., new vs. repeat buyers, high-value customers) have different return behaviors? This could inform tailored marketing or onboarding strategies.
### Product & Supply Chain Deep Dives
- *Product Information Accuracy*: For higher-return items, review product descriptions, images, and marketing messages. Are they clear, comprehensive, and setting realistic expectations? Misaligned expectations often lead to returns.
-*Quality Control & Supply Chain*: Investigate if high return rates for certain products are linked to specific manufacturing batches, suppliers, or shipping methods. Damage during transit or defects from a particular production run can significantly impact returns.
### Actionable Strategies (Examples based on potential insights)*:
- *If "product not as described" is frequent*: Enhance product descriptions with more sensory details (e.g., taste, texture for powders), add more visual content (videos), and implement a customer Q&amp;A section.
- *If "damaged upon arrival" is common*: Review packaging for vulnerable products, or evaluate shipping partners for better handling.
- *If "not effective/didn't like" is a driver*: Consider offering smaller trial sizes for products like Vitamin C or Electrolyte Powder, and refine marketing messages to ensure realistic expectations about product benefits.
  - *For  top performers (Ashwagandha, Zinc, Fish Oil)*: Analyze what makes these products consistently satisfactory. Can those best practices (e.g., clear benefits, consistent quality, specific target audience) be applied to other product lines? Consider highlighting these products in marketing as "customer favorites."
By combining this quantitative analysis with qualitative insights into why returns happen, you can develop targeted strategies to further reduce returns, improve customer satisfaction, and optimize your inventory and marketing efforts.
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
### 🧠 Deeper Analysis
We delve into the potential reasons behind these observed preferences:
USA & UK (Vitamin Popularity)
- *Established Health Awareness*: Both markets have high consumer education regarding general health, leading to widespread adoption of vitamins for overall well-being.
- *Perceived Dietary Gaps & Lifestyle Stress*: Busy modern lifestyles often result in suboptimal diets, with consumers turning to vitamins to bridge perceived nutritional deficiencies and manage stress.
- *Immune Health Focus*: Recent global health events have significantly heightened demand for immune-supporting vitamins (e.g., Vitamin C, Vitamin D).
- *Sunlight Exposure Concerns*: Particularly in the UK, and seasonally in parts of the USA, lower sunlight exposure drives demand for Vitamin D supplementation.
- *Aging Populations*: Proactive health maintenance in an older demographic contributes to consistent vitamin sales for age-related concerns.
Canada (Mineral Popularity)
- *Targeted Deficiency Awareness*: Canadian consumers may have a heightened awareness or prevalence of specific mineral deficiencies.
- *Specific Mineral Benefits*: The popularity of minerals often links to their targeted benefits, such as Magnesium for muscle recovery, stress relief, and sleep, or Zinc for immunity.
- *Environmental & Lifestyle Factors*: Specific environmental conditions or common lifestyle challenges in Canada might lead consumers to seek mineral-based solutions for issues like sleep disturbances or muscle fatigue.
- *Healthcare Recommendations*: There might be a stronger emphasis or recommendation from Canadian healthcare professionals for specific minerals to address common health complaints.
### 🚀 Strategic Recommendations
Based on these insights, we recommend the following strategic actions to optimize business performance in each market:
- *1. Tailored Marketing Campaigns
USA & UK*:
Focus messaging on the holistic benefits of vitamins (energy, immunity, general well-being).
Emphasize specific vitamins like Vitamin D during colder, darker months.
Highlight how vitamins can support busy lifestyles and address common dietary gaps.
Canada:
Promote mineral-specific benefits, focusing on solutions for sleep, stress relief, muscle function, and targeted immunity (e.g., Zinc).
Create campaigns around the role of minerals in recovery for active individuals.
- *2. Localized Content & SEO
Develop region-specific blog content, articles, and SEO strategies that align with the top product category in each market*.
- *USA/UK*: Content on "Top Vitamins for Immune Support," "Boosting Energy with B Vitamins," "Understanding Vitamin D Needs."
- *Canada*: Content on "Magnesium for Better Sleep," "Minerals for Muscle Recovery," "Addressing Mineral Deficiencies in Your Diet."
Partner with local influencers and health professionals who resonate with the regional audience and can authentically promote the relevant product categories.
- *3. Product Development & Bundling*
- *USA & UK*: Consider vitamin bundles tailored to specific needs (e.g., "Winter Wellness Vitamin Pack," "Daily Vitality Multivitamin"). Explore niche vitamin formulations.
- *Canada*: Develop or highlight mineral blends that address common Canadian health concerns (e.g., a "Stress & Sleep Mineral Complex" featuring Magnesium, or "Bone & Joint Support" including Calcium and trace minerals).
### ✅ Impact on Business
Implementing these insights will significantly improve business performance by:
- *Increasing Relevance & Engagement*: Marketing messages will resonate more deeply, leading to higher customer engagement.
Optimizing Marketing Spend: Resources will be allocated more efficiently to campaigns with a higher return on investment.
- *Boosting Conversion Rates*: Customers are more likely to purchase products that directly address their perceived needs.
- *Building Brand Trust & Loyalty*: Demonstrating an understanding of regional health priorities fosters stronger customer relationships.
- *Gaining a Competitive Edge*: Differentiating the business by offering truly localized and relevant solutions.
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
Leveraging both the average revenue and trend insights for optimized strategy:
- *Maximize & Diversify Strong Performers (Performance, Amino Acid, Omega, Fat Burner)*:

- *Action*: Continue strong support and marketing for these categories, but with an emphasis on understanding the drivers of volatility (for Performance and Omega) and addressing recent declines (for Amino Acid).
- *Tactics*: For volatile categories, monitor market trends closely, explore new formulations or use cases, and diversify sourcing if raw material price fluctuations are an issue. For Amino Acid, a deep dive into competitive landscape and consumer needs is crucial to stabilize or reverse the decline.
- *Optimize & Innovate Core Staples (Protein, Vitamin)*:

- *Action*: Maintain market share and profitability through consistent quality, strong branding, and efficient operations.
- *Tactics*: Focus on customer loyalty programs, subtle product innovations (e.g., new flavors for Protein, improved bioavailability for Vitamins), and value-added content that reinforces their essential role in daily wellness.
- *Accelerate Growth in Rising Star (Hydration)*:

- *Action*: Significantly increase investment in this category to capitalize on its consistent upward trend.
- *Tactics*: Expand product lines (e.g., new formats, specialized hydration formulas), launch aggressive marketing campaigns to capture new customers, and secure strong distribution channels. This category has significant untapped potential to become a top-tier revenue driver.
- *Strategic Re-evaluation & Potential Rejuvenation (Herbal, Sleep Aid)*:

- *Action*: Critically assess the future viability and potential of these lower-average categories.
Tactics:
- *Sleep Aid*: Conduct urgent market research to identify reasons for its decline (e.g., competition, consumer shift to alternative remedies, product efficacy concerns). Consider a product reformulation, repositioning, or a targeted promotional push if a clear path to recovery is identified.
- *Herbal*: Investigate if its lower average indicates a niche market that could be better served, or if there's potential to broaden its appeal through education and new product introductions.
- *Decision*: Be prepared to either divest or significantly restructure strategy for these categories if a viable path to improved performance isn't evident.
### ✅ How This Analysis Improves the Business
This analysis, focusing on average annual revenue per category, provides invaluable insights that will drive several key business improvements:
**Optimized Resource Allocation**:

- *Improvement*: Instead of guessing, the business can now data-drivingly allocate financial, marketing, and R&D resources towards the categories that have historically delivered the most consistent and substantial revenue (e.g., Performance, Amino Acid, Omega, Fat Burner, Protein, Vitamin). It also highlights where increased investment is warranted due to strong growth trends (Hydration), even if its average isn't yet the highest.
- *Benefit*: Reduces wasted expenditure on underperforming areas and maximizes returns on investment in high-potential segments.
Enhanced Strategic Planning & Forecasting:

- *Improvement*: Understanding the average revenue provides a more stable baseline for future revenue forecasting and long-term strategic planning compared to volatile year-on-year figures alone. It helps in setting realistic targets and developing multi-year business plans.
- *Benefit*: Leads to more accurate financial projections, better inventory management, and more informed decision-making for expansion or contraction.
Targeted Product Development & Portfolio Management:

- *Improvement*: The analysis clearly identifies categories that are core to the business versus those requiring re-evaluation. This enables smarter product portfolio management.
- *Benefit*: Guides R&D to innovate within successful categories, helps determine if struggling lines need reformulation, repositioning, or even discontinuation, thus optimizing the product mix for overall profitability.
Risk Mitigation & Problem Identification:

- *Improvement*: Categories with lower average revenues or those showing declines (like Sleep Aid) are flagged, prompting immediate investigation into underlying issues.
- *Benefit*: Allows the business to proactively address problems such as increased competition, shifting consumer preferences, or product dissatisfaction before they significantly impact overall financial health.
- *Improved Competitive Positioning*:

- *Improvement*: By focusing efforts on categories where the business has a strong historical performance or significant growth potential, it can strengthen its market leadership in those segments.
- *Benefit*: Builds a more resilient and dominant market presence, making the business more attractive to customers and potential partners.
In essence, this average revenue analysis moves the business from reactive decision-making to a proactive, data-driven strategy, ensuring resources are deployed effectively to maximize revenue and profitability over the long term.
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

### 🚀 Strategic Recommendations
To capitalize on and learn from this top-performing revenue driver:

Deep Dive into Revenue Drivers:

- *Action*: Beyond just units, investigate the specific factors that make Electrolyte Powder on iHerb UK a revenue powerhouse. This includes analyzing its average selling price, any promotions run, marketing spend, customer acquisition cost, and repeat purchase rates within this exact channel.
- *Tactics*: Conduct detailed cost-per-acquisition analysis, profitability analysis for this specific SKU/channel, and qualitative research (e.g., customer surveys, review analysis) to understand the value proposition resonating most.
- *Rationale*: Gain a comprehensive understanding of the true profitability and scalability of this segment to maximize its financial yield.
- *Protect and Maximize this Revenue Stream*:

- *Action*: Prioritize robust inventory management and supply chain resilience for Electrolyte Powder specifically for iHerb UK.
- *Tactics*: Implement advanced forecasting models, secure favorable bulk purchasing agreements, and consider dedicated logistical pathways to ensure continuous availability and minimal stockouts. Explore premium versions or bundle offers that leverage this core product's strength to increase average transaction value.
- *Rationale*: Safeguard and grow the largest single revenue contributor.
  **Strategic Replication and Expansion**:

- *Action*: Analyze if the success model of Electrolyte Powder on iHerb UK can be adapted or replicated for other products, locations, or platforms to drive similar revenue generation.
Tactics:
- *Product Expansion*: Can other hydration products or related categories achieve similar success on iHerb UK?
- *Channel Expansion*: Can Electrolyte Powder gain a similar revenue foothold on other UK platforms (e.g., Amazon UK, Walmart UK)?
- *Geographic Expansion*: What elements of this success (product features, marketing, target audience) could be tested with Electrolyte Powder or similar products on iHerb in other countries (e.g., USA, Canada)?
- *Rationale*: Scale proven revenue models to unlock new growth opportunities across the business.
**Leverage Retailer Partnership**:

- *Action*: Utilize the strong performance data of Electrolyte Powder on iHerb UK to strengthen the relationship with iHerb globally.
- *Tactics*: Present this data to iHerb to negotiate better placement, joint marketing campaigns, or preferred partnership terms for other products or regions.
- *Rationale*: Transform individual product success into broader strategic advantages with key retail partners.
### ✅ How This Analysis Improves the Business
This laser-focused analysis on the single highest-revenue provides immediate and highly actionable benefits:

- *Direct Revenue Maximization*:

- *Improvement*: By identifying the absolute top revenue driver, the business can immediately direct its most significant efforts (marketing, supply, attention) to reinforce and grow its largest financial contributor.
- *Benefit*: Ensures that the primary source of income is robustly supported, leading to direct increases in overall revenue and profitability.
- *Optimized Resource Allocation*:

- *Improvement*: Provides crystal-clear guidance for where to invest. Instead of generalized efforts, resources are concentrated on the proven highest-yielding specific combination.
- *Benefit*: Reduces wasted expenditure on less effective channels or products, maximizing the return on every dollar spent.
- *Blueprint for Success (Replication)*:

- *Improvement*: This top-performing combination serves as a tangible blueprint. The business can meticulously analyze every aspect of its success (marketing strategies, pricing, product features, logistics specific to that channel).
- *Benefit*: Provides a clear model to emulate and adapt for other products, platforms, or locations, accelerating growth in new areas with lower risk.
-*Enhanced Strategic Negotiation*:

- *Improvement*: Possessing concrete data on top performance on a specific platform (iHerb) provides strong leverage in discussions with that retailer.
- *Benefit*: Facilitates securing better terms, increased visibility, or preferred partnership status, which can benefit the entire product portfolio on that platform.
- *Focused Problem Solving*:

- *Improvement*: While this analysis highlights success, it also implicitly guides attention away from less effective combinations, allowing for more focused problem-solving elsewhere.
- *Benefit*: Prevents dilution of effort and ensures that the business is always prioritizing its most impactful actions.
In essence, this analysis provides the business with an immediate, data-backed answer to "where are we making the most money right now?" allowing for swift, targeted actions to capitalize on that success and build a foundation for future growth.
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

# Product Return Analysis: Gross vs. Net Revenue Performance

## Overview

This analysis compares gross and net revenue rankings across our product categories to understand the impact of customer returns. We aimed to identify if return behavior disproportionately affects any specific category or alters their overall performance ranking.
### 💡 Insight
Our investigation reveals a **consistent return pattern across all product categories**. Despite varying return volumes, every category maintained its relative ranking when comparing gross revenue to net revenue (after accounting for returns). This suggests a healthy and proportional relationship between sales and returns.

Here are the key observations:

* **Rank Stability:** All product categories retained their original positions in the ranking, even after accounting for returns. This indicates that return behavior is relatively consistent and does not skew category performance.
* **Top Performers Remain Strong:** The **Vitamin and Mineral** categories continue to be our top performers in both gross and net revenue. While they experience the highest absolute number of returns in units, this is primarily due to their higher sales volume, not a result of poor product performance or disproportionately high return rates.
* **Proportional Return Patterns:** No single category stands out as underperforming due to an unusually high return rate. Return patterns are proportional across the board.
* **Healthy Return-to-Revenue Ratio:** The overall consistency signifies a healthy and manageable return-to-revenue ratio across our entire product portfolio.

---

## Deeper Insights

While the consistency is positive, further exploration reveals opportunities for optimization:

* **Understanding Return Reasons:** A critical next step is to analyze the **underlying reasons for returns** within each category. Are returns due to "buyer's remorse," product defects, inaccurate descriptions, or other factors? Collecting this data will provide actionable insights for product improvement or marketing adjustments.
* **Beyond Revenue Loss: Total Cost of Returns:** Returns incur costs beyond just lost revenue. We must consider **reverse logistics** (shipping, handling, restocking), **labor costs** (customer service, warehouse), and potential **environmental impact**. Understanding these total costs will give a more comprehensive view of return efficiency.
* **Customer-Level Behavior:** Analyzing return patterns at the **individual customer level** can reveal "serial returners" or identify if our most valuable customers (e.g., those buying Vitamins/Minerals) also have different return behaviors. This can inform personalized retention strategies.

## 🚀 Strategic Recommendations

Based on these findings and insights, we propose the following recommendations:

1.  **Continuous Performance Monitoring (Gross & Net):**
    * **Action:** Maintain diligent monitoring of both gross and net revenue.
    * **Reason:** While currently stable, ongoing tracking is crucial to identify any future shifts or emerging issues in return patterns. Consider integrating **leading indicators** (e.g., sudden spikes in specific return reasons) into monitoring.

2.  **Prioritize High Net Revenue Categories:**
    * **Action:** Focus retention and marketing efforts on high net revenue categories like **Vitamin, Mineral, and Performance**.
    * **Reason:** These categories consistently deliver the most value even after returns. Leverage data to **personalize marketing** and consider enhanced **loyalty programs** for customers in these segments.

3.  **Conduct Deeper Product-Level Analysis:**
    * **Action:** Perform a granular analysis at the **individual SKU level** within each category.
    * **Reason:** While category-level returns are stable, specific products might have disproportionately higher return rates that are masked by aggregate data. This analysis should aim for **root cause identification** (e.g., inaccurate product descriptions, quality control issues, packaging problems).

4.  **Refine Return Process and Policy (Consideration):**
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














     
