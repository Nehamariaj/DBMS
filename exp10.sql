create table bank(bank_id varchar(20) primary key,bank_name varchar(50),headoffice varchar(20),branch varchar(20),branch_code varchar(20));
insert into bank values ('B1','State Bank Of India','Kottayam','Pala','SBI123');
insert into bank values ('B2','ICICI','Kochi','Kochi','ICICI523');
insert into bank values ('B3','HDFC','Kottayam','Pala','HDFC985');

commit;
select * from bank;

savepoint a; --label name ='a'

delete from bank where bank_id='B2';
select * from bank;

rollback to  savepoint a; --undo the previous step
select * from bank;

insert into bank values ('B4','Axis Bank','Kottayam','Kaduthurthy','AB763');

commit;
select * from bank;

savepoint b;

delete from bank where bank_id='B3';
select * from bank;

rollback;
select * from bank;
