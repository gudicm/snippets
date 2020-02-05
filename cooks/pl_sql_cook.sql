-- find column in tables --
select a.table_name, column_name,DATA_TYPE,DATA_LENGTH from all_tab_columns a,USER_ALL_TABLES u
where a.TABLE_NAME=u.TABLE_NAME and rownum<10
and trim(column_name) = 'CLIENT_ID'
-- use it with power user that has ownership to many schemas --
SELECT * FROM ALL_TAB_COLUMNS WHERE COLUMN_NAME = 'ACCOUNT_CLASS_NAME' ORDER BY TABLE_NAME; 

-- find column in tables --
-- -find tables -
select * from SYS.ALL_OBJECTS where OBJECT_TYPE = 'TABLE' and OWNER ='ROMGUDIC'; 
select * from sys.user_tables;
-- find tables --
-- check oracle version --
select * from v$version

-- select with defined number of records to be returned --
-- rownum(in tsql is equal functionality as TOP )--
select * from <table_name> where rownum<=10 -- first 10 records to be returned
-- rownum --
-- tablespaces --
SELECT * FROM USER_TABLESPACES;

SELECT TABLESPACE_NAME, STATUS, CONTENTS
FROM USER_TABLESPACES;

-- free space --
SELECT * FROM user_free_space 
where TABLESPACE_NAME in ('USERS','TEMP');
-- free space --
-- tablespaces --


-- data dictionary (object search, text search)--
-- object search -- 
SELECT * FROM user_objects	-- all objects in owner schema
SELECT * FROM all_objects -- all granted objects 
SELECT * FROM dba_objects -- all objects in database instance

-- table search--
SELECT *
FROM all_objects
WHERE OBJECT_NAME IN ('<table_name>') -- if table partioned it will have record for each partition
-- object search --
-- code search --
SELECT name, line, text
  FROM user_source
 WHERE UPPER (text) 
  LIKE '%SALES_MGR.CALC_TOTALS%'
 ORDER BY name, line
-- code search --
-- package search --
SELECT *
FROM all_source
WHERE type = 'PACKAGE'
AND (upper(text) LIKE '%FUNCTION%'
OR upper(text) LIKE '%PROCEDURE%')
AND owner != 'SYS';

SELECT *
FROM all_source
WHERE type = 'PACKAGE'
AND upper(text) LIKE '%FILL_T_P_CDP_B_LOANODF%'
AND owner != 'SYS'; -- package of the procedure will be retrieved
-- package search --
-- db links search --
SELECT owner,db_link,host,username
FROM dba_db_links
-- db links addressing  e.g.--
select * from d_client@dwhprod where rownum<10;
select * from <table>@<db_link> where rownum<10;

-- table search --
select owner, table_name from all_tab_columns where column_name = 'ID';
-- table search --

-- procedures --
SELECT   object_name
       , procedure_name 
    FROM user_procedures
   WHERE authid = 'CURRENT_USER'
ORDER BY object_name, procedure_name
-- procedures --
-- triggers --
SELECT *
  FROM user_triggers
 WHERE trigger_body LIKE '%emp%'
-- triggers --
-- dependencies --
SELECT name,
       TYPE,
       referenced_owner,
       referenced_name
  FROM user_dependencies
 WHERE     TYPE IN
              ('PACKAGE',
               'PACKAGE BODY',
               'PROCEDURE',
               'FUNCTION',
               'TRIGGER',
               'TYPE')
   AND referenced_type = 'TABLE'
-- dependencies --
-- system procedures --
describe <table_name>		-- eq as sp_help 
desc <table_name>			-- eq as sp_help 
-- system procedures --
-- date functions --
select sysdate from dual -- return sysdate (in DD.MM.YYYY)
-- comparing dates (date and date needs to compared) --
SELECT to_date(sysdate)
FROM DUAL
WHERE (to_date(sysdate) = to_date('07.06.2016'));

-- last day of the month
SELECT LAST_DAY(SYSDATE) FROM sys.dual;
-- month calculates
SELECT add_months(SYSDATE,-1) FROM sys.dual;

