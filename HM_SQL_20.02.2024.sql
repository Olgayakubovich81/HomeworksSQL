create database homework;

-- Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, 
-- для marketing 25%, для HR 20% и для IT 35%. 

set sql_safe_updates = 0;

update employees
set salary =
case 
when  department = 'sales' then salary * 1.2
when  department = 'finance' then salary * 1.15
when  department = 'shipping' then salary * 1.1
when  department = 'marketing' then salary * 1.25
when  department = 'HR' then salary * 1.2
when  department = 'IT' then salary * 1.35
else salary
 end; 
 
 -- Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 
 
select salary as new_salary
from employees;

-- Создать поле new_salary типа numeric(7, 2)

alter table employees
add column new_salary numeric (7,2);

-- Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, 
-- для shipping 10%, для marketing 25%, для HR 20% и для IT 35%.

update employees
set new_salary =
case 
when  department = 'sales' then salary * 1.2
when  department = 'finance' then salary * 1.15
when  department = 'shipping' then salary * 1.1
when  department = 'marketing' then salary * 1.25
when  department = 'HR' then salary * 1.2
when  department = 'IT' then salary * 1.35
else salary
 end; 

-- Вывести из таблицы employees firstname как username, lastname как surname и 
-- новое поле fullname, которое состоит из имен и фамилий сотрудников.

select first_name as username, last_name as surname,  
concat (first_name, ' ', last_name) as fullname
from employees;

-- Вывести новое поле commission, которое будет null, если зарплата сотрудника 
-- меньше 3000, будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и 
-- будет 20, если зарплата больше/равно 9000.

select case 
when salary < 3000 then null
when salary < 6000 then 10
when salary < 9000 then 15
else 20
end as commission
from employees;

-- Создать новое поле commission и соответственно заполнить.
alter table employees
add column commission int;


update employees
set commission =
case 
when salary < 3000 then null
when salary < 6000 then 10
when salary < 9000 then 15
else 20
end; 
  
-- Создать поле finalsalary и заполнить формулой salary + salary * commission / 10. 
-- Проверить commission на null, так чтобы в случае неопределенности 
-- finalprice принимал значение salary. 

alter table employees
add column finalsalary int;

update employees
set finalsalary = 
case 
        when commission is null then salary
        else salary +salary * commission / 10
        end; 

-- Вывести поле email в нижнем регистре.

select lower (email)
from employees;

-- Создать новое поле chk_email типа varchar(128).

alter table employees
add column chk_mail varchar (128);

alter table employees
change column chk_mail chekemail varchar (128);

-- Заполнить поле chekemail. Если длина email меньше 3, значением chkemail будет '
-- Введите больше символов', если длина email больше/равно 3 и меньше 7,  
-- значением chkemail будет 'Кол/во символов совпадает', 
-- если длина email больше/равно 7,  
-- значением chkemail будет 'Введите меньше символов'.

update employees
set chekemail=
case 
     when length (email) < 3 then 'Введите больше символов'
    when length (email) >=3 and length (email) <7 then 'Колличество символов совпадает'
    when length (email) >=7 then 'Введите меньше символов'
        end;
        
    set sql_safe_updates = 1;
     

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
 
 