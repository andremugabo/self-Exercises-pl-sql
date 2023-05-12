CREATE OR REPLACE TRIGGER check_id 
BEFORE INSERT OR UPDATE ON emp_table
FOR EACH ROW
DECLARE
check_code NUMBER;
id_exist EXCEPTION;
PRAGMA EXCEPTION_INIT(id_exist,-20001);
BEGIN
SELECT COUNT(*) INTO check_code FROM emp_table WHERE emp_code = :NEW.emp_code;

IF check_code > 0 THEN

    RAISE_APPLICATION_ERROR(-20001,'CODE EXIST TRY ANOTHER ONE PLEASE');

END IF;

EXCEPTION

WHEN id_exist THEN
    dbms_output.put_line(sqlerrm);
END;
/    
