###176. Second Highest Salary-Easy
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

#### SOLUTION:
`1`
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary

Takeaway:
LIMIT 5 OFFSET 1 = LIMIT 1,5


`2`
# Generic SQL Solution, using IN in Non - Correlated SubQuery`
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary NOT IN
    (SELECT MAX(Salary)
     FROM Employee);


`3`
# Generic SQL Solution, using < in Non - Correlated SubQuery`
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary <
    (SELECT MAX(Salary)
     FROM Employee);

`4`
SELECT IFNULL(
		(SELECT DISTINCT Salary 
		FROM Employee e 
		WHERE (SELECT COUNT(DISTINCT Salary) 
			   FROM Employee p 
			   WHERE e.Salary <= p.Salary) = 2),NULL)AS SecondHighestSalary;