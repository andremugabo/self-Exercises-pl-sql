CREATE TABLE emp_table(
    emp_code VARCHAR(5),
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_salary INT,
    emp_address VARCHAR(80)
);

INSERT INTO emp_table VALUES(
    '&emp_code',
    '&emp_fname',
    '&emp_lname',
    '&emp_salary',
    '&emp_address'
);