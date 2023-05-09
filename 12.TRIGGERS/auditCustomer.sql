CREATE OR REPLACE TRIGGER  customers_update 
AFTER INSERT ON customers
BEGIN
dbms_ouput.put_line('EMPLOYEE TABLE HAS NEW RECORDS');
END;
/