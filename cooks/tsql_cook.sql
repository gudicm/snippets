-- types
Binary Strings
Binary
Varbinary

Character Strings
Char
Varchar

Date and Time
Datestr
Datetime
Datetime2
Datetimeoffset
Smalldatetime
Time

Numerics
Bigint
Int
Smallint
Tinyint
Decimal
Numeric

Unicode Character Strings
Nchar
Nvarchar


-- @@ROWCOUNT reads number of affected rows from previous statement (also works on update and insert).



-- Identity --
-- sequence seed in TSQL, it is enough to declare column in table with identity to have seed for column value a.g. 
[DatabaseLogID] [int] IDENTITY(1,1) NOT NULL
-- Identity --

Other Data Types
Rowversion
Uniqueidentifier
Table

-- SCOPE IDENTITY --
-- select SCOPE_IDENTITY() - returns last value to be inserted to identity column within same scope(procedure)
-- SCOPE IDENTITY --


--select with case --
-- simple --
SELECT   ProductNumber, Category =
      CASE ProductLine
         WHEN 'R' THEN 'Road'
         WHEN 'M' THEN 'Mountain'
         WHEN 'T' THEN 'Touring'
         WHEN 'S' THEN 'Other sale items'
         ELSE 'Not for sale'
      END,
   Name
FROM Production.Product
ORDER BY ProductNumber;
GO

--end select with case --

-- joins
-- inner
SELECT c.customer_id, c.customer_name, ctr.contract_id, ctr.amount 
 FROM customers c, contracts ctr 
WHERE c.customer_id = ctr.customer_id 
   AND ctr.amount > 900 ; 
 
SELECT *
FROM HumanResources.Employee AS e
    INNER JOIN Person.Person AS p
    ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY p.LastName
 
--cross

SELECT p.BusinessEntityID, t.Name AS Territory
FROM Sales.SalesPerson p
CROSS JOIN Sales.SalesTerritory t
ORDER BY p.BusinessEntityID;

-- left
SELECT c.customer_id, c.customer_name, ctr.contract_id, ctr.amount 
 FROM customers c LEFT JOIN contracts ctr 
    ON c.customer_id = ctr.customer_id 
ORDER BY c.customer_id ; 

USE AdventureWorks2008R2;
GO
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
LEFT OUTER JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID

-- right
SELECT c.customer_id, c.customer_name, c.user_name 
 FROM users u RIGHT JOIN customers c 
    ON c.user_name = u.user_name 
ORDER BY c.customer_id ;    

USE AdventureWorks2008R2;
GO
SELECT st.Name AS Territory, sp.BusinessEntityID
FROM Sales.SalesTerritory st 
RIGHT OUTER JOIN Sales.SalesPerson sp
ON st.TerritoryID = sp.TerritoryID ;

-- union
USE AdventureWorks2012;
GO
SELECT ProductModelID, Name
FROM Production.ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT ProductModelID, Name
FROM dbo.Gloves
ORDER BY Name;
GO

-- if objects exists
USE AdventureWorks2012;
GO
IF OBJECT_ID ('dbo.Gloves', 'U') IS NOT NULL
DROP TABLE dbo.Gloves;
GO

-- update
UPDATE customers
SET first_name = 'Judy'
WHERE customer_id = 8000;
-- update inner join
UPDATE sod
SET sod.ModifiedDate = soh.ModifiedDate 
FROM AdventureWorks2008.Sales.SalesOrderHeader soh
INNER JOIN AdventureWorks2008.Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID


-- delete
DELETE FROM Production.ProductCostHistory
WHERE StandardCost > 1000.00;
GO
-- delete inner join
DELETE FROM Sales.SalesPersonQuotaHistory 
FROM Sales.SalesPersonQuotaHistory AS spqh
INNER JOIN Sales.SalesPerson AS sp
ON spqh.BusinessEntityID = sp.BusinessEntityID
WHERE sp.SalesYTD > 2500000.00;
GO

-- setting variable (SET, select)--
SET @ModelID = (SELECT m.modelid 
                  FROM MODELS m
                 WHERE m.areaid = 'South Coast')

SELECT @ModelID = m.modelid 
  FROM MODELS m
 WHERE m.areaid = 'South Coast'

