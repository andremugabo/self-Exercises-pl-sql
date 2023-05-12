CREATE OR REPLACE TRIGGER audit_stucode
BEFORE  UPDATE ON students
FOR EACH ROW
WHEN (NEW.stu_code != OLD.stu_code)
DECLARE
countNum st_code_change.count_change%type;
newCodeChange varchar2(20);
counterT NUMBER;
counter number;
BEGIN

counterT := 0;

SELECT count(*) INTO counter FROM st_code_change WHERE new_st_code = :OLD.stu_code;

IF counter = 0 THEN 
    
    counterT := counterT + 1;
    INSERT INTO st_code_change VALUES(:OLD.stu_code,:NEW.stu_code,SYSDATE,counterT);
    dbms_output.put_line('The student ID is changed for the first time');

ELSIF counter > 1 THEN    
    SELECT new_st_code,count_change INTO newCodeChange,countNum FROM st_code_change WHERE new_st_code = :OLD.stu_code;
    counterT := countNum + 1;
    UPDATE st_code_change SET count_change = counterT, old_st_code = :OLD.stu_code, new_st_code = :NEW.stu_code WHERE old_st_code = :OLD.stu_code;
    dbms_output.put_line('The student ID code is changed again');

END IF;        
  
EXCEPTION
WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('SORRY NO DATA FOUND');
WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('SORRY TOO MANY ROWS ');    
END;
/
