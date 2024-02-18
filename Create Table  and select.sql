--  Use databse
USE Practice;

-- Create Table
CREATE TABLE Manager (
  Id INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Salary INT NOT NULL
);

INSERT INTO Manager (Id, Name, Salary)
VALUES
  (1, 'Harpreet', 20000),
  (2, 'Ravi', 30000),
  (3, 'Vinay', 10000),
  (4, 'Ravi', 30000),
  (5, 'Harpreet', 20000),
  (6, 'Vinay', 10000),
  (7, 'Rajeev', 40000),
  (8, 'Vinay', 10000),
  (9, 'Ravi', 30000),
  (10, 'Sanjay', 50000);

  SELECT * from Manager M1, Manager M2
  WHERE M2.Name = M1.Name AND M1.Id > M2.Id

  -- Remove Duplicate data only first data will remain
  DELETE M2 FROM Manager M1, Manager M2
  WHERE M2.Name = M1.Name AND M2.Id > M1.Id

  SELECT * FROM Manager

  -- DROP  entire Table
  DROP TABLE Manager


  --Use of auto inrement and ways of inserting query
  CREATE TABLE Employee (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  HireDate DATE NOT NULL
);

INSERT INTO Employee (FirstName, LastName, Gender, Salary, HireDate)
VALUES
  ('Rajveer', 'Singh', 'Male', 30000, '2017-11-05'),
  ('Manveer', 'Singh', 'Male', 50000, '2017-11-05'),
  ('Ashutosh', 'Kumar', 'Male', 40000, '2017-12-12'),
  ('Ankita', 'Sharma', 'Female', 45000, '2017-12-15'),
  ('Vijay', 'Kumar', 'Male', 50000, '2018-01-12'),
  ('Dilip', 'Yadav', 'Male', 25000, '2018-02-26'),
  ('Jayvijay', 'Singh', 'Male', 30000, '2018-02-18'),
  ('Reenu', 'Kumari', 'Female', 40000, '2017-09-19'),
  ('Ankit', 'Verma', 'Male', 25000, '2018-04-04'),
  ('Harpreet', 'Singh', 'Male', 50000, '2017-10-10');

  INSERT INTO Employee values ('Ratnesh', 'Dubey', 'Male', 90000, '2024-11-05')


  SELECT * FROM Employee

  SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNumber
  FROM Employee
) AS RankedEmployees
WHERE RowNumber = 3;

SELECT *
FROM Employee
WHERE Salary IN (
  SELECT DISTINCT TOP  3 Salary
  FROM Employee
  ORDER BY Salary DESC
  )



  SELECT *
FROM Employee
WHERE Salary IN (
  SELECT DISTINCT TOP  3 Salary
  FROM Employee
  ORDER BY Salary DESC
  )

-- get  employees hired betwwen n months
SELECT *, DATEDIFF(MONTH, HireDate, GETDATE()) AS DiffMonth
FROM Employee
WHERE DATEDIFF(MONTH, HireDate, GETDATE()) BETWEEN 70 AND 75
ORDER BY HireDate DESC;

-- get  employees hired betwwen n days
SELECT *, DATEDIFF(DAY, HireDate, GETDATE()) AS DiffMonth
FROM Employee
WHERE DATEDIFF(DAY, HireDate, GETDATE()) BETWEEN 2191 AND 2296
ORDER BY HireDate DESC;




--Get All inbuilt  functions

SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION';

EXEC sp_helptext 'fn_replformatdatetime';

SELECT * FROM sys.all_objects where type in ('FN','AF','FS','FT','IF','TF')
--AF = Aggregate function (CLR)
--C = CHECK constraint
--D = DEFAULT (constraint or stand-alone)
--F = FOREIGN KEY constraint
--PK = PRIMARY KEY constraint
--P = SQL stored procedure
--PC = Assembly (CLR) stored procedure
--FN = SQL scalar-function
--FS = Assembly (CLR) scalar function
--FT = Assembly (CLR) table-valued function
--R = Rule (old-style, stand-alone)
--RF = Replication filter procedure
--SN = Synonym
--SQ = Service queue
--TA = Assembly (CLR) trigger
--TR = SQL trigger 
--IF = SQL inlined table-valued function
--TF = SQL table-valued function
--U = Table (user-defined)
--UQ = UNIQUE constraint
--V = View
--X = Extended stored procedure
--IT = Internal table