-- date functions --
-- dynamic sql --
execute immediate 'sql statement'
-- dynamic sql --
-- update(join) --
UPDATE suppliers
SET supplier_name = (SELECT customers.customer_name
                     FROM customers
                     WHERE customers.customer_id = suppliers.supplier_id)
WHERE EXISTS (SELECT customers.customer_name
              FROM customers
              WHERE customers.customer_id = suppliers.supplier_id);

UPDATE table1 t1
   SET (name, desc) = (SELECT t2.name, t2.desc
                         FROM table2 t2
                        WHERE t1.id = t2.id)
 WHERE EXISTS (
    SELECT 1
      FROM table2 t2
     WHERE t1.id = t2.id )
	 
-- update(join) --

-- merge --
MERGE INTO employees e
    USING hr_records h
    ON (e.id = h.emp_id)
  WHEN MATCHED THEN
    UPDATE SET e.address = h.address
  WHEN NOT MATCHED THEN
    INSERT (id, address)
    VALUES (h.emp_id, h.address);
-- enchaced with hint
MERGE /*+ FIRST_ROWS*/ INTO test
USING test2 new ON (test.pk = new.pk)
WHEN MATCHED THEN UPDATE SET
        fk = new.fk
,       fill = new.fill

-- with parallel exec
ALTER SESSION ENABLE PARALLEL DML;

MERGE /*+ first_rows parallel(test) parallel(test2) */ INTO test
USING test5 new ON (test.pk = new.pk)
WHEN MATCHED THEN UPDATE SET
        fk = new.fk
,       fill = new.fill

	
	-- merge --
-- if exist drop --
declare
   c int;
begin
   select count(*) into c from user_tables where table_name = upper('table_name');
   if c = 1 then
      execute immediate 'drop table table_name';
   end if;
end;
-- if exist drop --

-- double rows in query(duplicate) --
SELECT a,b,c,d,e,f, 
       count(*) over (PARTITION BY a,b,c)
  FROM sne_test;

select 
  count(*)
  ,empno 
from 
  emp
group by
  empno
having
  count(*) > 2;  
-- double rows in query --


-- indexes --
-- search indexes --
-- clustered index, only one per table(oracle PK automatical), index data phisically sorted --
-- nonclustered, on one or more columns, if more column involved than concatenated, for covered queries
SELECT * FROM ALL_INDEXES WHERE 1=1
AND TABLE_NAME = UPPER('EMPLOYEES')
and OWNER = 'ROMGUDIC';
-- index to columns --
select * FROM DBA_IND_COLUMNS
WHERE 1 = 1 
AND TABLE_OWNER = 'ROMGUDIC'
AND TABLE_NAME = 'EMPLOYEES'
order by TABLE_OWNER, TABLE_NAME,INDEX_NAME, COLUMN_NAME ;

-- bitmap indexes are indexes used on table with low cardinality(few unique values, e.g categories columns ) --

-- search indexes --
CREATE INDEX supplier_idx
  ON supplier (supplier_name);
-- immediatly compute statistics --  
-- concatenated index (on 2 and more columns)--
CREATE INDEX supplier_idx
  ON supplier (supplier_name, city)
  COMPUTE STATISTICS;

ALTER INDEX index_name
  REBUILD COMPUTE STATISTICS;
  
-- automatical pk index, always created when pk is defined on table --
-- pk index (clustered index single per table) -> INDEX(UNIQUE SCAN) 
CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")  
-- concatenated index (involving more than one column) --
-- non clustered index -> INDEX(INDEX RANGE SCAN)

-- index function, must be specified in index creation, and for user function only deterministic fs have sense to be indexed.
-- null value will not be stored into index, unles it is concatenated and only one column has value different than null 
-- date column index , use function index on column with trunc(col_name) and use trunc() in filter
-- indexes --

-- access paths --
-- single table --
	-- INDEX(UNIQUE SCAN) only returns one row because of a UNIQUE constraint
	-- INDEX(RANGE SCAN) when range is defined with values indexed, traversed but need to follow leaf node, AVOID BETWEEN(does not work)
	-- INDEX(ROWID) often follow with INDEX RANGE, can be bottleneck depending on rows returned
	-- single table --

