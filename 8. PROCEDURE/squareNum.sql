DECLARE
    a number:=&a;
    PROCEDURE squareNum(x IN OUT number)
    IS
    BEGIN
    x := x*x;
    END squareNum;
    BEGIN
        squareNum(a);
        dbms_output.put_line('The square of the entered number  is: '||a);
    END;
    /

