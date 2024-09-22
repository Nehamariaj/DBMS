***Create a table named Employee(Emp_id, Emp_name, Dept, Salary (in US $))with emp id as primary key field***
create table emp_exp5_csa_47(emp_id varchar(10),emp_name varchar(20),dept varchar(20),salary number(20),primary key (emp_id));
***INSERTING VALUES INTO TABLE emp_exp5_csa_47 values***
insert into emp_exp5_csa_47 values ('e1','David Smith','HR',2000); 
insert into emp_exp5_csa_47 values ('e2','Oliv','Marketing',4000);
insert into emp_exp5_csa_47 values ('e3','Charles Brown','Production',6000); 
insert into emp_exp5_csa_47 values ('e4','Anu','Sales',8000);
select * from emp_exp5_csa_47;

***1.Select employees with salaries greater than 7000***
 SQL>select * from emp_exp5_csa_47 where salary>7000;

***2. Update the salary of 'David Smith' to 8200.00.***
 SQL>update emp_exp5_csa_47 set salary=8200 where emp_name='David Smith'; 
 SQL>select * from emp_exp5_csa_47;

***3.Insert a new employee with Emp_id = 6, Emp_name = 'Daniel Harris', Dept = 'Production', and Salary = 6700.00***
 SQL>insert into emp_exp5_csa_47 values('e6','Daniel Harris','Production',6700);
 SQL>select * from emp_exp5_csa_47;

***4. Delete the employee with Emp_id = 3 ('Charles Brown').***
 SQL>delete from emp_exp5_csa_47 where emp_id='e3';
 SQL>select * from emp_exp5_csa_47;

***5. Select employees whose names do not start with 'D' or 'O.'***
 SQL>select * from emp_exp5_csa_47 where emp_name not like'D%' and emp_name not like 'O%';
 
***6. Calculate the total salary expense for each department.***
 SQL>select dept,sum(salary) from emp_exp5_csa_47 group by(dept);

***7.Update the salary of employees in the 'Production' department by adding 5% to their current salaries.***
 SQL>update emp_exp5_csa_47 set salary=salary+(5/100) where dept='Production';
 SQL>select * from emp_exp5_csa_47;

***8.Delete all employees with salaries below 7000.***
 SQL>delete from emp_exp5_csa_47 where salary<7000;
 SQL>select * from emp_exp5_csa_47;

***9. Find the employee with the lowest salary and display their name and salary.***
 SQL>update emp_exp5_csa_47 set salary=8200 where dept='Marketing'; 
 SQL>select * from emp_exp5_csa_47; 

***10.Update the salary of employees in the 'Marketing' department to 8200.00.***
 SQL>select emp_name,salary from emp_exp5_csa_47 where salary=(select min(salary) from emp_exp5_csa_47);

***11. Find the names of all employees starting with the alphabet 'A':***
 SQL>select * from emp_exp5_csa_47 where emp_name like 'A%' ;

***12. List the names of all employees whose empname contains the substring 'it':***
  SQL>select emp_name from emp_exp5_csa_47 where emp_name like '%it%' ;

***13. List all departments in Upper Case Format***
  SQL>select distinct upper(dept) from emp_exp5_csa_47;

***14. List the employee details whose department starts with 'M', with the 3rd letter as 'r', and containing the substring 'ket':***
  SQL>select * from emp_exp5_csa_47 where dept like 'M_r%ket%';

***15. List all departments in reverse in uppercase format (avoid duplicates)***
 SQL>select distinct upper(reverse(dept)) from emp_exp5_csa_47;
