DECLARE
    num number:=&num;
    factorial number;

FUNCTION fact(x IN number) return NUMBER
IS
f number;
BEGIN
    IF x = 0 THEN
     f:=1;
    ELSE
      f:=x*fact(x-1);
    END IF;
    return f;
END fact;
BEGIN
    factorial := fact(num);
    dbms_output.put_line('The factorial of '||num||' is '||factorial);
END;
/                 