-- access paths --

-- statistics -- 
-- if index is changed on table than statistic should be update on table to witness index performance  
-- on single table (with optinal statistic for table index, option cascade )--
EXEC dbms_stats.gather_table_stats('<schema_name>','<tab_name>',cascade=>TRUE);

-- update on whole schema  --
EXEC dbms_stats.gather_schema_stats('ACTREP', cascade=>TRUE);
-- statistics -- 



-- partitioned tables --
CREATE TABLE sales
  ( prod_id       NUMBER(6)
  , cust_id       NUMBER
  , time_id       DATE
  , channel_id    CHAR(1)
  , promo_id      NUMBER(6)
  , quantity_sold NUMBER(3)
  , amount_sold   NUMBER(10,2)
  )
 PARTITION BY RANGE (time_id)
 ( PARTITION sales_q1_2006 VALUES LESS THAN (TO_DATE('01-APR-2006','dd-MON-yyyy'))
    TABLESPACE tsa
 , PARTITION sales_q2_2006 VALUES LESS THAN (TO_DATE('01-JUL-2006','dd-MON-yyyy'))
    TABLESPACE tsb
 , PARTITION sales_q3_2006 VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
    TABLESPACE tsc
 , PARTITION sales_q4_2006 VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
    TABLESPACE tsd
 );
-- partitioned tables --

-- case in select --
SELECT table_name,
CASE owner
  WHEN 'SYS' THEN 'The owner is SYS'
  WHEN 'SYSTEM' THEN 'The owner is SYSTEM'
  ELSE 'The owner is another value'
END
FROM all_tables;
-- case in select --

-- create table as --
CREATE TABLE new_table
  AS (SELECT column_1, column2, ... column_n
      FROM old_table);
	  
e.g.
CREATE TABLE new_table
  AS (SELECT * FROM old_table);	  

-- create table as --

-- loops --
DECLARE
   x number := 10;
BEGIN
   LOOP
      dbms_output.put_line(x);
      x := x + 10;
      exit WHEN x > 50;
   END LOOP;
   -- after exit, control resumes here
   dbms_output.put_line('After Exit x is: ' || x);
END;

DECLARE
   x number := 10;
BEGIN
   LOOP
      dbms_output.put_line(x);
      x := x + 10;
      IF x > 50 THEN
         exit;
      END IF;
   END LOOP;
   -- after exit, control resumes here
   dbms_output.put_line('After Exit x is: ' || x);
END;
-- loops --

-- ALTER TABLE --
-- rename table --
ALTER TABLE table_name
  RENAME TO new_table_name;

-- add column --
ALTER TABLE supplier
  ADD supplier_name char(50);
-- column --

-- modify column --
ALTER TABLE table_name
  MODIFY column_name column_type;
 
-- rename column --
ALTER TABLE departments
  RENAME COLUMN department_name to dept_name; 

-- drop column
ALTER TABLE P_CPM_DORMANT_ACCOUNT
  drop column debt_count;   
-- ALTER TABLE --
 
-- IF-THEN-ELSIF --

-- IF-THEN-ELSIF --

-- EXEC TIME --
-- TIMING ON measures exec time of last statement --
set timing on;
select * from table_name where customer_id=1;

-- timestamp diff --
DECLARE
  vCount INTEGER;
  vTime1 TIMESTAMP;
  vTime2 TIMESTAMP;
  vDiffTime INTERVAL DAY TO SECOND;
BEGIN
  vTime1:= SYSTIMESTAMP;
  DBMS_OUTPUT.put_line(TO_CHAR(vTime1,'DD.MM.YYYY HH24:MI:SS'));
  dbms_lock.sleep( 10);
  vTime2:= SYSTIMESTAMP;
  DBMS_OUTPUT.put_line(TO_CHAR(vTime2,'DD.MM.YYYY HH24:MI:SS'));
  SELECT (SYSTIMESTAMP - vTime1) INTO vDiffTime FROM DUAL;
  DBMS_OUTPUT.put_line(vDiffTime);
END;


-- EXEC TIME --
-- select into --
-- variable --
DECLARE v_salary NUMBER(8);
BEGIN
SELECT salary INTO v_salary FROM employees
WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE (v_salary);
END;
-- select into --


