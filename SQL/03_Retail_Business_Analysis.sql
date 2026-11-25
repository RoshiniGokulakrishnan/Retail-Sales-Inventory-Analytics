USE Retail_Analytics;
GO

select sum(total_amount) as total_sales_amount
from orders;

select avg(total_amount) as aov
from orders;

select year(order_date) as year,sum(total_amount) as total_sales_amount
from orders
group by year(order_date);

select year(order_date) as year,month(order_date) as month,sum(total_amount) as total_sales_amount
from orders
group by month(order_date),year(order_date)
order by year asc,month asc;

select customer_id,count(*) as customer_total_order
from orders
group by customer_id;

select customer_id,sum(total_amount) as total_amount
from orders
group by customer_id;

select customer_id,avg(total_amount) as Aov
from orders
group by customer_id;

select customer_id, count(*) as count
from orders
group by customer_id
having count(*)>3;

select top 10 customer_id,sum(total_amount) as total_spend
from orders
group by customer_id
order by total_spend desc;
--
select b.category,sum(a.quantity) as prod_total_quantity
from order_items a
left join products b
on a.product_id = b.id
group by b.category;

select product_id,sum(unit_price*quantity) as  total_sales
from order_items
group by product_id;

select top 10 product_id,sum(unit_price*quantity) as total_sales
from order_items
group by product_id
order by total_sales desc;

select product_id, sum(quantity) as total_quantity
from order_items
group by product_id;

select * from products; -id;

select * from orders; customer_id,order_id;

select * from order_items;order_id, product_id;

select a.id as product_id
from products a
left join order_items b
on a.id = b.product_id
where a.id is not null
and b.product_id is null;


select supplier_id,count(*) as total_prod
from Product_supplier
group by supplier_id;

select supplier_Id, count(*) as supply_count
from Product_supplier
group by supplier_Id
having count(*)>5;

select supplier_id,avg(lead_time_days) as avg_tlead_time
from Product_supplier
group by supplier_id;

select supplier_id,min(minimum_order_quantity) as minimum_quantity
from Product_supplier
group by supplier_id;

select supplier_id, count(*) as number_of_prod_supplied,
dense_rank()over(order by count(*) desc) as DR
from Product_supplier
group by supplier_id;


select year(order_date) as year,count(*) as total_orders
from orders
group by year(order_date)
order by year asc;

select month(order_date) as month,
count(*) as total_orders
from orders
group by month(order_date)
order by month asc;

select year(order_date) as year,
avg(total_amount) as average_order_amount
from orders
group by year(order_date)
order by year asc;

select top 1 month(order_date) as month,
count(*) as number_of_orders
from orders
group by month(order_date)
order by number_of_orders desc;


select year(order_date) as year,
DATEPART(QUARTER,order_date) as Quarter,
sum(total_amount)as total_sales
from orders
group by year(order_date),DATEPART(QUARTER,order_date)
order by year asc, Quarter asc;


