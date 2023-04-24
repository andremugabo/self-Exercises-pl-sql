CREATE OR REPLACE PACKAGE customer_details AS
    PROCEDURE record_cus(c_rec IN customers%ROWTYPE);
    FUNCTION display_cus(c_code IN number) RETURN customers%ROWTYPE;
END customer_details;
/    


CREATE OR REPLACE PACKAGE BODY customer_details AS
    PROCEDURE record_cus(c_rec IN customers%ROWTYPE) IS
        cus_num number;
    BEGIN  
        SELECT COUNT(*) INTO cus_num FROM CUSTOMERs;
        dbms_output.put_line('Customer table contain '||cus_num||' entries');
        INSERT INTO customers VALUES(c_rec.id,c_rec.name,c_rec.age,c_rec.address,c_rec.salary);
        SELECT COUNT(*) INTO cus_num FROM customers;
        dbms_output.put_line('The number Cusomer after Inserting a new one is :'||cus_num);
    END record_cus;

    FUNCTION display_cus(c_code IN number) RETURN customers%ROWTYPE
         IS
            get_cus customers%ROWTYPE;
         BEGIN
            SELECT * INTO get_cus FROM customers WHERE ID = c_code;
            RETURN get_cus;
         END display_cus;
    END customer_details;
    /        

DECLARE
    record_customer customers%rowtype;
    get_customer customers%rowtype;
    cus_code number;
BEGIN
    record_customer.id:=&id;
    record_customer.name:='&name';
    record_customer.age:=&age;
    record_customer.address:='&address';
    record_customer.salary:=&salary;
    customer_details.record_cus(record_customer);
    cus_code:=&cus_code;
    get_customer := customer_details.display_cus(cus_code);
    dbms_output.put_line('The customer with an ID :'||cus_code||' is ');
    dbms_output.put_line('NAME :'||get_customer.name||' AGE:'||get_customer.age||'  ADDRESS:'||get_customer.address||' SALARY:'||get_customer.salary);

    EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('NO DATA FOUND');
    WHEN too_many_rows THEN
        dbms_output.put_line('TOO MANY ROWS SELECTED');    
    WHEN others THEN 
        dbms_output.put_line('SOME ERROR !!');
END;
/