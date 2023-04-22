-- cursor based RECORD
DECLARE
    CURSOR cur_customer IS SELECT * FROM customers;
    customer_rec cur_customer%rowtype;
BEGIN
    OPEN cur_customer;
    --WHILE cur_customer%FOUND 
    LOOP
        FETCH cur_customer INTO customer_rec;
        EXIT WHEN cur_customer%NOTFOUND;
        dbms_output.put_line('CUSTOMER ID :'||customer_rec.id||' CUSTOMER NAME: '||customer_rec.name||' CUSTOMER SALARY: '||customer_rec.salary); 
        UPDATE CU   
    END LOOP;
    CLOSE cur_customer;
EXCEPTION
WHEN no_data_found THEN
dbms_output.put_line('NO DATA FOUND');
END;
/    