-- USER FUNCTIONS
-- scalar function
CREATE FUNCTION /*function_name*/(
	/* 
	@param1 data_type,
	@param2 data_type
	*/
) 
RETURNS /*data_type*/
BEGIN
	DECLARE
    	@v_ret /*data_type*/

	SET @v_ret = /*expression*/
	
	RETURN @v_ret
END

-- ITVF
CREATE FUNCTION /*inline_function_name*/ 
	(/*@param1*/ /*data_type_for_param1*/, 
	 /*@param2*/ /*data_type_for_param2*/)
RETURNS TABLE 
AS
	RETURN SELECT   @p1 AS c1, 
			@p2 AS c2
GO
-- =============================================
-- Example to execute function
-- =============================================
SELECT * 
FROM /*owner*/./*inline_function_name*/ 
	(/*value_for_@param1*/, 
	 /*value_for_@param2*/)
	 
-- ITVF


 
-- USER FUNCTIONS

-- TRIGGERS

-- database triggers
-- table triggers
-- if enabled
SELECT OBJECT_NAME(parent_id) [table_name],[name] [trigger_name],is_disabled
FROM sys.triggers WHERE sys.triggers.is_disabled = 0 

-- tables trigger, is object created on table with statement to be executed on events handlers
-- implemented within trigger 


-- TRIGGERS
 
-- sys procedures

-- sp_rename 
EXEC sp_rename 'Rules.validationRules.Last Change', 'LastChange', 'COLUMN';
EXEC sp_rename 'tblTemp_Excel_temp', 'tblTemp_Excel_le'   -- change name of table
-- sp_columns 
exec sp_columns 'hnbtagvrijednosti_cofi_xml','dbo' 
exec sp_columns 'validationrules','rules'
-- sp_help return information about object name and object type
EXEC sp_help;
exec sp_help 's_izvjestajoperator'
-- sp_helpindex information about indexes on given table
EXEC sp_helpindex 'hnbtagvrijednosti_cofi_xml' 
-- sp_keys info about PK on given table and current db
exec sp_pkeys 'hnbtagvrijednosti_cofi_xml','dbo','cdp2hnb_reporting'
-- sp_tables 
exec sp_tables 
-- Sp_table_privileges 
exec Sp_table_privileges 'hnbtagvrijednosti_cofi_xml'
-- sp_server_info
exec sp_server_info
-- sp_stored_procedures
exec sp_stored_procedures 
--sp_who 
exec sp_who
exec sp_who 'active'



-- return exact number of rows from table TOP keyword
select top 5 * from samples


-- truncate, similiar as delete but faster and without logging of individual row deletion 
USE AdventureWorks2012;
GO
SELECT COUNT(*) AS BeforeTruncateCount 
FROM HumanResources.JobCandidate;
GO
TRUNCATE TABLE HumanResources.JobCandidate;
GO
SELECT COUNT(*) AS AfterTruncateCount 
FROM HumanResources.JobCandidate;
GO

-- COMPABILITY_LEVEL --
USE AdventureWorks2012;  
GO  
SELECT compatibility_level  
FROM sys.databases WHERE name = 'AdventureWorks2012';  
GO 
 
ALTER DATABASE AdventureWorks2012  
SET COMPATIBILITY_LEVEL = 120;  
GO  
  
  
-- COMPABILITY_LEVEL --

-- IDENTITY_INSERT --
SET IDENTITY_INSERT dbo.Tool ON;


-- built - in functions --
-- CONVERT, CAST --
-- time(from date to varchar)
select convert(varchar, getdate(), 112) -- curent date to format 'yyyymmdd'
SELECT convert(datetime, '23.10.2016', 104) -- varchar to date 'dd.MM.YYYY'
DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0) -- cast time from date --

-- STRING FUNCTION --
charIndex
patiIndex
len
trim
substring
-- STRING FUNCTION -- 
-- RANKING FUNCTION --  
rank, ntile, dense_rank, row_number

USE AdventureWorks2012;
GO
SELECT p.FirstName, p.LastName
    ,ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS "Row Number"
    ,RANK() OVER (ORDER BY a.PostalCode) AS Rank
    ,DENSE_RANK() OVER (ORDER BY a.PostalCode) AS "Dense Rank"
    ,NTILE(4) OVER (ORDER BY a.PostalCode) AS Quartile
    ,s.SalesYTD
    ,a.PostalCode
