 set serveroutput on;

show serveroutput;

create or replace function factorial(n int)
return int as fact INT;
begin
fact:=1;
for i IN 1..n loop
fact:=fact * i;
end loop;
return fact;
end;
/
commit;

DECLARE
c integer;
result integer;
begin
c:=&c;
result:=factorial(c);
dbms_output.put_line('The factorial is'||result);
end;
/
commit;

create table student_details_exp14(roll int primary key, marks int, phone int);
insert into student_details_exp14 values(1,20,9876543210);
insert into student_details_exp14 values(2,30,8765432109);
insert into student_details_exp14 values(3,50,7654321098);
insert into student_details_exp14 values(4,45,8654321097);
insert into student_details_exp14 values(5,35,9654321087);
select * from student_details_exp14;

create or replace procedure pro1 as
begin
update student_details_exp14 set marks=marks+(marks*0.05);
end;
/

begin
pro1;
end;
/

create  table customer_details_exp14 (cust_id int unique, cust_name varchar(20), address varchar(50));
create or replace trigger trigger1
after insert on customer_details_exp14
for each row 
begin
dbms_output.put_line('The row is inserted');
end;
/
insert into customer_details_exp14 values(1,'Adam','123 Abc house');
 select * from customer_details_exp14;
 
create table emp_details_exp14 (empid int unique, empname varchar(30), salary number(7));
create or replace trigger trigger2
after insert or update on emp_details_exp14
for each row
when (new.salary>20000)
begin
dbms_output.put_line('salary is greater than 20000');
end;
/
insert into emp_details_exp14 values(101,'Mark',3000);
insert into emp_details_exp14 values(102,'Bob',50000);
select * from emp_details_exp14;
update emp_details_exp14 set salary=5000 where empid=101;
update emp_details_exp14 set salary=35000 where empid=101;

create table cust_count (count_row int );
insert into cust_count values(0);
select * from cust_count;

create or replace trigger trigger3
before insert or delete  on customer_details_exp14
for each row 
begin
if deleting then update cust_count set count_row=count_row-1;
else update  cust_count set count_row=count_row+1;
end if;
end;
/

insert into customer_details_exp14 values(2,'Bright','New Delhi');
select * from cust_count;
insert into customer_details_exp14 values(3,'Elvin','Kottayam');
select * from customer_details_exp14;
delete from customer_details_exp14 where cust_id=3;

create table updated_exp14(empid int unique, empname varchar(30), salary number(7));
create table deleted_exp14(empid int unique, empname varchar(30), salary number(7));

create or replace trigger trigger4
after delete or update  on emp_details_exp14
for each row 
begin
if deleting then insert into deleted_exp14 values(:old.empid,:old.empname,:old.salary);
else  insert into updated_exp14 values (:new.empid,:new.empname,:new.salary);
end if;
end;
/

select * from emp_details_exp14;
delete from emp_details_exp14 where empid=102;
select * from deleted_exp14;
update emp_details_exp14 set empname='John' where empid=101;
select * from updated_exp14;

commit;