-- functions --
TO_DATE('20020315', 'yyyymmdd')
result: date value of Mar 15, 2002
-- functions --

-- SUBSTRING FROM STRING --
SUBSTR('This is a test', 6, 2)
instr('Hello','llo') -- if substring exists , returns position of substring, otherwise 0. 
Result: 'is'
-- SUBSTRING FROM STRING --

-- subquery --
-- inner query has no reference to outer query
SELECT last_name
FROM employee
WHERE employee_number IN
(SELECT manager_employee_number
FROM department);
-- subquery --
-- corellate subquery -- 
-- inner query has a reference with outer query --
SELECT last_name
,department_number AS deptno
,salary_amount
FROM employee ee
WHERE salary_amount =
(SELECT MAX (salary_amount)
FROM employee em
WHERE ee.department_number
= em.department_number);
-- inner query has a reference with outer query --
-- corellate subquery -- 

-- derived table --
-- one table access another from where clause --
SELECT last_name
,department_number AS deptno
,salary_amount
FROM employee ee
WHERE salary_amount =
(SELECT MAX (salary_amount)
FROM employee em
WHERE ee.department_number
= em.department_number);

-- derived table --


-- password change on user --
-- from current session
ALTER USER user_name IDENTIFIED BY new_password;
-- password change on user --

-- unlock user --
select * from dba_profiles;

select * from SYS.USER$ u where name = 'ROMGUDIC';
alter user "ROMGUDIC" account unlock;
-- unlock user --

-- functions --
-- -- NVL (same as COALESCE, use NVL)--
SELECT NVL(supplier_city, 'n/a')
FROM suppliers; 
-- functions --
-- procedure with in and out params --
set serveroutput on;
CREATE OR REPLACE PROCEDURE PROC1(invoicenr IN NUMBER, amnt OUT NUMBER)
AS BEGIN
SELECT AMOUNT INTO amnt FROM INVOICE WHERE INVOICE_NR = invoicenr;
END;


-- procedure with in and out params --
DECLARE
amount NUMBER;
BEGIN
PROC1(1000001, amount);
dbms_output.put_line(amount);
END;
-- calling procedure within package --

DECLARE
  procId NUMBER;

BEGIN
  PKG1.INIT(1143824, 0, procId);
  DBMS_OUTPUT.PUT_LINE(procId);
END;
-- calling procedure within package --

-- select data as xml --
-- get xmltype --

DECLARE
   l_xmltype XMLTYPE;
BEGIN
    l_xmltype := dbms_xmlgen.getxmltype('SELECT *
                                           FROM sbdwh.d_client where rownum<3'
                                       );

    dbms_output.put_line(l_xmltype.getClobVal);
END;
-- get xmltype --
-- get xml --
result := dbms_xmlquery.getXml(queryCtx);
  printClobOut(result);
  dbms_xmlquery.closeContext(queryCtx);
-- get xml --

-- sessin id from current session --
-- session id number --
select 
   sys_context('USERENV','SID') 
from dual;

select 
   sid 
from 
   v$mystat 
where 
   rownum <=1;

select 
   to_number(substr(dbms_session.unique_session_id,1,4),'XXXX') mysid 
from dual;

select distinct 
   sid 
from v$mystat;

-- session details
select * from v$session; 
-- sessin id from current session --

-- XSD SCHEMAS--
SELECT * FROM ALL_XML_SCHEMAS;
SELECT * FROM USER_XML_SCHEMAS;
-- XSD SCHEMAS--

