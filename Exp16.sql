--1)
create table bank_details_exp16 (accno int primary key, name varchar(20), balance number(10,3), adate date);

insert into bank_details_exp16 values(1001,'aby',3005,'10-oct-15'); 
insert into bank_details_exp16 values(1002,'alan',4000,'05-may-95'); 
insert into bank_details_exp16 values(1003,'amal',5000,'16-mar-92');
insert into bank_details_exp16 values(1004,'jeffin',3500,'01-apr-50'); 
select * from bank_details_exp16; 

create table banknew_exp16(accno int primary key,interest int);

declare cursor temp is 
select accno,name,balance,adate from bank_details_exp16; 
tempvar temp %rowtype;
interest int;
BEGIN open temp;
loop 
fetch temp into tempvar;
exit when temp%notfound;
interest:=.08*tempvar.balance; 
insert into banknew_exp16 values(tempvar.accno,interest);
end loop;
close temp; 
end; 

select * from banknew_exp16;

--2)
create  table student_exp16 (id varchar(5) primary key, name varchar(20), m1 number(9,3), m2 number(9,3), m3 number(9,3), grade varchar(5));
desc student_exp16;

insert into student_exp16 ( id,name, m1,m2,m3) values('S1','Adam',20,20,33);
insert into student_exp16 ( id,name, m1,m2,m3) values('S2','Bob',18,9,41);
insert into student_exp16 ( id,name, m1,m2,m3) values('S3','Bright',22,7,31);
insert into student_exp16 ( id,name, m1,m2,m3) values('S4','Duke',13,21,20);
insert into student_exp16 ( id,name, m1,m2,m3) values('S5','Elvin',14,22,23);
select * from student_exp16;

DECLARE 
CURSOR temp IS 
SELECT id, name, m1, m2, m3 FROM student_exp16;
tempvar temp%ROWTYPE;
total NUMBER(9,3);
grades VARCHAR(5);
BEGIN 
OPEN temp;
LOOP
FETCH temp INTO tempvar;
EXIT WHEN temp%NOTFOUND;     
total := tempvar.m1 + tempvar.m2 + tempvar.m3;        
IF total > 90 THEN
grades := 'A';
ELSIF total > 80 THEN
grades := 'B';
ELSIF total > 70 THEN
grades := 'C';
ELSIF total > 60 THEN
grades := 'D';
ELSIF total > 50 THEN
grades := 'E';
ELSE
grades := 'FAIL';
END IF;
UPDATE student_exp16 
SET grade = grades 
WHERE id = tempvar.id;
END LOOP;     
CLOSE temp; 
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end; 

select * from student_exp16;

--3)
Create table people_list_exp16(id varchar(10) primary key,name varchar(30),dt_joining date,place varchar(30));
desc people_list_exp16;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

insert into people_list_exp16 values('P1','John','14-May-2012','New York');
insert into people_list_exp16 values('P2','Charlie','10-Sep-2023','London');
insert into people_list_exp16 values('P3','Jane','23-Nov-2008','Sydney');
insert into people_list_exp16 values('P4','Alice','30-Jun-2010','India');
insert into people_list_exp16 values('P5','Elvin','15-Mar-2021','Berlin');
select * from people_list_exp16;

create table exp_list_exp16(id varchar(10) primary key,name varchar(30),years_of_experience number(10));
desc exp_list_exp16;

DECLARE 
CURSOR temp IS 
SELECT id, name,dt_joining,place FROM people_list_exp16;
tempvar temp%ROWTYPE;
years_of_experience number(10);
BEGIN 
OPEN temp;
LOOP
FETCH temp INTO tempvar;
EXIT WHEN temp%NOTFOUND;     
years_of_experience := (SYSDATE - tempvar.dt_joining) / 365;       
IF years_of_experience > 10 THEN
insert into exp_list_exp16 values (tempvar.id,tempvar.name,years_of_experience); 
END IF;
END LOOP;
CLOSE temp; 
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end; 

select * from exp_list_exp16;

--4)
Create table employee_list_exp16 (id varchar(10) primary key,name varchar(30),monthly_salary number(20,3));
desc employee_list_exp16;

insert into employee_list_exp16 values('E1','Sumit Kumar',30000);
insert into employee_list_exp16 values('E2','Priya Nair',4500);
insert into employee_list_exp16 values('E3','Rohan Gupta',75000);
insert into employee_list_exp16 values('E4','Ananya Singh',25000);
insert into employee_list_exp16 values('E5','Vikram Patel',160000);
select * from employee_list_exp16;

DECLARE 
CURSOR temp IS 
SELECT id,name,monthly_salary FROM employee_list_exp16;
tempvar temp%ROWTYPE;
new_monthly_salary number(20,3);
annual_salary number(20,3);
BEGIN 
OPEN temp;
LOOP
FETCH temp INTO tempvar;
EXIT WHEN temp%NOTFOUND;     
annual_salary := tempvar.monthly_salary*12;        
IF annual_salary < 60000 THEN
new_monthly_salary :=tempvar.monthly_salary+(tempvar.monthly_salary*0.25);
ELSIF annual_salary>=60000 and annual_salary<200000 THEN
new_monthly_salary := tempvar.monthly_salary+(tempvar.monthly_salary*0.20);
ELSIF annual_salary >=200000 and annual_salary<500000 THEN
new_monthly_salary := tempvar.monthly_salary+(tempvar.monthly_salary*0.15);
ELSIF annual_salary >=500000 THEN
new_monthly_salary := tempvar.monthly_salary+(tempvar.monthly_salary*0.10);
END IF;
UPDATE employee_list_exp16 
SET monthly_salary = new_monthly_salary 
WHERE id = tempvar.id;
END LOOP;     
CLOSE temp; 
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end;

select * from employee_list_exp16;

commit;
