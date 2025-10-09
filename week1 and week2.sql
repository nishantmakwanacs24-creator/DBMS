use mysql;
create database newdatabase;
use newdatabase;
create table person (driver_id varchar(10),
name varchar(20), 
address varchar(30),
primary key(driver_id));
create table car(reg_num varchar(10),model varchar(10),
year int, primary key(reg_num));
create table accident(report_num int, accident_date date, 
location varchar(20),primary key(report_num));
create table owns(driver_id varchar(10),reg_num varchar(10),
primary key(driver_id, reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
create table participated(driver_id varchar(10),
reg_num varchar(10),report_num int,damage_amount int,
primary key(driver_id,reg_num,report_num),foreign key(driver_id) references person(driver_id), 
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
insert into person(driver_id,name, address) values ('AO1','RICHARD','SRINIVAS NAGAR');
insert into person(driver_id,name, address) values ('AO2','PRADEEP','RAJAJI NAGAR');
insert into person(driver_id,name, address) values ('AO3','SMITH','ASHOK NAGAR');
insert into person(driver_id,name, address) values ('AO4','VENU','N R COLONY');
insert into person(driver_id,name, address) values ('AO5','JOHN','HANUMANTH NAGAR');
select * FROM person;
insert into car(reg_num,model,year) values ('KA052250','INDIACA','1990');
insert into car(reg_num,model,year) values ('KA031181','LANCER','1957');
insert into car(reg_num,model,year) values ('KA095477','TOYOTA','1998');
insert into car(reg_num,model,year) values ('KA053408','HONDA','2008');
insert into car(reg_num,model,year) values ('KA041702','AUDI','2005');
select *from car;
insert into owns(driver_id,reg_num) value('AO1','KA052250');
insert into owns(driver_id,reg_num) value('AO2','KA031181');
insert into owns(driver_id,reg_num) value('AO3','KA095477');
insert into owns(driver_id,reg_num) value('AO4','KA053408');
insert into owns(driver_id,reg_num) value('AO5','KA0541702');
select *from owns;
insert into accident(report_num,accident_date,location) values(11,'2003-01-01','Mysore road');
insert into accident(report_num,accident_date,location) values(12,'2004-02-02','south end circle');
insert into accident(report_num,accident_date,location) values(13,'2003-01-21','bull temple road');
insert into accident(report_num,accident_date,location) values(14,'2008-02-17','Mysore road');
insert into accident(report_num,accident_date,location) values(15,'2005-03-04','kanakpura road');
select*from accident;
insert into participated(driver_id,reg_num,report_num,damage_amount) values('AO1','KA052250',11,10000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values('AO2','KA053408',12,50000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values('AO3','KA095477',13,25000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values('AO4','KA031181',14,3000);
insert into participated(driver_id,reg_num,report_num,damage_amount) values('AO5','KA041702',15,5000);
update participated set damage_amount=25000 where reg_num='KA53408' and report_num=12;
select*from participated;
insert into accident values(16,'2008-03-15','Mysore road');
select*from accident;
select accident_date ,location from accident;
select driver_id from participated where damage_amount>=25000;
select * from car order by year asc;
select * from car order by year desc;
select count(distinct P.report_num) from participated P,car C where P.reg_num=C.reg_num and C.model='lancer';
select * from participated order by damage_amount desc;
select avg(damage_amount) from participated;
set sql_safe_updates =0 ;
delete from participated where damage_amount<=(select avg_damage from (select avg(damage_amount) as avg_damage from participated) as temp );
select * from participated;
select max(damage_amount) from participated;
select distinct pe.name,pa.damage_amount from participated pa,person pe where pa.driver_id =pe.driver_id and pa.damage_amount>(select avg(damage_amount) from participated);
select count(distinct driver_id) from participated p,accident a where p.report_num = a.report_num and a.accident_date like '2008%';
