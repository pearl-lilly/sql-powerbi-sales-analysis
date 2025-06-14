-- Which combination of product, platform, and location yields the highest revenue?
select
Product_Name,
Location,
Plaform,
sum(Revenue) as highest_revenue
from sales_data
group by Product_Name, Location,Plaform
order by highest_revenue desc;