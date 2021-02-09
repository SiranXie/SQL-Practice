###177. Nth Highest Salary

Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

Solution: 
`1`
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
     SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT N, 1),
    NULL) AS getNthHighestSalary    
  );
END

Takeaway:
CREATE FUNCTION 
https://www.sqlservertutorial.net/sql-server-user-defined-functions/sql-server-scalar-functions/




`2`
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary AS getNthHighestSalary
      FROM Employee e
      WHERE (SELECT COUNT(DISTINCT Salary) 
      		FROM Employee p 
      		WHERE e.Salary <= p.Salary) = N
      );
END






