use pizza

// KPI's'
select * from pizza_sales
 
select SUM(total_price) AS "Total Revenue" from pizza_sales

select SUM(total_price) / COUNT(DISTINCT order_id) as "Average Order Value" from pizza_sales

select SUM(Quantity) AS "Total Pizza Sold" from pizza_Sales

select SUM(Quantity) / Count(DISTINCT order_id) as "Average Pizza Per Orders" from pizza_sales

select CAST(SUM(Quantity) AS Decimal(10,2)) / CAST(Count(DISTINCT order_id) AS DECIMAL (10,2)) as "Average Pizza Per Orders" from pizza_sales

select CAST(CAST(SUM(Quantity) AS Decimal(10,2)) / CAST(Count(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) as "Average Pizza Per Orders" from pizza_sales
  
//Totals

select DATENAME(DW, order_Date) AS "Order Day" , COUNT(DISTINCT order_id) as "Total Order"
from pizza_sales Group by DATENAME(DW, order_Date)


select DATENAME(MONTH, order_Date) AS "Order Month" , COUNT(DISTINCT order_id) as "Total Order"
from pizza_sales Group by DATENAME(MONTH, order_Date) Order by "Total Order" Desc

select pizza_category, sum(total_price) *100 / (select sum(total_price) from pizza_sales) as PCT
from Pizza_sales
group by pizza_category

select pizza_size, sum(total_price) AS total_price,sum(total_price) *100 / (select sum(total_price) from pizza_sales) as PCT
from Pizza_sales group by pizza_size

select TOP 5 pizza_name , sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name 
order by total_revenue asc