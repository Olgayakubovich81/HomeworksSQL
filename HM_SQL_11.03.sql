
-- Вывести имя, фамилию пользователей и даты их заказов(order_date)
use homework1;

select t1.cust_first_name,
t1.cust_last_name, t2.order_date
from customers t1 
join orders t2 on t1.customer_id= t2.customer_id;

-- Вывести даты заказов продуктов и описание этих продуктов(product_description)
select t1.order_date, t3.product_description
from orders t1
join order_items t2 on t1.order_id= t2.order_id
join product_information t3 on t2.product_id= t3.product_id;

-- Вывести имя, фамилию пользователей, даты заказов(orderdate), 
-- описание продуктов, которые они заказали и категории соответствующих продуктов (categoryname).
select
t1.cust_first_name, t1.cust_last_name, t2.order_date, t4.product_description, t5.category_name
from customers t1
join orders t2 on t1.customer_id=t2.customer_id
join order_items t3 on t2.order_id=t3.order_id
join product_information t4 on t3.product_id=t4.product_id
join categories_tab t5 on t4.category_id= t5.category_id;

-- Вывести названия(productname), описания категорий(categorydescription) 
-- и количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.

select t1.product_name, t2.category_description, t3.quantity, t1.MIN_PRICE
from product_information t1
join categories_tab t2 on t1.category_id=t2.category_id
join order_items t3  on t1.product_id= t3.product_id
where t1.MIN_PRICE> 300;
 
 -- Вывести имя, фамилию покупателей, которые купили принтеры.
 
select t1.cust_first_name, t1.cust_last_name, t5.category_description
from customers t1
join orders t2 on t1.customer_id=t2.customer_id
join order_items t3 on t2.order_id=t3.order_id
join product_information t4 on t3.product_id=t4.product_id
join categories_tab t5 on t4.category_id= t5.category_id
where category_description like 'printers';

-- Вывести имя, фамилию всех женатых мужчин покупателей, которые покупали продукты со стоимостью (list_price) больше 550.
select t1.cust_first_name, t1.cust_last_name 
from customers t1 
join orders t2 on t1.customer_id=t2.customer_id
join order_items t3 on t2.order_id=t3.order_id
join product_information t4 on t3.product_id=t4.product_id
where t1.marital_status = 'Married'
and t1.gender = 'M' 
and t4.list_price > 550;


 -- Вывести названия(product_name) тех продуктов, у которых стоимость больше, чем у продукта 'LaserPro 600/6/BW’.             
select t1.product_name
from product_information t1
join product_information t2 on t1.list_price > t2.list_price
where t2.product_name = 'LaserPro 600/6/BW';
 












