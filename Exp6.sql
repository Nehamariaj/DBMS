select ceil(47.29) from dual;
select ceil(-47.9) from dual;
select ceil(47/3) from dual;
select floor(47.76)from dual;
select floor(-47.3)  from dual;
select floor(47/4) from dual;
select sqrt(625) from dual;
select sqrt(47)  from dual;
select abs(47.29) from dual;
select abs(-47.14) from dual;
select abs(-47)from dual;
select sysdate as now_47 from dual;
select to_char(sysdate,'dd:mm:yyyy')as date_format,to_char(sysdate,'hh:mi:ss')as time_format from dual;
select systimestamp from dual;
select least('Apple','Orange','Banana')from dual;
select greatest('Apple','Orange','Banana')from dual;
select ltrim('        Trim me')from dual;
select rtrim('I Love India          ')from dual;
select rpad('Neha Maria',15,'X')from dual;
select rpad('123',6,0)from dual;
select reverse('uoy evol I') from dual;
select case when'racecar'=reverse('racecar')then 'Pallindrome' else 'Not Pallindrome' end as result from dual;
select length('Oracle Database') from dual;
select 'Oracle'||' '||'SQL'||' '||'is'||' '||'powerful'||' '||'and'||' '||'flexible' from dual;
select concat('Neha ','Joji')from dual;
select substr('India is my country',7,2) from dual;
select substr('NehaMaria',3,3) from dual;
select substr('Substring',1,3) from dual;
commit;