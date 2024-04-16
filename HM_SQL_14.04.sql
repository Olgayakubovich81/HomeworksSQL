-- Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.
use airport;
select count(*) as flightcount, t2.model_name
from trips t1
join airliners t2 on t1.airliner_id=t2.id
group by t2.model_name;

-- Вычислить среднюю стоимость билета по классам обслуживания. Вывести serviceclass и averageprice.
select avg(price) as averageprice, service_class
from tickets
group by service_class;

-- Определить средний возраст клиентов, сгруппированных по классу обслуживания. 
-- Вывести serviceclass и averageage.
select avg(t1.age) as averageage, t2.service_class
from clients t1
join tickets t2 on t1.id=t2.client_id
group by t2.service_class;

-- Получить общее количество билетов, купленных каждым клиентом. 
-- Вывести name и ticket_count.
select count(*) as ticket_count, t2.name
from tickets t1
join clients t2 on t1.client_id=t2.id
group by t2.name;

-- Определить количество рейсов, отправленных из каждого аэропорта. 
-- Вывести departure и departure_count.
select count(*) as departure_count, departure
from trips 
group by departure;

-- Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. 
-- Вывести country и total_sum.
select t1.country, sum(t3.price) as total_sum
from airliners t1
join trips t2 on t1.id=t2.airliner_id
join tickets t3 on t2.id= t3.trip_id
group by t1.country;