-- register schema (user with priviliages) --
BEGIN         
dbms_xmlschema.registerSchema(
schemaURL   => 'new_client_hyperion.xsd', 
schemaDoc   => 
'<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="ROWSET">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="ROW">
          <xs:complexType>
            <xs:sequence>
              <xs:element type="xs:float" name="KLIJENT_BROJ"/>
              <xs:element type="xs:string" name="IME"/>
              <xs:element type="xs:string" name="PREZIME"/>
              <xs:element type="xs:string" name="SPOL"/>
              <xs:element type="xs:string" name="DATUM_RODJENJA"/>
              <xs:element type="xs:string" name="MJESTO_RODJENJA"/>
              <xs:element type="xs:short" name="DRZAVA_RODJENJA"/>
              <xs:element type="xs:string" name="TIP_IDENT_ISPRAVE"/>
              <xs:element type="xs:float" name="BROJ_IDENT_ISPRAVE"/>
              <xs:element type="xs:string" name="DATUM_IZD_IDENT_ISPRAVE"/>
              <xs:element type="xs:string" name="MJESTO_IZD_IDENT_ISPRAVE"/>
              <xs:element type="xs:string" name="IZDAVATELJ_IDEN_ISPRAVE"/>
              <xs:element type="xs:string" name="IDEN_ISPRAVA_VRIJ_DO"/>
              <xs:element type="xs:float" name="OIB"/>
              <xs:element type="xs:string" name="RESIDENT"/>
              <xs:element type="xs:float" name="SECTOR_CODE"/>
              <xs:element type="xs:float" name="GRANA_DJELATNOSTI"/>
              <xs:element type="xs:string" name="KLIJENT_NAZIV"/>
              <xs:element type="xs:byte" name="KLIJENT_TIP"/>
              <xs:element type="xs:string" name="KLIJENT_TIP_NAZIV"/>
              <xs:element type="xs:string" name="KLIJENT_TIP_OPIS"/>
              <xs:element type="xs:string" name="TIP_IDENT_ISPRAVE_OPIS"/>
              <xs:element type="xs:string" name="ADRESA"/>
              <xs:element type="xs:string" name="MJESTO"/>
              <xs:element type="xs:float" name="POSTANSKI_BROJ"/>
              <xs:element type="xs:short" name="DRZAVA"/>
              <xs:element type="xs:float" name="TELEFON"/>
              <xs:element type="xs:float" name="MOBITEL"/>
              <xs:element type="xs:short" name="DRZAVLJANSTVO"/>
              <xs:element type="xs:short" name="ZEMLJA_BORAVKA"/>
              <xs:element type="xs:string" name="DOMACA_STRANA_OSOBA"/>
              <xs:element type="xs:string" name="ZAPOSLENIK"/>
              <xs:element type="xs:string" name="DATUM_CRS_STATUSA"/>
              <xs:element type="xs:string" name="INIC_KYC_STATUS"/>
              <xs:element type="xs:string" name="DATUM_FATCA_STATUSA"/>
              <xs:element type="xs:float" name="ID_FATCA_KLIJENT"/>
              <xs:element type="xs:string" name="FATCA_KLIJENT_OPISNO"/>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
);  
END;
-- register schema (user with priviliages) --
-- System privileges - System wide access - resource, connect, dba, etc.
select privilege 
from dba_sys_privs 
where grantee = 'RESOURCE';

-- create user and add system privilege --
CREATE USER <username> IDENTIFIED BY <pass>;
GRANT CONNECT, RESOURCE to <username>;
 
-- User Privileges - Grants to specific table data
-- user priviliages --
SELECT * FROM USER_SYS_PRIVS; 
SELECT * FROM USER_TAB_PRIVS;
SELECT * FROM USER_ROLE_PRIVS;

