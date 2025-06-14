-- Which product categories and specific products generated the
-- highest total revenue over the 5-year period
select 
Category,
Product_Name,
sum(Revenue) as total_revenue
from sales_data
where sale_date between '2020-01-01' and '2025-01-01'
group by Category, Product_Name
order by total_revenue desc
limit 1;