FROM Sales.SalesPerson AS s 
    INNER JOIN Person.Person AS p 
        ON s.BusinessEntityID = p.BusinessEntityID
    INNER JOIN Person.Address AS a 
        ON a.AddressID = p.BusinessEntityID
WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0;

-- RANKING FUNCTION --
rank() (returns rank of each row within partition)
dense_rank() (returns rank of each row within partition without any gaps)
row_number() (returns sequential number in partition)
ntile() (distributes a row in ordered fashion in specified number of groups)

USE AdventureWorks2012;
GO
SELECT p.FirstName, p.LastName
    ,ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS "Row Number"
    ,RANK() OVER (ORDER BY a.PostalCode) AS Rank
    ,DENSE_RANK() OVER (ORDER BY a.PostalCode) AS "Dense Rank"
    ,NTILE(4) OVER (ORDER BY a.PostalCode) AS Quartile
    ,s.SalesYTD
    ,a.PostalCode
FROM Sales.SalesPerson AS s 
    INNER JOIN Person.Person AS p 
        ON s.BusinessEntityID = p.BusinessEntityID
    INNER JOIN Person.Address AS a 
        ON a.AddressID = p.BusinessEntityID
WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0;

-- END RANKING FUNCTION --
-- AGGREGATE FUNCTIONS --
-- only with select list in select statement
-- or with HAVING clause

AVG()
MAX()
BINARY_CHECKSUM()
MIN()
CHECKSUM()
SUM()
CHECKSUM_AGG()
STDEV()
COUNT()
STDEVP()
COUNT_BIG()
VAR()
GROUPING()
VARP()

-- AGGREGATE FUNCTIONS --
-- DATE AND TIME FUNCTIONS

DATEADD			Deterministic		DATEADD(datepart,number,date)
									SELECT DATEADD(dd,1,getdate())	--	adding a day to current date
									SELECT DATEADD(yy,1,getdate())	-- adding a date to current year


DATEDIFF 		Deterministic		DATEDIFF(datepart,startdate,enddate)
									SELECT DATEDIFF(dd, getdate(),(getdate() + 1)) -- retVal = 1, calculation done on day level
									SELECT DATEDIFF(yy, getdate(),(getdate() + 1)) -- retVal = 0, calculation done on year level

DATENAME		Nondeterministic	DATEADD(datepart,date)
									SELECT DATENAME(yy, getdate())	-- retuns year for date
DATEPART		Deterministic 
DAY				Deterministic
GETDATE			Nondeterministic
GETUTCDATE		Nondeterministic
MONTH			Deterministic
YEAR			Deterministic

-- DATE AND TIME FUNCTIONS
-- MATHEMATICAL FUNCTIONS --
-- MATHEMATICAL FUNCTIONS --

-- system procedures
-- add

-- transactions
-- add

-- check if procedure exists
select * FROM	sys.procedures AS p where p.name = 'proc_name'

-- loops --
-- if --
IF Boolean_expression 
     { sql_statement | statement_block } 
END IF

-- * if else*--
-- if --
IF Boolean_expression 
     { sql_statement | statement_block } 
[ ELSE 
     { sql_statement | statement_block } ] 

-- example --
IF @cost <= @compareprice 
BEGIN
    PRINT 'These products can be purchased for less than 
    $'+RTRIM(CAST(@compareprice AS varchar(20)))+'.'
END
ELSE
    PRINT 'The prices for all products in this category exceed 
    $'+ RTRIM(CAST(@compareprice AS varchar(20)))+'.'
END
-- * if else *--

-- end loops--
-- indexes --
-- clustered, on primary key, field value is usually identity,field values sorted --
-- non clustered, index contains key which is pointer to data row  with same key --
-- example of non-clustered key on PK --
-- create table--
CREATE TABLE dbo.Package(
               PackageID int IDENTITY(1,1) NOT ,
               ..,
               CreateDate datetime NOT NULL,
               UpdateDate datetime NULL,
               CreateDateKey  AS (CONVERT(int,CONVERT(varchar(8),CreateDate,(112)))),
CONSTRAINT PK_Package PRIMARY KEY (PackageID ASC));
--  persist CreateDateKey --
ALTER TABLE dbo.Package DROP COLUMN CreateDateKey;
ALTER TABLE dbo.Package ADD CreateDateKey AS (CONVERT(INT,CONVERT(varchar(8),CreateDate,112))) PERSISTED;
-- Delete old PK --
ALTER TABLE [dbo].[Package] DROP CONSTRAINT [PK_Package];
-- Generate unique clustered index on CreateDateKey,PackageID --
CREATE UNIQUE CLUSTERED INDEX CIDX_Package ON dbo.[Package](CreateDateKey, PackageID)
                WITH (ONLINE = ON, DATA_COMPRESSION = ROW)
