create table student_exp7_csa_47(roll_no number(10),stud_name varchar(20),physics number(20,3),chemistry number(20,3),maths number(20,3),primary key (roll_no));

insert into student_exp7_csa_47 values ('1','Adam',20,20,33);
insert into student_exp7_csa_47 values ('2','Bob',18,9,41);
insert into student_exp7_csa_47 values ('3','Bright',22,7,31);
insert into student_exp7_csa_47 values ('4','Duke',13,21,20);
insert into student_exp7_csa_47 values ('5','Elvin',14,22,23);
insert into student_exp7_csa_47 values ('6','Fletcher',2,10,48);
insert into student_exp7_csa_47 values ('7','Georgina',22,12,22);
insert into student_exp7_csa_47 values ('8','Mary',24,14,31);
insert into student_exp7_csa_47 values ('9','Tom',19,15,24);
insert into student_exp7_csa_47 values ('10','Zack',8,20,36);
select * from student_exp7_csa_47;

--delete from student_exp7_csa_47;
--drop  table student_exp7_csa_47;

select avg(physics) from student_exp7_csa_47;
select max(maths) as highest_marks_maths from student_exp7_csa_47;
select min(chemistry) as lowest_marks_chemistry from student_exp7_csa_47;
select count(physics) from student_exp7_csa_47 where physics>=12;
select stud_name from student_exp7_csa_47 where physics>=12 and chemistry>=12 and maths>=25;
--6)
alter table student_exp7_csa_47 add(total_marks number(10,5),stu_result varchar(10));
update  student_exp7_csa_47 set total_marks=physics+chemistry+maths;
update student_exp7_csa_47 set result='P' where physics>=12 and chemistry>=12 and  maths>=25;
update student_exp7_csa_47 set result='F' where physics<12 or chemistry<12 or  maths<25;
select roll_no,stud_name ,total_marks,result from student_exp7_csa_47;

select count(case when maths>=25 then 1 end)/count(*)*100 as pass_percentage from student_exp7_csa_47;
select count(case when maths>=25 and physics>=12 and chemistry>=12 then 1 end)/count(*)*100 as overall_pass_percentage from student_exp7_csa_47;
select avg(total_marks) as class_average from student_exp7_csa_47;
select count(*) as total_pass from student_exp7_csa_47  where  maths>=25 and physics>=12 and chemistry>=12;

commit;
