create table customer_exp8_csa_47 (customer_id varchar(20),customer_name varchar(20),contact_no number(10),address varchar(20),city varchar(20),postal_code number(6),country varchar(20),primary key(customer_id)); 
create table employee_exp8_csa_47 (employee_id varchar(20),last_name varchar(20),first_name varchar(20),birth_date date ,photo varchar(20),primary key(employee_id)); 
create table order_exp8_csa_47 (order_id varchar(20),customer_id varchar(20),employee_id varchar(20),order_date date ,shipper_id varchar(20),primary key(order_id),foreign key(employee_id) references employee_exp8_csa_47(employee_id),foreign key(customer_id) references customer_exp8_csa_47(customer_id) );

insert into customer_exp8_csa_47 values('C1','John Doe', 1202555014,'123 Maple Street','Springfield', 62701,'USA'); 
insert into customer_exp8_csa_47 values('C2','Priya Sharma', 9876543210, '45 MG Road','Mumbai', 400001,'India'); 
insert into customer_exp8_csa_47 values('C3','Alice Smith', 2079460958,'78 Baker Street','London',623451,'UK'); 
insert into customer_exp8_csa_47 values('C4','Maria Garcia', 4911234567,' 22 Gran Via', 'London', 28013,' UK'); 
insert into customer_exp8_csa_47 values('C5','Luca Rossi', 0612345678,' 10 Via Roma',' Boston', 00184,' USA'); 
insert into customer_exp8_csa_47 values('C6','Mary John', 9834512340,'20 Oak Land','London', 12003,'UK'); 
insert into customer_exp8_csa_47 values('C7','Michael Smith',3498560120,'42 High Street','London', 93423,'UK'); 
select * from customer_exp8_csa_47; 

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';--to set default date format in a worksheet

Insert Into employee_exp8_csa_47 Values ('E1','Brown','James','16-May-1984',Null); 
Insert Into employee_exp8_csa_47 Values ('E2','Patel','Anjali','29-Aug-1991',Null);
Insert Into employee_exp8_csa_47 Values ('E3','Silva','Fernandas','18-Jun-1975',Null);
Insert Into employee_exp8_csa_47 Values ('E4','Williams','Ethan','14-May-2001',Null);
Insert Into employee_exp8_csa_47 Values ('E5','Kim','Hana','22-Nov-2002',Null);
select * from employee_exp8_csa_47;

Insert Into order_exp8_csa_47 Values('O1','C1','E1','30-Nov-2022','SH1');
Insert Into order_exp8_csa_47 Values('O2','C4','E2','14-May-2023','SH10');
Insert Into order_exp8_csa_47 Values('O3','C2','E4','07-Aug-2023','SH32');
Insert Into order_exp8_csa_47 Values('O4','C5','E3','22-Jan-2024','SH67'); 
Insert Into order_exp8_csa_47 Values('O5','C1','E4','19-Mar-2024','SH23'); 
Insert Into order_exp8_csa_47 Values('O6','C1','E2','19-Jul-2024','SH98'); 
select * from order_exp8_csa_47;

select * from customer_exp8_csa_47 Order By Customer_Name asc;
Select * From order_exp8_csa_47 Order By Order_date Asc;
Select * From employee_exp8_csa_47 Where Birth_date>'31-Dec-1980' Order By Birth_date Asc;
Select * From order_exp8_csa_47 Where Customer_Id In (Select Customer_Id From customer_exp8_csa_47 Where Country='USA')Order By Order_date Desc; 
select customer_id,count(order_id) from order_exp8_csa_47 group by customer_id;
select city,count(customer_id)from customer_exp8_csa_47 Group By city; 
select * from customer_exp8_csa_47 where customer_id in(select customer_id from order_exp8_csa_47 group by customer_id having count(*)>2); 
SELECT city, COUNT(*) AS customer_count FROM customer_exp8_csa_47 GROUP BY city HAVING COUNT(*) > 3;

commit;
