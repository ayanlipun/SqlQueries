/*================================================*/
/* Different way to find the Duplicate Records*/
/*================================================*/   

/*Creating sample table Employee

CREATE TABLE Employee
(
[ID] INT identity(1,1),
[FirstName] Varchar(100),
[LastName] Varchar(100),
[Country] Varchar(100),
)
GO
Insert into Employee ([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),
('Raj','Gupta','India'),
('Mohan','Kumar','USA'),
('James','Barry','UK'),
('James','Barry','UK'),
('James','Barry','UK')
*/

Select * from Employee

/*
1. Using Group BY And Having Clause
------------------------------------

Select emp.FirstName, emp.LastName, emp.Country, COUNT(*) as CNT  
from Employee emp
Group by emp.FirstName, emp.LastName, emp.Country
Having COUNT(*) >1

*/
-- 2.Using MAX()  

Select * from Employee where Id not in
(Select MAX(Id) from Employee emp
group by emp.FirstName, emp.LastName, emp.Country)


--3.CTE WITH RANK(),ROWNUMBER()

;With CTE (
firstName, Last, Country, duplicateCount)
AS (Select emp.FirstName, emp.LastName, emp.Country, ROW_NUMBER() over (partition by  emp.FirstName, emp.LastName, emp.Country order by Id) as duplicate_count  from Employee emp)

Select * from CTE



--RANK(), DENSE_RANK(), ROW_NUMBER() diffrence

--CREATE TABLE RankEmployees (
--  id integer,
--  first_name varchar(20),
--  last_name varchar(20),
--  position varchar(20),
--  salary varchar(20)
--)

--INSERT INTO RankEmployees VALUES 
--(1, 'Andrew', 'Brown', 'Manager', 100000),
--(2, 'Maria', 'Johnson', 'Manager', 105000),
--(3, 'John', 'Anderson', 'Senior Manager', 130000),
--(4, 'Alex', 'Purple', 'Associate', 50000),
--(5, 'George', 'Bull', 'Senior Associate', 65000),
--(6, 'Jess', 'Fridman', 'Associate', 48000),
--(7, 'Marion', 'White', 'Senior Associate', 65000),
--(8, 'Andreea', 'Berton', 'Manager', 102000),
--(9, 'Bob', 'Johanson', 'Associate', 45000),
--(10, 'Georgia', 'Hoffman', 'Senior Associate', 66000),
--(11, 'Johan', 'Peterson', 'Senior Associate', 58000);

Select * from RankEmployees

SELECT  *,  RANK() OVER (PARTITION BY position  ORDER BY salary DESC) AS emp_pos_rank
FROM 
  RankEmployees;

  SELECT 
  *,
  DENSE_RANK() OVER (PARTITION BY position  ORDER BY salary DESC) AS emp_pos_rank
FROM 
  RankEmployees;

  SELECT 
  *,
  ROW_NUMBER() OVER (PARTITION BY position  ORDER BY salary DESC) AS emp_pos_rank
FROM 
  RankEmployees;