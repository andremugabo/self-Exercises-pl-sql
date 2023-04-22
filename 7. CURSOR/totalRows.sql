DECLARE 
 total_rows number(2);
BEGIN
    UPDATE customers SET salary = salary + 500;
    IF sql%NOTFOUND THEN
        dbms_output.put_line('No customer selected');
    ELSIF sql%FOUND THEN
        total_rows := sql%ROWCOUNT;
        dbms_output.put_line(total_rows ||' customers selected');
    END IF;
    END;
    /        