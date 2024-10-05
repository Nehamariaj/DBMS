create table bank_exp12(bank_code varchar(3) primary key,bankname varchar(50) not null,headoffice varchar(30),branches int check(branches>0));
create table branch_exp12(branch_id varchar(10) primary key,branchname varchar(50) default 'New Delhi',bank_id varchar(3) ,foreign key (bank_id) references bank_exp12(bank_code) on delete cascade);

insert into bank_exp12 values ('SBT','State Bank of Travancore','Ernakulam',200);
insert into bank_exp12 values ('FB','Fedaral Bank','Kottayam',300);
insert into bank_exp12 values ('AB','Axis Bank','Chennai',400);
insert into bank_exp12 values ('SBI','State Bank of India','Hyderabad',700);
insert into bank_exp12 values ('CB','Canara Bank','Ernakulam',20);
select * from bank_exp12;

insert into branch_exp12 values ('B1',default,'SBT');
insert into branch_exp12 values ('B2','Kottayam','FB');
insert into branch_exp12 values ('B3','Kottayam','SBI');
insert into branch_exp12 values ('B4',default,'AB');
insert into branch_exp12 values ('B5',default,'CB');
select * from branch_exp12;

delete from bank_exp12 where bank_code='SBT';
select * from bank_exp12;
select * from branch_exp12;

alter table branch_exp12 drop primary key;
desc branch_exp12;

create view bank_headoffice as select * from bank_exp12 where headoffice='Ernakulam';
select * from bank_headoffice;

create view bank_branch as select * from bank_exp12 where headoffice='Kottayam';
select * from bank_branch;

commit;
