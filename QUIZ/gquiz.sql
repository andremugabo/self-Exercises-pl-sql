CREATE OR REPLACE PROCEDURE assign
IS 
CURSOR FIRST IS SELECT * FROM STUDENTS
JOIN DEPARTMENT ON DEPARTMENT.ID = STUDENTS.DEPARTMENT_ID
WHERE REGISTRATION_DATE BETWEEN '1-JAN-22' AND '28-FEB-22';

CURSOR SECOND IS SELECT * FROM STUDENTS
JOIN DEPARTMENT ON DEPARTMENT.ID = STUDENTS.DEPARTMENT_ID
WHERE REGISTRATION_DATE BETWEEN '1-MAR-22' AND '28-APR-22';

CURSOR THIRD IS SELECT * FROM STUDENTS
JOIN DEPARTMENT ON DEPARTMENT.ID = STUDENTS.DEPARTMENT_ID
WHERE REGISTRATION_DATE >= '1-MAY-22';
counter number :=0;
begin

dbms_output.put_line('Students in the first in take');
dbms_output.put_line('_____________________________');
FOR STUDENT IN FIRST loop
if STUDENT.DEPARTMENT_NAME = 'Arts' then
    counter := counter + 1;
    continue;
else
  dbms_output.put_line(STUDENT.STU_CODE||' '||STUDENT.STU_FNAME||' '||STUDENT.STU_LNAME||' department of: '||STUDENT.DEPARTMENT_NAME);
end if;
  end loop;
  dbms_output.put_line('There are '||counter||' in Arts skipped');
  dbms_output.put_line('_______________________________________');

dbms_output.put_line('Students in the second in take');
dbms_output.put_line('_________________________________________');

FOR STUDENT IN SECOND loop
if STUDENT.DEPARTMENT_NAME = 'Arts' then
    counter := counter + 1;
    continue;
else
  dbms_output.put_line(STUDENT.STU_CODE||' '||STUDENT.STU_FNAME||' '||STUDENT.STU_LNAME||' department of: '||STUDENT.DEPARTMENT_NAME);
end if;
  end loop;
dbms_output.put_line('There are '||counter||' in Arts skipped');
dbms_output.put_line('_______________________________________');

dbms_output.put_line('Students with no in take');
dbms_output.put_line('_______________________________________');
FOR STUDENT IN THIRD loop
if STUDENT.DEPARTMENT_NAME = 'Arts' then
     counter := counter + 1;
    continue;
else
  dbms_output.put_line(STUDENT.STU_CODE||' '||STUDENT.STU_FNAME||' '||STUDENT.STU_LNAME||' department of: '||STUDENT.DEPARTMENT_NAME);
end if;
  end loop;
dbms_output.put_line('There are '||counter||' in Arts skipped');
dbms_output.put_line('_______________________________________');

end;
/