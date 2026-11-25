USE Retail_Analytics;
GO

/*
PROJECT: Retail Sales & Inventory Analytics
REPORT: Data Quality Summary
DATABASE: Retail_Analytics

OBJECTIVE:
Summarize data completeness, uniqueness,
validity and relationship integrity across
the six project tables.
*/

-- =========================================
-- 1. OVERALL RECORD COUNT
-- =========================================

select 'customers' as table_count, count(*) as missing_count from customers
union all
select 'orders',count(*) as missing_count from orders
union all
select 'products',count(*) as missing_count from products
union all
select 'suppliers',count(*) as missing_count from suppliers
union all
select 'order_items',count(*) as missing_count from order_items
union all
select 'product_supplier',count(*) as missing_count from Product_supplier;

select 'Customers' as table_name,'first_name' as column_name,count(*) as missing_count
from customers
where first_name is null
union all
select 'Customers' as table_name,'last_name',count(*) as missing_count
from customers
where last_name is null
union all
select 'Customers' as table_name,'email',count(*) as missing_count from customers
where email is null
union all
select 'orders','total_amount',count(*) as missing_count from orders where total_amount is null
union all
select'products','category',count(*) as missing_count from products where category is null
union all
select 'products','stock_level',count(*) as missing_count from products where stock_level is null
union all
select 'products','price',count(*) as missing_count from products where price is null
union all
select 'suppliers','contact_email',count(*) as missing_count from suppliers where contact_email is null
union all
select 'suppliers','phone',count(*) as missing_count from suppliers where phone is null
union all
select 'Order_Items','quantity',count(*) as missing_count from Order_items where quantity is null
union all
select 'Order_Items','discount_amount',count(*) as missing_count from Order_items where discount_amount is null
union all
select 'Order_Items','unit_price ',count(*) as missing_count from Order_items where unit_price is null
union all
select 'Product_Supplier','lead_time_days',count(*) as missing_count from Product_Supplier where lead_time_days is null
union all
select 'Product_Supplier','minimum_order_quantity',count(*) as missing_count from Product_Supplier where minimum_order_quantity is null
union all
select 'Product_Supplier','supply_frequency_days',count(*) as missing_count from Product_Supplier where supply_frequency_days is null;

SELECT COUNT(*) AS missing_email_count
FROM customers
WHERE email IS NULL;



select 'customers' as table_name,
id as Record_id,
count(*) as duplicate_count
from customers
group by id
having count(*)>1
union all
select 'Orders',id as Record_id,count(*) as duplicate_count
from orders
group by id
having count(*)>1
union all
select 'products',id as Record_id,
count(*) as dupliacte_count
from products
group by id
having count(*)>1
union all
select 'suppliers',
id as Record_id,
count(*) as duplicate_count
from Suppliers
group by id
having count(*)>1
union all
select 'order_items',id as Record_id,
count(*) as duplicate_count
from order_items
group by id
having count(*)>1
union all
select 'Product_Supplier',id as Record_id,
count(*) as duplicate_count
from Product_Supplier
group by id
having count(*)>1;

select 'Customers' as table_name,'id' as column_name, count(*) as Missing_ID_count from customers where id is null
union all
select 'Orders' as table_name,'id', count(*) as Missing_ID_count from Orders where id is null
union all
select 'Products' as table_name,'id', count(*) as Missing_ID_count from Products where id is null
union all
select 'suppliers' as table_name,'id', count(*) as Missing_ID_count from suppliers where id is null
union all
select 'Order_items' as table_name,'id', count(*) as Missing_ID_count from Order_items where id is null
union all
select 'Product_supplier' as table_name,'id', count(*) as Missing_ID_count from Product_supplier where id is null;


select 'orders' as table_name,'customer_ID' as column_name,
count(*)as Missing_count
from orders
where customer_ID is null
union all
select 'Order_items','Order_ID',count(*)as Missing_count
from Order_items
where Order_ID is null
union all
select 'Order_items','Product_ID',count(*)as Missing_count
from Order_items
where Product_ID is null
union all
select 'Product_Supplier','product_id',count(*)as Missing_count
from Product_Supplier
where product_id is null
union all
select 'Product_Supplier','supplier_id',count(*)as Missing_count
from Product_Supplier
where supplier_id is null;

select a.customer_id
from orders a
left join customers b
on a.customer_id =b.id
where a.customer_id is not null
and b.id is null;

select a.order_id
from order_items a
left join orders b
on a.order_id =b.id
where a.order_id is not null
and b.id is null;

select a.product_id
from Order_items a
left join products b
on a.product_id = b.id
where a.product_id is not null
and b.id is null;

select a.supplier_id
from Product_supplier a
left join Suppliers b
on a.supplier_id =b.id
where a.supplier_id is not null
and b.id is null;

--
select id from products
where stock_level <0
union all
select id from products
where price <=0;

select 'orders' as table_name,'negative_total_amount' as column_name,total_amount from orders where total_amount <=0
union all
select 'orders','shipping_cost',shipping_cost from orders where shipping_cost<0
union all
select 'orders','discount_amount',discount_amount from orders where discount_amount<0;

select 'order_items' as table_name,'quantity' as column_name
from Order_items
where quantity<=0
union all
select 'order_items','discount_amount'
from Order_items
where discount_amount<0
union all
select 'order_items','unit_price'
from Order_items
where unit_price<=0;


select 'Product_Supplier' as table_name,'lead_time_days' as column_name
from product_supplier
where lead_time_days<0
union all
select 'product_supplier','minimum_order_quantity'
from Product_supplier
where minimum_order_quantity<=0
union all
select 'product_supplier','supply_frequency_days'
from Product_supplier
where supply_frequency_days<=0;

select 'customers' as table_count, count(*) as missing_count from customers
union all
select 'orders',count(*) as missing_count from orders
union all
select 'products',count(*) as missing_count from products
union all
select 'suppliers',count(*) as missing_count from suppliers
union all
select 'order_items',count(*) as missing_count from order_items
union all
select 'product_supplier',count(*) as missing_count from Product_supplier;


