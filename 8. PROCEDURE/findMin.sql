DECLARE
a number:=&a;
b number:=&b;
c number;

PROCEDURE findMin(x IN number,y IN number,z OUT number)
IS
BEGIN
IF x > y THEN
    z:= y;
ELSE
    Z:=x;
END IF;
END findMin;
BEGIN 
    findMin(a,b,c);
    dbms_output.put_line('The minimum between '||a||' and '||b||' is '||c);
END;
/            