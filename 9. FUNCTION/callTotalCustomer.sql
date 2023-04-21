DECLARE
    customer number;
BEGIN
    customer := totalCustomers;
    dbms_output.put_line('The total number of customer is :'||customer);
END;
/    