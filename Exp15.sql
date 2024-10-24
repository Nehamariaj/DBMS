set serveroutput on;

CREATE OR REPLACE PACKAGE Pk1 AS
PROCEDURE proc1(a int,b int);
procedure proc2(a int); 
function f1 (a int) return varchar;
function f2(a int,b int,c int) return int;
end pk1;

CREATE OR REPLACE PACKAGE BODY Pk1 AS
PROCEDURE proc1(a int,b int) IS
BEGIN
dbms_output.put_line('Sum:'||(a+b));
dbms_output.put_line('Average:'||(a+b)/2);
dbms_output.put_line('Product:'||(a*b));
end proc1;

PROCEDURE proc2(a int) IS
BEGIN
dbms_output.put_line('Square root:'||sqrt(a));
end proc2;

function f1(a int) return varchar is
begin
if(MOD(A,2)=0) THEN
return 'Even';
else
return 'odd';
end if;
end f1;

function f2(a int,b int,c int) return int is d int;
begin
d:=a+b+c;
return d;
end f2;
end pk1;

DECLARE
p int;
q int;
r int;
s int;
result varchar2(4);
sum1 int;
BEGIN
p:=&p;
q:=&q;
r:=&r;
s:=&s;
Pk1.proc1(p,q);
pk1.proc2(r);
result:=pk1.f1(s);
dbms_output.put_line('The given number is:'||result);
sum1:=pk1.f2(p,q,s);
dbms_output.put_line('sum of three nos:'||sum1);
end;

COMMIT;
