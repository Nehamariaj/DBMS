declare
numofterms NUMBER:=&numofterms;
a NUMBER:=0;
b NUMBER:=1;
nextterm NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE ('Fibonacci Series:');
FOR i IN 1..numofterms LOOP
DBMS_OUTPUT.PUT(a || ' ');
nextterm:=a + b;
a:=b;
b:=nextterm;
END LOOP;
DBMS_OUTPUT.PUT_LINE ('');
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('An error occurred: ' || SQLERRM);
END;
/
