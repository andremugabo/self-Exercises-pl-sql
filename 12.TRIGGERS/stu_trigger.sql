CREATE OR REPLACE TRIGGER audit_stu_code 
BEFORE INSERT OR UPDATE OF stu_code ON students
-- REFERENCING OLD AS o NEW AS n 
FOR EACH ROW
WHEN (NEW.stu_code > 0) 
DECLARE
new_st_code stu_code.students%type;
old_st_code stu_code.students%type;
count number:=0;
currentCount:=0;
CURSOR select_stucode IS SELECT new_st_code FROM st_code_change;
currentCode stu_code.student%type;
BEGIN
new_st_code:= :NEW.stu_code;
old_st_code:= :OLD.stu_code;
OPEN select_stucode; 
LOOP
    FETCH select_stucode INTO currentCode;
    IF select_stucode%ROWCOUNT = 0 THEN 
         count := count + 1;
         INSERT INTO st_code_change(old_st_code,new_stu_code,count_change) VALUES('old_stu_code','new_stu_code',count);
    ELSIF new_st_code != currentCode THEN
        count := count + 1;
        INSERT INTO st_code_change(old_st_code,new_stu_code,count_change) VALUES('old_stu_code','new_stu_code',,count);
    ELSIF new_st_code = currentCode THEN
        SELECT count_change INTO currentCount FROM st_code_change;
        count := currentCount + 1;
        INSERT INTO st_code_change(old_st_code,new_stu_code,count_change) VALUES('old_stu_code','new_stu_code',,count);
    END IF;
END LOOP;
CLOSE CURSOR;
END;
/                

