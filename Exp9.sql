create table items_exp9_csa_47(item_id varchar(20) primary key,item_name varchar(50),category varchar(20),price number(10,3),instock int check(instock>=0));
create table customers_exp9_csa_47(custd_id varchar(20) primary key,cust_name varchar(20),address varchar(50),State varchar(20));
create table orders_exp9_csa_47(order_id varchar(20) primary key,item_id varchar(20),cust_id varchar(50),quantity int,order_date date,foreign key(item_id) references items_exp9_csa_47,foreign key(cust_id) references customers_exp9_csa_47);
create table delivery_exp9_csa_47(delivery_id varchar(20) primary key,cust_id varchar(20),order_id varchar(20),foreign key(cust_id) references customers_exp9_csa_47,foreign key(order_id) references orders_exp9_csa_47);
--drop table orders_exp9_csa_47;

insert into items_exp9_csa_47 values('I1','HP laptop','Electronics',50000,50);
insert into items_exp9_csa_47 values('I2','Chair','Furniture',500,200);
insert into items_exp9_csa_47 values('I3','Notebook','Stationary',50,500);
insert into items_exp9_csa_47 values('I4','Samsung Galaxy S4','Electronics',20000,30);
insert into items_exp9_csa_47 values('I5','Harry Potter','Novels',200,10);
insert into items_exp9_csa_47 values('I6','Pencils','Stationary',5,10000);
select * from items_exp9_csa_47;

insert into customers_exp9_csa_47 values('C1','John Doe','123 Maple Street Springfield','California');
insert into customers_exp9_csa_47 values('C2','Jane Smith','456 Oak Avenue Rivertown','Texas');
insert into customers_exp9_csa_47 values('C3','Alice Johnson','789 Pine Road Lakeview','Florida');
insert into customers_exp9_csa_47 values('C4','Mickey Bob','101 Birch Boulevard Mountainville','California');
insert into customers_exp9_csa_47 values('C5','Carol White','202 Cedar Lane Beachside','California');
insert into customers_exp9_csa_47 values('C6','Bob Brown','303 Elm Street Riverbend','Florida');
select * from customers_exp9_csa_47;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

insert into orders_exp9_csa_47 values('O1','I1','C6',1,'12-JAN-2012');
insert into orders_exp9_csa_47 values('O2','I3','C3',30,'21-JAN-2023');
insert into orders_exp9_csa_47 values('O3','I6','C3',10,'21-JAN-2023');
insert into orders_exp9_csa_47 values('O4','I4','C1',1,'2-JUN-2024');
insert into orders_exp9_csa_47 values('O5','I4','C4',2,'6-MAY-2010');
select * from orders_exp9_csa_47;
--desc orders_exp9_csa_47;

insert into delivery_exp9_csa_47 values('D1','C6','O1');
insert into delivery_exp9_csa_47 values('D2','C3','O2');
insert into delivery_exp9_csa_47 values('D3','C3','O3');
insert into delivery_exp9_csa_47 values('D4','C4','O5');
select * from delivery_exp9_csa_47;