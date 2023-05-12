CREATE OR REPLACE TRIGGER on_insert
AFTER INSERT OR UPDATE OF salary ON customers
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.put_line('A new data updated or inserted');
END;
/    