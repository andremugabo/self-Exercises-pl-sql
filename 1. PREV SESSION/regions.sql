-- regions
CREATE TABLE regions
  (
    region_id NUMBER GENERATED BY DEFAULT AS IDENTITY
    START WITH 5 PRIMARY KEY,
    region_name VARCHAR2( 50 ) NOT NULL
  );

-- countries table
CREATE TABLE countries
  (
    country_id   CHAR( 2 ) PRIMARY KEY  ,
    country_name VARCHAR2( 40 ) NOT NULL,
    region_id    NUMBER, 
    CONSTRAINT fk_countries_regions FOREIGN KEY( region_id ) REFERENCES regions( region_id ) 
  );

-- location
CREATE TABLE locations
  (
    location_id NUMBER GENERATED BY DEFAULT AS IDENTITY START WITH 24 PRIMARY KEY,
    address     VARCHAR2( 255 ) NOT NULL,
    postal_code VARCHAR2( 20 ),
    city        VARCHAR2( 50 ),
    state       VARCHAR2( 50 ),
    country_id  CHAR( 2 ),
    CONSTRAINT fk_locations_countries FOREIGN KEY( country_id ) REFERENCES countries( country_id ) 
  );

-- warehouses
CREATE TABLE warehouses
  (
    warehouse_id NUMBER GENERATED BY DEFAULT AS IDENTITY START WITH 10 PRIMARY KEY,
    warehouse_name VARCHAR( 255 ) ,
    location_id    NUMBER( 12, 0 ),
    CONSTRAINT fk_warehouses_locations FOREIGN KEY( location_id )REFERENCES locations( location_id ) 
  );

-- employees
CREATE TABLE employees
  (
    employee_id NUMBER  GENERATED BY DEFAULT AS IDENTITY START WITH 108 PRIMARY KEY,
    first_name VARCHAR( 255 ) NOT NULL,
    last_name  VARCHAR( 255 ) NOT NULL,
    hire_date  DATE NOT NULL,
    job_title  VARCHAR( 255 ) NOT NULL
  );

--------------------------------------------------------------------------------------
--INSERTING DATA INTO REGIONS
--------------------------------------------------------------------------------------

Insert into REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into REGIONS (REGION_ID,REGION_NAME) values (4,'Africa');
--------------------------------------------------------------------------------------
--INSERTING DATA INTO COUNTRIES
--------------------------------------------------------------------------------------


Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SW','Switzerland',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria',4);


--------------------------------------------------------------------------------------
--INSERTING DATA INTO LOCATIONS 
--------------------------------------------------------------------------------------
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (1,'Spadina Ave','M5V','Toronto','Ontario','CA');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (2,'Boxwood St','YSW','Whitehorse','Yukon','CA');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (3,'Laogianggen','190518','Beijing',null,'CN');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (4,'Victoria Street','2901','Sydney','New South Wales','AU');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID)  values (5,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (6,'Rua Frei Caneca 1360 ','01307','Sao Paulo','Sao Paulo','BR');
Insert into LOCATIONS (LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID) values (7,'Rue des Corps-Saints','1730','Geneva','Geneve','SW');
--------------------------------------------------------------------------------------
--INSERTING DATA INTO WAREHOUSES 
--------------------------------------------------------------------------------------

Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (1,'Berlin',5);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (2,'Rio',6);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (3,'Ontario',1);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (4,'Switz WH',7);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (5,'Toronto',1);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (6,'Quebec',2);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (7,'Beijing',3);
Insert into WAREHOUSES (WAREHOUSE_ID,WAREHOUSE_NAME,LOCATION_ID) values (8,'Melbourne',4);

--------------------------------------------------------------------------------------
--INSERTING DATA INTO EMPLOYEES
--------------------------------------------------------------------------------------

Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (101,'Summer','Payne',to_date('07-JUN-16','DD-MON-RR'),'Public Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (106,'Rose','Stephens',to_date('07-JUN-16','DD-MON-RR'),'Accounting Manager');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (1,'Tommy','Bailey',to_date('17-JUN-16','DD-MON-RR'),'President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (3,'Blake','Cooper',to_date('13-JAN-16','DD-MON-RR'),'Administration Vice President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (2,'Jude','Rivera',to_date('21-SEP-16','DD-MON-RR'),'Administration Vice President');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (11,'Tyler','Ramirez',to_date('28-SEP-16','DD-MON-RR'),'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (10,'Ryan','Gray',to_date('16-AUG-16','DD-MON-RR'),'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (14,'Elliot','Brooks',to_date('07-DEC-16','DD-MON-RR'),'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (12,'Elliott','James',to_date('30-SEP-16','DD-MON-RR'),'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (13,'Albert','Watson',to_date('07-MAR-16','DD-MON-RR'),'Accountant');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (9,'Mohammad','Peterson',to_date('17-AUG-16','DD-MON-RR'),'Finance Manager');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (104,'Harper','Spencer',to_date('07-JUN-16','DD-MON-RR'),'Human Resources Representative');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (4,'Louie','Richardson',to_date('03-JAN-16','DD-MON-RR'),'Programmer');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_TITLE) values (5,'Nathan','Cox',to_date('21-MAY-16','DD-MON-RR'),'Programmer');