-- rebuild PK --
ALTER TABLE dbo.Package WITH CHECK ADD CONSTRAINT [PK_Package] PRIMARY KEY NONCLUSTERED
(PackageID) ON [PRIMARY]				
-- indexes --

-- FK --
-- if table has FK set on , table cannot be truncated due to constraint on dependency object
-- FK will probably refleft on performance during insert, merge and delete
-- FK --

-- select into --
SELECT *
INTO newtable [IN externaldb]
FROM table1;
-- select into --

-- dynamic 	sql --
-- using EXEC --
-- from sql 2005 --
SET @columnList = 'CustomerID, ContactName, City'
SET @city = '''London'''
SET @sqlCommand = 'SELECT ' + @columnList + ' FROM customers WHERE City = ' + @city
EXEC (@sqlCommand)

-- sp_executesql --
-- with return type --
DECLARE @SQLString NVARCHAR(500);
DECLARE @ParmDefinition NVARCHAR(500);
DECLARE @IntVariable INT;
DECLARE @Lastlname varchar(30);
SET @SQLString = N'SELECT @LastlnameOUT = max(LastName)
                   FROM Person.Contact WHERE ContactId = @level';
SET @ParmDefinition = N'@level tinyint,
                        @LastlnameOUT varchar(30) OUTPUT';
SET @IntVariable = 10;
EXECUTE sp_executesql @SQLString, @ParmDefinition, @level = @IntVariable, @LastlnameOUT=@Lastlname OUTPUT;
SELECT @Lastlname;
-- sp_executesql --

-- variable value from dynamic sql(easy way)

DECLARE @rcount NUMERIC(18,0)   
set @step2cmd = 'select count(*) from uat.ap.ztscm_protocollo' --+ @nometab
EXECUTE @rcount=sp_executesql @step2cmd
select @rcount

-- with return type --

--	dynamic sql --

-- convert (date and time) --
SELECT cast(SYSDATETIME() AS varchar)
SELECT convert(varchar,SYSDATETIME(),112) -- to yyyymmdd string

-- convert (date and time) --

-- STATISTICS (UPDATE) --
-- TO BE USED FOR QUERY OPTIMISATION --
EXEC sys.sp_updatestats; -- UPDATES ALL TABLE(SYS AND USER DEFINED) IN DB, ONLY IF USER HAS ADMIN PRIVILIAGE

UPDATE STATISTICS Person.Address WITH RESAMPLE; -- ON SPECIFIC TABLE IN DB

-- STATISTICS (UPDATE) --

-- database exist --
IF DB_ID('Komisioni') IS NOT NULL
BEGIN
	PRINT 'Database exist...'
END
ELSE
BEGIN
	PRINT 'not exist...'
END

IF EXISTS(SELECT * FROM master.sys.databases 
          WHERE name='SqlHintsDB')
-- database exist --

-- adding padding to string --
-- eg. converting num value to value with padded zeroes --
-- 1112 to '00001112' --
select (REPLICATE('0',8-LEN(RTRIM(Contacting.TEMP_DM_Client.Code))) + RTRIM(Contacting.TEMP_DM_Client.Code)) AS CLIENT_CODE


-- DIRECTIVES
SET ANSI_NULLS ON	-- select return 0 if result is null
SET NOCOUNT ON		-- count will not be returned

@@TRANCOUNT			-- number of BEGIN TRANSACTION in current session    
@@ROWCOUNT 			-- number of records affected or read

-- DIRECTIVES

SELECT top 10 * FROM Production.Product p
PRINT @@ROWCOUNT


