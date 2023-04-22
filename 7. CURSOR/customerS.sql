DECLARE 
   c_id customers.id%type; 
   c_name customers.name%type; 
   c_age customers.age%TYPE;
   c_address customers.address%type; 
   c_salary customers.salary%TYPE;
   CURSOR c_customers is 
      SELECT id, name, age, address  , salary FROM customers; 
BEGIN 
   OPEN c_customers; 
         dbms_output.put_line('-----------------------------------------------');
         dbms_output.put_line('| ID| NAME |   AGE | ADDRESS |  SALARY        |');
         dbms_output.put_line('-----------------------------------------------');
   LOOP 
   FETCH c_customers into c_id, c_name, c_age, c_address, c_salary; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line('--------------------------------------------------');
      dbms_output.put_line('|'||c_id||'|'||c_name||'|'||c_age||'|'||c_address||'|'||c_salary||'|');
      dbms_output.put_line('--------------------------------------------------');
   END LOOP; 
   CLOSE c_customers; 
END; 
/