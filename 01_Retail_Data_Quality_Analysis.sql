use Retail_Analytics;
go
/*
PROJECT: Retail Sales & Inventory Analytics
PHASE: SQL Data Quality Analysis
DATABASE: Retail_Analytics
TOOL: SQL Server Management Studio

OBJECTIVE:
To validate data completeness, uniqueness, consistency
and relationships across six database tables.
*/

-- =========================================
-- 1. CUSTOMERS TABLE – DATA QUALITY CHECKS
-- =========================================

select count(*) as total_count
from customers;

select id,count(*) as duplicate_count
from customers
group by id
having count(*)>1;

select id as customer_id
from customers
where id is null;

select count(*) as missing_first_last_name
from customers
where first_name is null
or last_name is null;

select count(*) as missing_email
from customers
where email is null;

select count(*) as email_format_missing
from customers
where email is not null
and email not like '%@%';

-- =========================================
-- 2. ORDERS TABLE – DATA QUALITY CHECKS
-- =========================================

select count(*) as total_count
from orders;

select id,count(*) as duplicate_count
from orders
group by id
having count(*)>1;

select count(*) as missing_order_ids
from orders
where id is null;

select count(*) as missing_customer_id
from orders
where customer_id is null;

select count(*) as missing_order_dates
from orders
where order_date is null;

select count(*) as missing_total_amount
from orders
where total_amount is null;

select discount_amount
from orders
where discount_amount<=0; 

select total_amount
from orders
where total_amount<=0; 

select o.customer_id
from orders o
left join customers c
on o.customer_id = c.id
where o.customer_id is not null
AND c.id is null;

-- =========================================
-- 3.Products – Data Quality Tasks
-- =========================================
select count(*) as total_count
from products;


select id, count(*) as duplicate_count
from products
group by id
having count(*)>1;

select count(*) missing_id_count
from Products
where id is null;

select count(*) missing_name_count
from Products
where name is null;

select count(*) missing_category_count
from Products
where category is null;

select count(*) missing_stock_level_count
from Products
where stock_level is null;

select count(*) missing_price_count
from Products
where price is null;

select price
from products
where price <=0;

select stock_level as below_level
from products
where stock_level<=10;

select id,
created_at
from products
where created_at>='2021-01-01'
and created_at<'2022-01-01';

select id
from products
where stock_level<=0;


-- =========================================
-- 4.Suppliers – Data Quality Tasks
-- =========================================

select count(*) as total_count
from suppliers;

select id,count(*) as duplicate_cnt
from suppliers
group by id
having count(*)>1;

select count(*) as missing_id_cnt
from suppliers
where id is null;

select count(*) as missing_name_cnt
from suppliers
where name is null;

select count(*) as missing_contact_email_cnt
from suppliers
where contact_email is null;

select count(*) as missing_phone_cnt
from suppliers
where phone is null;

select contact_email
from suppliers
where contact_email is not null
and contact_email not like '%@%';

select name
from suppliers
where contact_email is null
and phone is null;

-- =========================================
-- 4.Order_Items – Data Quality Tasks
-- =========================================

select count(*) as total_count
from order_items;

select count(*) as missing_id_cnt
from order_items
where id is null;

select count(*) as missing_order_id_cnt
from order_items
where order_id is null;

select count(*) as missing_product_id_cnt
from order_items
where product_id is null;

select count(*) as missing_quantity_cnt
from order_items
where quantity is null;

select count(*) as missing_discount_amount_cnt
from order_items
where discount_amount is null;

select count(*) as missing_unit_price_cnt
from order_items
where unit_price is null;

select discount_amount
from Order_items
where discount_amount<0;

select unit_price
from Order_items
where unit_price<=0;

select count(*) as unmatched_order_ids
from order_items a
left join orders b
on a.order_id = b.id
where a.order_id is not null
and b.id is null;

select count(*) as unmatched_product_id
from order_items a
left join products b
on  a.product_id=b.id
where a.product_id is not null
and b.id is null;

select a.product_id,b.name as product_name,
sum(a.quantity*a.unit_price) as total_product_amount
from order_items a
left join products b
on a.product_id =b.id
group by a.product_id,b.name
order by total_product_amount desc;

select id, count(*) as duplicate_cnt
from order_items
group by id
having count(*)>1;

select order_id
from order_items
where quantity<=0;

--Product_Supplier – Data Quality Tasks

select * from Product_Supplier;

select count(*) as total_count
from Product_Supplier;

select id,count(*) as duplicate_count
from Product_supplier
group by id
having count(*)>1;

select count(*) as missing_id_cnt
from product_supplier
where id is null;

select count(*) as missing_product_id_cnt
from product_supplier
where product_id is null;

select count(*) as missing_supplier_id_cnt
from product_supplier
where supplier_id is null;

select count(*) as missing_lead_time_days_cnt
from product_supplier
where lead_time_days is null;

select count(*) as missing_minimum_order_quantity_cnt
from product_supplier
where minimum_order_quantity is null;

select count(*) as missing_supply_frequency_days_cnt
from product_supplier
where supply_frequency_days is null;

select lead_time_days as limit
from product_supplier
where lead_time_days<=10;

select count(*) as matching_cnt
from product_supplier a
left join products b
on a.product_id = b.id
where a.product_id is not null
and b.id is null;

select count(*) as matching_cnt
from product_supplier a
left join suppliers b
on a.supplier_id =b.id
where a.supplier_id is not null
and b.id is null;

select count(distinct(id)) as unique_cnt
from product_supplier;

select lead_time_days
from product_supplier
where lead_time_days <0;

select minimum_order_quantity
from product_supplier
where minimum_order_quantity<=0;

select supply_frequency_days
from product_supplier
where supply_frequency_days<=0;

SELECT p.id, p.name, p.category
FROM products p
LEFT JOIN order_items oi
    ON p.id = oi.product_id
WHERE oi.product_id IS NULL;




