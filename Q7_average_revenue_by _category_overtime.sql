-- What is the average revenue per product category over time? 
-- Have certain categories shown consistent growth
select Category,
avg(Revenue) as average,
year(sale_date) as year
from sales_data
group by Category, year(sale_date)
order by year(sale_date) desc;