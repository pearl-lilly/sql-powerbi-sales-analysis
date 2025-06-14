-- What is the distribution of sales across the three locations (USA, UK, Canada)? 
-- Has this distribution changed over the years
select 
Location,
year(sale_date) as year,
sum(Revenue) as  revenue
from sales_data
group by Location, year(sale_date)
order by year(sale_date) desc;