--create table st_code_change(old_st_code char(50),new_st_code char(50),time_of_change timestamp,count_change int);
CREATE OR REPLACE TRIGGER  customers_update 
AFTER INSERT ON customers
BEGIN
dbms_output.put_line('EMPLOYEE TABLE HAS NEW RECORDS');
END;
/