###SQL Schema
DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs 
(
  Id int, 
  Num int);
  
`INSERT INTO Logs VALUES (1, 1),(2, 1),(3, 1),(4, 2),(5, 1),(6, 2),(7,2)

Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
`
Solution:
/* Write your T-SQL query statement below */
WITH cte1 AS
(SELECT CASE
        WHEN Num = LEAD(Num,1) OVER (ORDER BY Id) AND Num = LEAD(Num,2) OVER (ORDER BY Id)             THEN Num 
        ELSE NULL END AS ConsecutiveNums
FROM Logs )
SELECT DISTINCT ConsecutiveNums
FROM cte1
WHERE ConsecutiveNums IS NOT NULL;

Takeaway:
LEAD() OVER() 
LAG() OVER()



MySQL solution:
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;
