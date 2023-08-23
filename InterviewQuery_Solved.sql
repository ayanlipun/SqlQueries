/*================================================*/
/* Different way to find the Duplicate Records*/
/*================================================*/   


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