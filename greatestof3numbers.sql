declare
a number:=&n;
b number:=&n;
c number:=&n;
begin
if a>b and a>c then
dbms_output.put_line(a||' is greater than '||b||' and '||c);
elsif b>a and b>c then
dbms_output.put_line(b||' is greater than '||a||' and '||c);
else
dbms_output.put_line(c||' is greater than '||a||' and '||b);
end if;
end;

