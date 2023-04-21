DECLARE
a number:=&a;
b number:=&b;
c number;
PROCEDURE findMin(x IN NUMBER,y IN NUMBER,z OUT NUMBER);
BEGIN
findMin3(a,b,c);
dbms_output.put_line('The minimum value between '||a||' and '||b||' is '||c);
END;
/