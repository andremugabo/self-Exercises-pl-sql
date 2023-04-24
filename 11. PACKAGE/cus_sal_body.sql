CREATE PACKAGE BODY cus_salary AS 
    CREATE PROCEDURE find_sal(c_id customers.id%type) iS 
        c_sal customers.salary%type;
    BEGIN 
        SELECT salary INTO c_sal FROM customers WHERE customers.ID = c_id;
    dbms_output.put_line('The salary is :'||c_sal);
    END find_sal;
END cus_salary;        
/