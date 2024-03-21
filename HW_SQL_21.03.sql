-- Вывести максимальный и минимальный credit_limit.
use homework1;
select  max(credit_limit), min(credit_limit)
from customers;

-- Вывести покупателей у которых creditlimit выше среднего creditlimit.
select cust_first_name, cust_last_name
from customers
where credit_limit> (select avg(credit_limit) from customers); 

-- Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
select count(*) as customer_count
from customers
where cust_first_name like '%D' and credit_limit>500; 

-- Найти среднее значение unit_price
select avg(Unit_price) as average_unit_price 
from order_items;

-- Таблицы - orderitems, productinformation
-- Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

select t1.product_name, t2.quantity
from product_information t1
join order_items t2 on t1.product_id= t2.product_id
where t2.quantity < (select avg(quantity) from order_items);

-- Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
select t1.cust_first_name, t1.cust_last_name
from customers t1
join orders t2 on t1.customer_id=t2.customer_id
where t2.order_total=(select max(order_total)from orders);
 
-- Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.
select sum(t2.order_total)
from customers t1
join orders t2 on t1.customer_id=t2.customer_id
where t1.marital_status= 'married'and t1.gender='M';






