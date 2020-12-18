

## SQL

####**QUESTIONS?**

[interviewbit.com/sql-interview-questions/](https://www.interviewbit.com/sql-interview-questions/)

<details><summary>What is Database?</summary>

```
is organized collection of data, stored and can be digitally retrieved from local or remote computer.
```
</details>

<details><summary>What is DBMS?</summary>

```
Database management system is software system responsible for creation, retrival and management of databse. It is interface between application and database 
```

</details>


<details><summary>What is RDBMS? How is it different from DBMS?</summary>

```
Relation DBMS is software system in which database is organized in collection of tables and in which it is possible to define relation between common fields of table.
```

</details>

<details><summary>What is SQL?</summary>

```
SQL is standrad query language for DBMS system.
```

</details>

<details><summary>Difference between SQL and MySQL?</summary>

```
MySQL is DBMS. 
```

</details>

<details><summary>What is constraint?</summary>

Are used to specify rules on data, can be applied on single or multiple column. The constraint are:
* NOT NULL - Restricts NULL value from being inserted into a column.
* CHECK - Verifies that all values in a field satisfy a condition.
* DEFAULT - Automatically assigns a default value if no value has been specified for the field.
* UNIQUE - Ensures unique values to be inserted into the field.
* INDEX - Indexes a field providing faster retrieval of records.
* PRIMARY KEY - Uniquely identifies each record in a table.
* FOREIGN KEY - Ensures referential integrity for a record in another table.

</details>

<details><summary>What is PRIMARY key?</summary>

```
It is constaint which uniquely identifies row within table. It id uniques, each table in RDBMS can only have single PK which is defined as NOT NULL 
```

</details>

<details><summary>What is UNIQUE constraint?</summary>

```
When set on the column ensures that each value in the table must be different. 
```

</details>

<details><summary>What is FOREIGN key?</summary>


```
It is a constraint on single or multiple table that reffers to PRIMARY key on another table. It ensures 
REFERENTIAL integrity between tables.  


```
</details>

<details><summary>What is JOIN? List of different types</summary>

```
sql syntax to retrieve data from 2 or more tables. Types of join to differenciate:

* INNER,
* RIGHT,
* LEFT,
* FULL,
* CROSS


```

</details>

<details><summary>What is SELF-JOIN?</summary>

```
when table is joined to itself based on columns relation 

```

</details>

<details><summary>What is CROSS-JOIN?</summary>

```
it is Cartesian product of two table.

```

</details>

<details><summary>What is INDEX?</summary>

```

it is data structure which provides a quick lookup of column or columns data.
we can differenciate:
* unique index, non-unique index
* clustered, non-clustered index 
* composite index

```

</details>

<details><summary>What is difference between Clustered and Non-clustered index?</summary>

```

with clustered index complete key value of index is tored, with non-clustered index, addres cotaining value(rather then value) is stored.

```

</details>


<details><summary>What is data integrity?</summary>

```

it assures consistency and accuracy of the data over entire lyfe-cycle of data. By defining integrity constraints and enforcing a bussines rules.

```

</details>

<details><summary>What is NORMALIZATION?</summary>

```

represents efficient organisation of data in database, so inconsistency and redundancy is kept checked.

* FIRST NORMAL
* SECOND NORMAL
* THIRD NORMAL

```

</details>

<details><summary>What is DERNORMALIZATION?</summary>

```

it is reverse process. When normalized data are de-normalized.
This will be done due to performance improvements. 


```

</details>
