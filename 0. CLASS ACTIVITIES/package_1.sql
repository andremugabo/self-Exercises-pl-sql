CREATE OR REPLACE PACKAGE st_details AS
    PROCEDURE set_record(st_student_rec IN student%rowtype);
    FUNCTION get_record(st_student_no IN NUMBER) RETURN student%rowtype;
END st_details;
/

CREATE OR REPLACE PACKAGE BODY st_details as
     PROCEDURE set_record(st_student_rec IN student%rowtype) IS 
                 num_ofEntry number;
      BEGIN
        select count(*) INTO num_ofEntry from student;
        dbms_output.put_line('The number of recorded students is : '||num_ofEntry);
        
        INSERT INTO student VALUES(st_student_rec.ID,st_student_rec.st_name,st_student_rec.st_dpt,st_student_rec.st_course);
        select count(*) INTO num_ofEntry from student;
        dbms_output.put_line('The number of recoded students after inserting a new one is: '||num_ofEntry);
      END set_record;

      FUNCTION get_record (st_student_no IN number) RETURN student%rowtype IS
         student_rec student%rowtype;
       BEGIN
        
        SELECT * INTO student_rec FROM student WHERE id = st_student_no;        

        return student_rec;  

     END get_record;
     END st_details;
    /


DECLARE
  detail_for_student student%ROWTYPE;
  get_student student%ROWTYPE;
  stu_code number;
BEGIN 
detail_for_student.id:=&id;
detail_for_student.st_name:='&name';
detail_for_student.st_dpt:='&dpt';
detail_for_student.st_course:='&course';
st_details.set_record(detail_for_student);
stu_code:=&stu_code;
get_student := st_details.get_record(stu_code);
dbms_output.put_line('The student with ID '||stu_code||' his/her Name is: '||get_student.st_name||' and his/her departement is: '||get_student.st_dpt);

end;
/

  
 