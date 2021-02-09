#181. Employees Earning More Than Their Managers (Easy)
##SQL Schema
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int)
Truncate table Employee
insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3')
insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4')
insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', 'None')
insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', 'None')



The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+


Solution:
SELECT      Employee.Name AS Employee
FROM        Employee 
INNER JOIN 
(
SELECT      *
FROM        Employee) AS managertable
ON          Employee.ManagerId=managertable.Id
WHERE       Employee.Salary>managertable.Salary;


`2` Using a Cartesian product
SELECT e.Name AS Employee 
FROM Employee e,
     Employee s
WHERE 
	e.ManagerId = s.Id
	AND e.Salary > s.Salary;







`1.Using a self join as it is contained in one table where 
the salary of this is greater than the other`
SELECT e.Name AS Employee 
FROM Employee e
JOIN Employee s
ON e.ManagerId = s.Id # match the managerId that is a match to Id
WHERE (SELECT e.Salary > s.Salary);