-- DBA admin
-- OPTIMISATION --
-- DMV Dynamic Management Views and Functions
sys.dm_clr_loaded_assemblies - Assemblies in available in SQL Server
sys.dm_db_file_space_usage - Database file usage to determine if databases are getting low on space and need immediate attention
sys.dm_exec_cached_plans - Cached query plans available to SQL Server
sys.dm_exec_sessions - Sessions in SQL Server
sys.dm_exec_connections - Connections to SQL Server
sys.dm_db_index_usage_stats - Seeks, scans, lookups per index
sys.dm_db_index_physical_stats -index fragmentation
sys.dm_io_virtual_file_stats - IO statistics for databases and log files
sys.dm_broker_connections - Service Broker connections to the network
sys.dm_os_memory_objects - SQL Server memory usage
sys.dm_tran_active_transactions - Transaction state for an instance of SQL Server
-- DMV Dynamic Management Views and Functions

-- SQL PROFILER
-- for tracing executed sql statements against SQL server
-- SQL PROFILER
-- PERFORMANCE REPORTS IN SSMS

-- PERFORMANCE REPORTS IN SSMS
-- DBA admin


-- EXECUTION PLAN --
--join explanation
--NESTED JOIN 	 - used when outer table is small and inner table is bigger
--MERGE JOIN		- prerequirements that both inputs are sorted on join keys/merge, Better performance than
--			nested join
--HASH JOIN 		least efficient when input tables are large and no adequate index exist on them
-- EXECUTION PLAN --
 
-- HINTS --
-- using OPTION clause e.g
SELECT *   
FROM Sales.Customer AS c  
INNER JOIN Sales.CustomerAddress AS ca ON c.CustomerID = ca.CustomerID  
WHERE TerritoryID = 5  
OPTION (MERGE JOIN);  
GO 


-- no lock hint
SELECT * FROM EVIDPRO.EvidencijaOvjereProizvoda WITH(NOLOCK)
-- HINTS --
 
-- OPTIMISATION --

-- PARTITIONING --
-- optimising db tables by creating partition tables on existing records, and aligning index search according to table partitioning
 -- - create additional filegroups on DB(with filegroup it is possible to manage properties of multiple files)
 --  - add files(.ndf) to filegroups 
 ALTER DATABASE Practice
ADD FILE 
  (NAME = N'2003Q3',
  FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\2003Q3.ndf',
  SIZE = 5MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 5MB)
TO FILEGROUP [2003Q3]


-- PARTITIONING --

-- HISTOGRAM --
-- histogram and density are used to calculate cardinality with estimation plan
-- HISTOGRAM --

-- OFFSEt(pagination) --
-- sql offsets are slow 
-- will be slow
SELECT first_name, last_name, score
FROM players
WHERE game_id = 42
ORDER BY score DESC
LIMIT 10
OFFSET 100000;

-- OFFSEt(pagination) --

-- DB link

-- DB link( End)

-- /
-- snippets
-- ADD column
ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL ;  
GO  
-- ADD column with constraint
ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL   
CONSTRAINT exb_unique UNIQUE ;    

-- remove column
ALTER TABLE dbo.doc_exb DROP COLUMN column_b ;  
GO  
-- Remove multiple columns.  
ALTER TABLE dbo.doc_exb DROP COLUMN column_c, column_d;  

-- RENAME TABLE
EXEC sp_rename 'Sales.SalesTerritory', 'SalesTerr'; 

-- snippets

-- MERGE
MERGE targetTable
Using sourceTable
ON mergeCondition
WHEN MATCHED
THEN updateStatement
WHEN NOT MATCHED BY TARGET
THEN insertStatement
WHEN NOT MATCHED BY SOURCE
THEN deleteStatement


-- TRACING --
- sql profiler
- ssms -sessions -  events - longRCP
-- TRACING --

-- BRENT OZAR TOOLS (ADMINISTRATION AND PERFORMANCE)
-- sp_Blitz		health checker for db
EXEC master.dbo.sp_Blitz -- warning on server with priority less than 50
-- @IgnorePrioritiesAbove = 50
-- @CheckUserDatabaseObjects = 0 -- ignores user dbs like if we have sharepoint or dynamics db on server

-- outputs result to output table in output DB
EXEC master.dbo.sp_Blitz @IgnorePrioritiesAbove = 50, @OutputDatabaseName = 'DbaTools',@OutputSchemaName = 'dbo',@OutputTableName = 'BlitzResults'

-- sp_BlitzCache -- tune your queries




-- BRENT OZAR TOOLS (ADMINISTRATION AND PERFORMANCE)

 
-- BRENT OZAR TOOLS (ADMINISTRATION AND PERFORMANCE)
