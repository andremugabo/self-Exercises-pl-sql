DECLARE 
    c_id customers.id%TYPE;
    c_name customers.name%type;
    c_age customers.age%type;
    c_address customers.address%TYPE;
    c_salary customers.salary%TYPE;
    cursor c_customer is select * from customers;
BEGIN
    OPEN c_customer;
          -- dbms_output.put_line('-------------------------------------------------------------------------------------');
          -- dbms_output.put_line('| ID        |    NAME           |   AGE     |     ADDRESS        |    SALARY        |');
          -- dbms_output.put_line('-------------------------------------------------------------------------------------');
    LOOP
        FETCH c_customer INTO c_id,c_name,c_age,c_address,c_salary;
        IF c_customer%NOTFOUND THEN
            dbms_output.put_line('no customer selected');
            EXIT;
        END IF;    
    
        --dbms_output.put_line('--------------------------------------------------------------------------------------');
        dbms_output.put_line(c_id||'  '||c_name||'  '||c_age||'  '||c_address||'  '||c_salary);
        --dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    END LOOP;
    CLOSE c_customer;
    END;
    /        
