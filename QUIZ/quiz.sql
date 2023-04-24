CREATE OR REPLACE PROCEDURE ass_student IS
   CURSOR f_intake IS SELECT * FROM STUDENTS S JOIN DEPARTMENT D ON S.DEPARTMENT_ID = D.ID WHERE REGISTRATION_DATE BETWEEN '1-jan-22' AND '28-feb-22'; 
   CURSOR s_intake IS SELECT  * FROM STUDENTS JOIN DEPARTMENT ON STUDENTS.DEPARTMENT_ID = DEPARTMENT.ID  WHERE REGISTRATION_DATE BETWEEN '1-MAR-22' AND '1-MAY-22' ;
   CURSOR NO_INTAKE IS SELECT * FROM STUDENTS JOIN DEPARTMENT ON STUDENTS.DEPARTMENT_ID = DEPARTMENT.ID  WHERE REGISTRATION_DATE >= '1-MAY-22';
   COUNT_ART1 NUMBER:=0;
   COUNT_ART2 NUMBER:=0;
   COUNT_ART3 NUMBER:=0;
   FIRST_ITK F_INTAKE%ROWTYPE;     
   SECOND_ITK s_intake%ROWTYPE;     
   NO_ITK NO_INTAKE%ROWTYPE;     

   BEGIN 
   OPEN f_intake;
   LOOP
   fetch f_intake INTO  FIRST_ITK;
   
   IF FIRST_ITK.DEPARTMENT_NAME = ' Arts' THEN
      COUNT_ART1 := COUNT_ART1 + 1;
     CONTINUE;   
   END IF;
   EXIT WHEN f_intake%notfound;
   dbms_output.put_line(first_itk.stu_code);   
   END LOOP;
   dbms_output.put_line(COUNT_ART1);
   CLOSE f_intake;

   OPEN s_intake;
   LOOP
   fetch s_intake INTO SECOND_ITK;
   
   IF SECOND_ITK.DEPARTMENT_NAME = ' Arts' THEN
      COUNT_ART2 := COUNT_ART2 + 1;
     CONTINUE;   
   END IF;
   EXIT WHEN s_intake%notfound;
   dbms_output.put_line(SECOND_ITK.stu_code);   
   END LOOP;
   dbms_output.put_line(COUNT_ART2);
   CLOSE s_intake;


   OPEN NO_INTAKE;
   LOOP
   fetch NO_INTAKE INTO NO_ITK;
   
   IF NO_ITK.DEPARTMENT_NAME = 'Arts' THEN
      COUNT_ART3 := COUNT_ART3 + 1;
     CONTINUE;   
   END IF;
   EXIT WHEN NO_INTAKE%notfound;
   dbms_output.put_line(NO_ITK.stu_code);   
   END LOOP;
   dbms_output.put_line(COUNT_ART3);
   CLOSE NO_INTAKE;


   END ass_student;
   /
