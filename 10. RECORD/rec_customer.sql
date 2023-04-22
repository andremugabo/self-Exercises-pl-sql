--table based record
DECLARE
 customer_rec customers%rowtype;
BEGIN
select * INTO customer_rec FROM customers WHERE CUSTOMERS.ID = 3;

dbms_output.put_line('CUSTOMER ID : '||customer_rec.id);
dbms_output.put_line('CUSTOMER NAME: '||customer_rec.name);
dbms_output.put_line('CUSTOMER AGE: '||customer_rec.age);
dbms_output.put_line('CUSTOMER ADDRESS: '||customer_rec.address);
dbms_output.put_line('CUSTOMER SALARY: '||customer_rec.salary);

EXCEPTION
WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('ERROR TOO MANY ROWS');
WHEN OTHERS THEN
    dbms_output.put_line('SOME ERROR OCCURS ');
END;
/        