DECLARE
num1 number:=&num1;
num2 number:=&num2;
maxi number;
FUNCTION findMax(x IN NUMBER,y IN NUMBER) RETURN NUMBER
IS
    z number;
BEGIN
    IF x > y THEN
        z:=x;
    ELSE
        z:=y;
    END IF;
        RETURN z;
END;
BEGIN
maxi:=findMax(num1,num2);
dbms_output.put_line('The maximum number is : '||maxi);

END;
/

