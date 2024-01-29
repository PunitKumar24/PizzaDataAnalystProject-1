select * from pizza_sales

--1. Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales

--2.Average Order Value
select sum(total_price)/count(distinct order_id) as Average_Order_Values from pizza_sales

--3.Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales

--4.Total Orders
select count(distinct order_id) from pizza_sales

--Average Pizza Per Order
select cast(sum(quantity ) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) from pizza_sales

use PizzaDB;

select * from pizza_sales;

--1.Daily Trend for Total Orders

select Datename(dw, order_date) as Order_day, COUNT(Distinct order_id) as Average_order 
from pizza_sales
group by Datename(dw, order_date);

--2.Monthly Trend for Total Orders

select DATENAME(month, order_date) as Order_month, count(Distinct order_id) as Average_order
from pizza_sales
group by DATENAME(month, order_date)

--3.Percentage of Sales by Pizza Category

select distinct(pizza_category), cast(sum(total_price)*100/
(select sum(total_price) from pizza_sales) as decimal(10,2)) as Total_Sales
from pizza_sales
group by pizza_category

--4.Percentage of Sales By Pizza Size
select distinct(pizza_size), cast(sum(total_price)*100/
(select sum(total_price) from pizza_sales) as decimal(10,2)) as Total_sales
from pizza_sales
group by pizza_size

--5.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

select top 5 pizza_name, sum(total_price) as total_sales, 
sum(quantity) as Total_qunatity,
count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by total_sales desc 


--6. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

select top 5 pizza_name, sum(total_price) as total_sales, 
sum(quantity) as Total_qunatity,
count(distinct order_id) as Total_orders
from pizza_sales
group by pizza_name
order by total_sales  