use shop;

-- Найти общую сумму заказов для каждого клиента.
select t2.cname, sum(t1.AMT) as total_order_amount 
from orders t1
join customers t2 on t1.cust_id=t2.cust_id
group by t2.cname;

-- Получить количество заказов для каждого продавца.
 select count(t1.order_id) as total_order_number, t2.sname
 from orders t1 
 join sellers t2 on t1.sell_id=t2.sell_id
 group by t2.sname;
 
 -- Получить количество клиентов с рейтингом выше среднего.
 select count(cust_id) as customers_count, rating 
 from customers 
 group by rating
 having rating> (select avg(rating) from customers);
 
-- Получить количество клиентов в каждом городе с рейтингом выше 200.
select count(cust_id) as cust_count, city
from customers
where rating >200
group by city;

-- Получить количество заказов, сделанных в каждый месяц.
select count(order_id) as total_order_number, monthname(odate) as order_month
from orders
group by order_month;

-- Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.
select t1.cname, sum(t2.amt) as total_order_amount
from customers t1
join orders t2 on t1.cust_id=t2.cust_id
group by t1.cname, t1.cust_id
having sum(t2.amt> (select avg (t2.amt) from orders t2)); 

 
 
 

