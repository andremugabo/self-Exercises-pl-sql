CREATE OR REPLACE PROCEDURE ST_ASSIGN AS
    CURSOR F_INTAKE IS SELECT *
             FROM 
             STUDENTS S JOIN DEPARTMENT D ON S.DEPARTMENT_ID = D.ID 
             WHERE 
             REGISTRATION_DATE BETWEEN '1-jan-22' AND '28-feb-22'; 
    CURSOR S_INTAKE IS SELECT  * 
             FROM 
             STUDENTS JOIN DEPARTMENT ON STUDENTS.DEPARTMENT_ID = DEPARTMENT.ID  
             WHERE 
             REGISTRATION_DATE BETWEEN '1-MAR-22' AND '1-MAY-22' ;
    CURSOR NO_INTAKE IS SELECT * 
             FROM STUDENTS JOIN DEPARTMENT ON STUDENTS.DEPARTMENT_ID = DEPARTMENT.ID  
             WHERE 
             REGISTRATION_DATE >= '1-MAY-22';
    COOUNT_ARTS NUMBER:=0;
    FIRST S

    BEGIN
        OPEN  F_INTAKE;
        LOOP
            FETCH F_INTAKE INTO      