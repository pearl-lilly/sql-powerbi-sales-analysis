-- Which e-commerce platform (Amazon, Walmart, iHerb)
 -- has performed best in terms of revenue and units sold?
 select
 Plaform,
sum(Units_Sold) as total_units,
sum(Revenue) as total_revenue
from sales_data
group by Plaform
order by total_revenue desc;