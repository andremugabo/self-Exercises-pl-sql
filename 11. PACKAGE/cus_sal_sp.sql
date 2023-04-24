CREATE PACKAGE cus_salary AS 
    PROCEDURE find_sal(c_id customers.id%type);
END cus_salary;   
/ 