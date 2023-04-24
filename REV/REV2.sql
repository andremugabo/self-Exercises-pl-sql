CREATE OR REPLACE  PACKAGE employee_pack IS 
    PROCEDURE update_emp_rec(e_code employee.empid%type);
    FUNCTION delete_emp_rec(e_code employee.empid%type) RETURN BOOLEAN;
END employee_pack;
/    