select * from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER' order by 1,2,3;
select * from dba_sys_privs  where grantee = '&USER' or grantee in (select granted_role from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER') order by 1,2,3;
select * from dba_tab_privs  where grantee = '&USER' or grantee in (select granted_role from dba_role_privs connect by prior granted_role = grantee start with grantee = '&USER') order by 1,2,3,4;
-- grant and revoke privilege --
grant CREATE ANY TABLE to romgudic;
REVOKE CREATE ANY table FROM romgudic;

-- user priviliages --

-- grant roles --
GRANT select, insert, update, delete ON suppliers TO test_role;
-- grant roles --
-- sequence --
-- create sequence --
CREATE SEQUENCE customers_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

-- search sequence --
select sequence_owner, sequence_name from dba_sequences;
SELECT object_name FROM all_objects WHERE object_type = 'SEQUENCE' AND owner = '<schema name>'
-- DBA_SEQUENCES -- all sequences that exist 
-- ALL_SEQUENCES  -- all sequences that you have permission to see 
-- USER_SEQUENCES  -- all sequences that you own
-- use sequence --
declare
  l_seq number;
begin
  l_seq := oe.orders_seq.nextval;
  dbms_output.put_line('Value of orders_seq.nextval = '||to_char(l_seq));
end;

-- sequence --
-- trigger --
-- create trigger --
create or replace TRIGGER CIS.HYPERION_CLI_SEQ_TRG 
before insert ON CIS.T_N_CLI_HYPERION for each row
begin
select CIS.HYPERION_CLI_SEQ.NEXTVAL into :new.sess_uid from dual;
end;
-- trigger --
-- table size --
select owner, table_name, round((num_rows*avg_row_len)/(1024*1024)) MB 
from all_tables 
where owner = 'ROMGUDIC'  -- Exclude system tables.
and num_rows > 0  -- Ignore empty Tables.
order by MB desc -- Biggest first.

select TABLE_NAME, round((num_rows*avg_row_len)/(1024*1024)) mb from 
sys.user_tables order by mb desc;
-- with statistics --
exec dbms_stats.gather_table_stats('ROMGUDIC','P_CLIENT_ADDITIONAL');

select blocks, empty_blocks, num_freelist_blocks
from   all_tables
where  owner = 'ROMGUDIC'
and    table_name = 'P_CLIENT_ADDITIONAL';
-- with statistics --
-- table size --
-- explain plan (statistics)--
select * from P_CLIENT_ADDITIONAL;
Analyze table P_CLIENT_ADDITIONAL compute statistics;

explain plan for select * from P_CLIENT_ADDITIONAL;
select * from table(dbms_xplan.display);
-- explain plan --
-- cardinality number or rows --
-- cost by cpu --
-- -----------------------------------------------------------------------------------------
-- | Id  | Operation         | Name                | Rows  | Bytes | Cost (%CPU)| Time     |
-- -----------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT  |                     |   878K|   347M|  9206   (1)| 00:02:09 |
-- |   1 |  TABLE ACCESS FULL| P_CLIENT_ADDITIONAL |   878K|   347M|  9206   (1)| 00:02:09 |
-- ---------------------------------------------------------------------------------------
-- compare tables --
select count(*) 
from 
( 
( select * from dept1 
minus 
select * from dept2 ) 
union all 
( select * from dept2 
minus 
select * from dept1 ) 
) 
-- compare tables --
-- WITH clause --
WITH
EMPLOYEE_BY_NAME AS(
SELECT FIRST_NAME,LAST_NAME,HIRE_DATE FROM EMPLOYEES)
SELECT * FROM EMPLOYEE_BY_NAME;
-- WITH clause --

-- COLLECTIONS --
Collection Type						Number of Elements				Subscript Type				Dense or Sparse						Where Created						Can Be Object Type Attribute
Associative array (or index-by table)	Unbounded						String or integer			Either								Only in PL/SQL block						No
Nested table							Unbounded						Integer						Starts dense, can become sparse		Either in PL/SQL block or at schema level	Yes
Variable-size array (Varray)			Bounded							Integer						Always dense						Either in PL/SQL block or at schema level	Yes
-- associative arrays (index-by tebles) --

-- key pair value , practically hash table -- 
DECLARE
   TYPE EmpTabTyp IS TABLE OF employees%ROWTYPE
      INDEX BY PLS_INTEGER;
   emp_tab EmpTabTyp;
BEGIN
   /* Retrieve employee record. */
   SELECT * INTO emp_tab(100) FROM employees WHERE employee_id = 100;
END;
 
-- associative arrays (index-by tebles) --
Example 5-3 Declaring Nested Tables, Varrays, and Associative Arrays

DECLARE
   TYPE nested_type IS TABLE OF VARCHAR2(30);
   TYPE varray_type IS VARRAY(5) OF INTEGER;
   TYPE assoc_array_num_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
   TYPE assoc_array_str_type IS TABLE OF VARCHAR2(32) INDEX BY PLS_INTEGER;
   TYPE assoc_array_str_type2 IS TABLE OF VARCHAR2(32) INDEX BY VARCHAR2(64);
   v1 nested_type;
   v2 varray_type;
   v3 assoc_array_num_type;
   v4 assoc_array_str_type;
   v5 assoc_array_str_type2;
BEGIN
-- an arbitrary number of strings can be inserted v1
   v1 := nested_type('Shipping','Sales','Finance','Payroll'); 
   v2 := varray_type(1, 2, 3, 4, 5); -- Up to 5 integers
   v3(99) := 10; -- Just start assigning to elements
   v3(7) := 100; -- Subscripts can be any integer values
   v4(42) := 'Smith'; -- Just start assigning to Fin
   v4(54) := 'Jones'; -- Subscripts can be any integer values
   v5('Canada') := 'North America'; -- Just start assigning to elements
   v5('Greece') := 'Europe';        -- Subscripts can be string values
END;
-- COLLECTIONS --
-- optimisation 
-- leaf nodes(double linked list, nodes are not sorted)
--	b-tree(balanced, sorted node )

-- optimisation 

-- hints --
-- do not use specified index --

-- do not use specific index --
SELECT /*+ NO_INDEX(EMPLOYEES EMP_EMP_ID_PK) */ 
       FIRST_NAME, LAST_NAME, PHONE_NUMBER
FROM EMPLOYEES where EMPLOYEE_ID=108; 

-- first 10 rows most efficienty --
SELECT /*+ FIRST_ROWS(10) */ empno, ename
FROM emp
WHERE deptno = 10;

-- to be used when full table scan is on query 
-- /*+ FULL(employee_table) PARALLEL(employee_table, 35) */
-- /*+ FULL(employee_table) PARALLEL(employee_table, DEFAULT, DEFAULT) */

-- +					Must be immediately after comment indicator, tells Oracle this is a list of hints.
-- ALL_ROWS				Use the cost based approach for best throughput.
-- CHOOSE				Default, if statistics are available will use cost, if not, rule.
-- FIRST_ROWS			Use the cost based approach for best response time.
-- RULE					Use rules based approach; this cancels any other hints specified for this statement.

-- Access Method Oracle Hints:
-- CLUSTER(table)		This tells Oracle to do a cluster scan to access the table.
-- FULL(table)			This tells the optimizer to do a full scan of the specified table.
-- HASH(table)			Tells Oracle to explicitly choose the hash access method for the table.
-- HASH_AJ(table)		Transforms a NOT IN subquery to a hash anti-join.
--ROWID(table)			Forces a rowid scan of the specified table.
--INDEX(table [index])	Forces an index scan of the specified table using the specified index(s). 
--						If a list of indexes is specified, the optimizer chooses the one with the lowest cost. 	
--					If no index is specified then the optimizer chooses the available index for the table with the lowest cost.

-- INDEX_ASC (table [index])	Same as INDEX only performs an ascending search of the index chosen, this is functionally identical to the INDEX statement.
-- INDEX_DESC(table [index])	Same as INDEX except performs a descending search. If more than one table is accessed, this is ignored.

-- INDEX_COMBINE(table index)	Combines the bitmapped indexes on the table if the cost shows that to do so would give better performance.
-- INDEX_FFS(table index)		Perform a fast full index scan rather than a table scan.
-- MERGE_AJ (table)				Transforms a NOT IN subquery into a merge anti-join.
-- AND_EQUAL(table index index [index index index])This hint causes a merge on several single column indexes. Two must be specified, five can be.

-- NL_AJ				Transforms a NOT IN subquery into a NL anti-join (nested loop).
-- HASH_SJ(t1, t2)		Inserted into the EXISTS subquery; This converts the subquery into a special type of hash join between t1 and t2 that preserves the semantics of the subquery. That is, even if there is more than one matching row in t2 for a row in t1, the row in t1 is returned only once.
-- MERGE_SJ (t1, t2)	Inserted into the EXISTS subquery; This converts the subquery into a special type of merge join between t1 and t2 that preserves the semantics of the subquery. That is, even if there is more than one matching row in t2 for a row in t1, the row in t1 is returned only once.

-- NL_SJ				Inserted into the EXISTS subquery; This converts the subquery into a special type of nested loop join between t1 and t2 that preserves the semantics of the subquery. That is, even if there is more than one matching row in t2 for a row in t1, the row in t1 is returned only once.

Oracle Hints for join orders and transformations:

-- ORDERED				This hint forces tables to be joined in the order specified. If you know table X has fewer rows, then ordering it first may speed execution in a join.
-- STAR					Forces the largest table to be joined last using a nested loops join on the index.
-- STAR_TRANSFORMATION	Makes the optimizer use the best plan in which a start transformation is used.
-- FACT(table)			When performing a star transformation use the specified table as a fact table.
-- NO_FACT(table)		When performing a star transformation do not use the specified table as a fact table.
-- PUSH_SUBQ			This causes nonmerged subqueries to be evaluated at the earliest possible point in the execution plan.
-- REWRITE(mview)		If possible forces the query to use the specified materialized view, if no materialized view is specified, the system chooses what it calculates is the appropriate view.
-- NOREWRITE			Turns off query rewrite for the statement, use it for when data returned must be concurrent and can't come from a materialized view.
-- USE_CONCAT			Forces combined OR conditions and IN processing in the WHERE clause to be transformed into a compound query using the UNION ALL set operator.
-- NO_MERGE (table)		This causes Oracle to join each specified table with another row source without a sort-merge join.
-- NO_EXPAND			Prevents OR and IN processing expansion.

-- Oracle Hints for Join Operations:

 

USE_HASH (table)
 

This causes Oracle to join each specified table with another row source with a hash join.

USE_NL(table)

This operation forces a nested loop using the specified table as the controlling table.

USE_MERGE(table,[table, - ])

This operation forces a sort-merge-join operation of the specified tables.

DRIVING_SITE

The hint forces query execution to be done at a different site than that selected by Oracle. This hint can be used with either rule-based or cost-based optimization.

LEADING(table)

The hint causes Oracle to use the specified table as the first table in the join order.

Oracle Hints for Parallel Operations:

 

[NO]APPEND

This specifies that data is to be or not to be appended to the end of a file rather than into existing free space. Use only with INSERT commands.

NOPARALLEL (table

This specifies the operation is not to be done in parallel.

-- PARALLEL(table, instances)			This specifies the operation is to be done in parallel.

PARALLEL_INDEX

Allows parallelization of a fast full index scan on any index.

Other Oracle Hints:

 

CACHE

Specifies that the blocks retrieved for the table in the hint are placed at the most recently used end of the LRU list when the table is full table scanned.

NOCACHE

Specifies that the blocks retrieved for the table in the hint are placed at the least recently used end of the LRU list when the table is full table scanned.

[NO]APPEND

For insert operations will append (or not append) data at the HWM of table.

UNNEST

Turns on the UNNEST_SUBQUERY option for statement if UNNEST_SUBQUERY parameter is set to FALSE.

NO_UNNEST

Turns off the UNNEST_SUBQUERY option for statement if UNNEST_SUBQUERY parameter is set to TRUE.

PUSH_PRED

 Pushes the join predicate into the view.


-- hints --
-- parallelism --
ALTER SESSION FORCE PARALLEL DML;
ALTER SESSION DISABLE PARALLEL DML;

-- parallelism --

-- tuning advisor --
-- priviliage --
GRANT ADVISOR TO my_user;
-- tuning advisor --

-- administrative tasks --
-- with system user ALL REPORTS -> DATA DICTIONARY REPORTS->DATABASE ADMINISTRATION
-- administrative tasks --

-- exception --
-- SQLCODE returns error number
-- SQLERRM returns error msg
exception WHEN others THEN 
    dbms_output.put_line('Failed ('||SQLCODE||'): ' ||SQLERRM); 

-- exception --

-- unique identifier --
select SYS_GUID() from sys.dual; -- return raw(16) 
select RAWTOHEX(SYS_GUID()) from sys.dual; -- RAWTOHEX to varchar2
-- unique identifier --

-- procedure name --
-- $$PLSQL_UNIT;
-- $$PLSQL_LINE;
owa_util.get_procedure
-- procedure name --