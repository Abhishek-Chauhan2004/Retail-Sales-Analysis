--1.View full data

select * from retail

--2.Total Sales (Overall Revenue)

select sum(total_sale) as total_revenue
from retail

--3.Total Sales by Category

select category,
sum(total_sale) as total_revenue
from retail
group by category
order by total_revenue desc


--4.Total Quantity Sold by Category

select category,
sum(quantity) as total_quantity
from retail
group by category


--5.Average Sale Value

select Round(avg(total_sale)) as average_sale
from retail

--6.Sales by Gender

select gender,
sum(total_sale) as total_sales
from retail
group by gender

--7.Monthly Sales Trend

select sale_month,
sum(total_sale) as total_sales
from retail
group by sale_month

--8.Top 5 Highest Sales Transactions

select * 
from retail
order by total_sale desc
limit 5

--9.Profit Calculation

select total_sale, cogs,
(total_sale - cogs) as profit
from retail

--10.Total Profit by Category

select category,
Round(sum(total_sale - cogs)) as total_profit
from retail
group by category
order by total_profit desc

--11.Customers Count by Category

select category, 
count(distinct customer_id) as total_customer
from retail
group by category
order by total_customer desc

--12.Sales by Age Group

select
case
when age < 25 then 'under 25'
when age between 25 and 40 then '25-40'
when age between 40 and 60 then '41-60'
else '60+'
end as age_group,
sum(total_sale) as total_sales
from retail
group by age_group
order by  total_sales desc

--13.Daily Sales

select sale_date,
sum(total_sale) as total_sales
from retail
group by sale_date
order by total_sales desc limit 10

--14.Category-wise Average Price

select category,
round(avg(price_per_unit)) as average_price
from retail
group by category

--15.Identify Loss-Making Transactions

select * from retail
where total_sale < cogs