create table employees1 (
	employeeid int primary key auto_increment,
	fname varchar (100) not null,
    lastname varchar (100) not null,
     email varchar (100) not null,
      phone varchar (100) not null
    	);
        
alter table employees1
add salary numeric (9, 2);

alter table employees1
modify column salary int;

alter table employees1
change fname first_name varchar (100); 

alter table employees1
drop column phone;

alter table employees1
add department varchar(100) not null;

 insert into employees1 (first_name, lastname, email, salary, department)
    values ('Mark','Tiller', 'marktiller@gmail.com', 10500, 'Accounting'),
           ('Rosa','Schneider', 'rosaschneider@gmail.com', 7800, 'Marketing'),
           ('Silvia','Tobolski','silviatobolski@gmail.com', 11800, 'Management'),
           ('Mila','Tuban', 'milatuban@gmail.com', 9300, 'Engineering'),
            ('Eva','Koral', 'evakoral@gmail.com', 8900, 'Engineering'),
            ('Tom',  'Teiler','tomteiler@gmail.com', 8100, 'Marketing'),
            ('Dick', 'Vinner', 'dickvinner@gmail.com', 11300, 'Accounting')
            ;

