-- 1. Выведите бортовые номера и дальность полета всех ближне- и дальнемагистральных самолетов. 
-- Примечание: ближнемагистральными считайте те, дальность полета которых > 1000 км и <= 2500 км. 
-- Дальнемагистральными — с дальностью полета >= 6000 км.
-- В выборке должны присутствовать два атрибута — side_number и range.


Select side_number 
from airliners
where (range_ > 1000 AND range_ <= 2500) 
or range_ >= 6000;


-- 2. Выведите идентификаторы билетов бизнес-класса дешевле 65 000 
-- и экономкласса дороже 15 000. 
-- Исключите из выборки билеты рейсов 
-- VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.

Select id 
from tickets
where (price < 65000 and service_class = 'Business')
or (price > 15000 and service_class = 'Economy')
and trip_id not in ('VR5SF5YIWN', 'OZAO28DLFP', 'LL4S1G8PQW');

-- 3. Номера некоторых билетов рейса RL6EC4YWB1 внесены в базу некорректно: 
 -- два последних символа билетов серии UE01H8UCJQXX введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. 
-- Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id. 

Select client_id
from  tickets
where trip_id = 'RL6EC4YWB1'
and (id like 'UE01H8UCJQ__' or id is null);


-- 6. Найдите данные обо всех билетах с классом обслуживания не Economy и не Business. 
-- Таблица tickets может содержать значения NULL. 
-- В выборке должны присутствовать два атрибута — id, trip_id.

select id, trip_id
from tickets
where service_class not in ('Economy', 'Business') or service_class is null;

-- 4. Для каждого самолета модели Cessna 172 выведите дальность полета. 
-- Имя столбца с результатом должно быть max_distance.
-- В выборке должен присутствовать один атрибут — max_distance.
-- alias - псевдоним

select
	range_ as max_distance
from airliners
where model_name = 'Cessna 172';


 -- 5. Вывести имена пассажиров и их номера телефонов.
-- Имя пассажира выводится в поле client_name
-- Вывести два атрибута: client_name и client_phone

select
	name as client_name,
    phone as client_phone
from clients;

-- Для тех, кому скучно :)

-- 1. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.

select name
from clients
where (id like '%RCB' or id like '%FCV') 
and phone not like '+705%';


-- 2. После каждого рейса проходит плановая уборка салона. 
-- Результаты уборки вносятся в отчет-лист. 
-- Авиакомпания получила отчет, в котором указано, что во всех самолетах все места чистые, а спинки кресел исправные.
-- Выведите бортовой номер самолета, cформировав для каждой строки поле index с значением 'clean'.
-- В выборке должны присутствовать два атрибута — side_number и index.


select side_number, 'clean' as status
from airliners;

-- Для тех, кому скучно :)

-- 1. Найдите коды всех рейсов, которые прибыли в пункт назначения и идентификатор 
-- которых начинаются на 'Y'. 
-- Название столбца в выборке должно быть flight. 
-- Отсортируйте выборку по коду рейса в порядке возрастания.
-- В выборке должен присутствовать один атрибут — flight.

select id as flight
from trips
where status = 'arrived' and id like 'Y%'
order by id;

-- 2. Выведите идентификаторы и коды перелета для рейсов, использующих 
-- самолеты с идентификаторами 00095579, 00045877 и 00619341. 
-- Отсортируйте вхождения по коду аэропорта назначения в порядке возрастания. 
-- При одинаковых аэропортах назначения отсортируйте по коду перелета в порядке убывания. 
-- В выборке должны присутствовать два атрибута — id, trip_code.

Select id, trip_code
from trips
where airliner_id in ('00095579', '00045877', '00619341')
order by arrival, trip_code desc;

-- 3. Владельцам аэропорта необходимо возместить ущерб пассажирам, чей багаж намок 
-- по вине его сотрудников. 
-- Возврату подлежат 2500 у. е. за один купленный билет.
-- Определите номер билета и разницу от его стоимости и той суммы, которую получит пассажир. 
-- Известно, что нет билетов дешевле 2500 у. е.
-- Идентификатор рейса — 87RVI5T7A2.
-- В выборке должны присутствовать два атрибута — id, returns.

select id , price - 2500 as returns
from tickets 
where trip_id = '87RVI5T7A2'and price > 2500
order by price - 2500

-- 6. Определите id рейсов, которые должны были вылететь из аэропорта Домодедово (DME), 
-- но были отменены (cancelled).
-- В выборке должен присутствовать один атрибут — id.

select id
from trips
where departure = 'DME' and status = 'cancelled';



