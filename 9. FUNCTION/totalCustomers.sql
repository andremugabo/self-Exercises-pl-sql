CREATE OR REPLACE FUNCTION totalCustomers RETURN NUMBER
IS
    total number:=0;
BEGIN
    SELECT COUNT(*) INTO total FROM customers;
    RETURN total;
END totalCustomers;
/    