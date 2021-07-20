SELECT
    Person.FirstName,
    Person.LastName,
    Address.City,
    Address.State
FROM 
    Person
LEFT JOIN
    Address
ON
    Person.PersonId = Address.PersonId

SELECT
    Person.FirstName,
    Person.LastName,
    Address.City,
    Address.State
FROM 
    Person
LEFT JOIN
    Address
ON
    Person.PersonId = Address.PersonId

SELECT
        Salary SecondHighestSalary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1


SELECT
    Max(Salary) SecondHighestSalary
FROM Employee 
WHERE Salary <> (SELECT Max(Salary) a FROM Employee)



SELECT
    A.NAME Employee
FROM 
    Employee A
LEFT JOIN
    Employee B
ON 
    A.ManagerId=B.Id
WHERE 
    A.Salary > B.Salary


SELECT
    T.Email
FROM (
    SELECT 
        Email,
        Count(Id) Total
    FROM Person
    GROUP BY Email ) AS T
WHERE T.Total > 1

SELECT 
    T.Customers Customers
FROM (
    SELECT 
       Customers.Name Customers,
       Orders.CustomerId Orders
    FROM 
        Customers
    LEFT JOIN (
        SELECT 
            *
        FROM Orders
        GROUP BY CustomerId
        ORDER BY Id ASC) AS Orders
    ON Customers.Id=Orders.CustomerId) AS T
WHERE 
    T.Orders IS NULL

DELETE 
FROM Person 
WHERE
    Id 
NOT IN ( 
    SELECT 
        T.Id 
    FROM (
         SELECT 
            Min(Id) AS Id 
         FROM 
            Person 
         GROUP BY email) T
)


SELECT
    T.id
FROM (
    SELECT
        w1.Temperature t1,
        Date(w1.RecordDate) rd1,
        w2.Temperature t2,
        w2.id id
    FROM 
        Weather w1
    LEFT JOIN
        Weather w2
    ON w1.id = w2.id+1
    ORDER BY rd1 ASC
) AS T
WHERE
    T.t2 > T.t1


	SELECT
    w1.id AS 'Id'
FROM
    weather w1
        JOIN
    weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
        AND w1.Temperature > w2.Temperature
	
	
	
	
	
	
SELECT
    T.class class
FROM (
    SELECT
        C.class,
        Count(C.class) total
    FROM (
        SELECT 
			class,
			Count(student) total
		FROM courses 
		GROUP BY student
    ) AS C        
    GROUP BY C.class) AS T
WHERE T.total >= 5



SELECT 
    * 
FROM
    Cinema
WHERE
    id % 2 <> 0
AND
    description <> 'boring'
ORDER BY rating DESC
