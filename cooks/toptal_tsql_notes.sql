-- null
-- null = null cannot be compared, use IS NULL to compare if value si null
select case when null =  null then 'Yup' else 'Nope' end as Result;
-- returns: 'Nope'

-- null in NOT IN subquery
-- returns: if value NULL is in subquery , Empty recordset will be returned regardless if there is matching rows, 

-- null in WHERE clause
-- NULL in where will be ignored (e.g. where value <> 2, if value is NULL this record will not be returned in result)


-- cartesian product(cross join)
select *  from tbl1, tbl2 ; (tbl1)*count(tbl1)

-- CASE in update statement
UPDATE SALARIES SET sex = CASE sex WHEN 'm' THEN 'f' ELSE 'm' END

-- using union all as union(to avoid high load performance with union, due to distinct)
select * from tbl  where a = X
union all
select * from tbl  where b = Y and a!=x

-- execution plan(estimated and actual), graphical plan that shows how much work SQL server needs
-- to perform to retrieve requested data

-- modulo operator %
select 6%3 -- result 0

-- NVL, NVL2
-- nvl = ISNULL, NVL2 = COALESCE

-- partition function RANK() diff DENSE_RANK()
-- DECNSE_RANK() ranking function without skipping values when duplicate

-- FOR XML PATH tavle values to xml string; 
-- char vs varchar2, varchar2 allocates as much spaces as lenght of string +2 , char all declared spaces , empty data is padded
-- with blanks

--  SET IDENTITY_INSERT TABLE1 ON

