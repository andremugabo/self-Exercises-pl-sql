CREATE OR REPLACE PROCEDURE findMin3(x IN number,y IN number, z OUT number)
IS
BEGIN
IF x < y THEN
    z:= x;
ELSE
    z:=y;
END IF;
END findMin3;
       