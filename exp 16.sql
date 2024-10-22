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

create  table student_exp16 (id varchar(5) primary key, name varchar(20), m1 number(9,3), m2 number(9,3), m3 number(9,3), grade varchar(5));

insert into student_exp16 ( id,name, m1,m2,m3) values('S1','Adam',20,20,33);
insert into student_exp16 ( id,name, m1,m2,m3) values('S2','Bob',18,9,41);
insert into student_exp16 ( id,name, m1,m2,m3) values('S3','Bright',22,7,31);
insert into student_exp16 ( id,name, m1,m2,m3) values('S4','Duke',13,21,20);
insert into student_exp16 ( id,name, m1,m2,m3) values('S5','Elvin',14,22,23);
select * from student_exp16;
select * from student_exp16;

declare cursor temp is 
select id,name, m1,m2,m3 from student_exp16 WHERE grade IS NULL;
tempvar temp %rowtype;
total number(9,3);
grades varchar(5);
begin open temp;
loop
fetch temp into tempvar;
exit when temp%notfound; 
total:=tempvar.m1+tempvar.m2+tempvar.m3; 
if total>90  then
grades:='A';
elsif total>80  then
grades:='B';
elsif total>70 then
grades:='C';
elsif total>60  then
grades:='D';
elsif total>50 then
grades:='E';
elsif total<=50 then
grades:='FAIL';
UPDATE student_exp16 
        SET grade = grades 
        WHERE id = tempvar.id;
end if;
end loop; 
EXCEPTION
    when others then
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
close temp; 
end; 

DECLARE 
    CURSOR temp IS 
        SELECT id, name, m1, m2, m3 FROM student_exp16 WHERE grade IS NULL; -- Select records with NULL grade
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

        -- Update the grade for the corresponding record
        UPDATE student_exp16 
        SET grade = grades 
        WHERE id = tempvar.id; -- Assuming 'id' is the primary key
    END LOOP; 
    
    CLOSE temp; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
end; 


commit;
