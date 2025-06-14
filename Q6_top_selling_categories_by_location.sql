-- For each location, which product categories are most popular based on units sold?
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
from sales_data
group by Category ,Location) cat_unit
where total_unit = 1
order by Location desc ;