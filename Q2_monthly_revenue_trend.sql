-- How has weekly or monthly revenue changed over time? 
-- Are there specific months or quarters when certain supplements sell better?
select 
Product_Name,
year(sale_date) as year,
date_format(sale_date,'%m') as month,
sum(Revenue) as total_revenue
from sales_data
group by year(sale_date), month, Product_Name
order by year(sale_date) desc;
