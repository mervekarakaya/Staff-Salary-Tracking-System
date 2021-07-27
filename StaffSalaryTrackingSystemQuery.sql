
--Insert Query

INSERT INTO tbl_staff(Name, Surname, Phone, Email, TC_No, Department_ID, Password, Responsibility)
values('Eklenir', 'Eklenmez', 5216338978, 'eklenir.eklenmez@gmail.com', 1163287705, 1008, 'xyztu5689', 'Driver') 

INSERT INTO tbl_staff(Name, Surname, Phone, Email, TC_No, Department_ID, Password, Responsibility)
values('Zeynep', 'Bulut', 5338567245, 'zeynep.bulut@gmail.com', 2267996606, 1005, 'zb123', 'International Relations') 

--Select Query

SELECT Department_ID FROM tbl_department 
WHERE Department='AR-GE'

SELECT Department_ID AS [BOLUM KODU] FROM tbl_department 
WHERE Department='AR-GE'

SELECT * FROM tbl_salary 
WHERE Salary > 4000

SELECT * FROM tbl_salary 
WHERE NOT Salary > 4000 

-- Update Query

UPDATE tbl_salary 
SET Salary=Salary*1.2 WHERE Salary = 3000

-- Delete Query

DELETE FROM tbl_department WHERE Department_ID=1008

-- Join Query

SELECT tbl_staff.Name, tbl_staff.Surname, tbl_staff.Responsibility, tbl_department.Department
FROM tbl_staff JOIN tbl_department ON tbl_staff.Department_ID = tbl_department.Department_ID 

SELECT tbl_staff.Name, tbl_staff.Surname, tbl_staff.Responsibility, tbl_salary.Salary
FROM tbl_staff RIGHT JOIN tbl_salary ON tbl_staff.Staff_ID = tbl_salary.Staff_ID 

-- Like Clause Query

SELECT * FROM tbl_department 
WHERE Department LIKE '%[eE]'

-- Distinct Option Query

SELECT DISTINCT Salary FROM tbl_salary

-- Order By Query

SELECT * FROM tbl_salary 
ORDER BY Salary DESC, Date DESC

-- Count Query

SELECT COUNT (DISTINCT Salary) AS [NUMBER OF DIFFERENT SALARY QUANTITY]
FROM tbl_salary

-- Sum Query

SELECT SUM (Salary) AS [SUMMATION OF SALARY] 
FROM tbl_salary

-- Group By Query

SELECT Responsibility, COUNT (Responsibility) AS [NUMBER] FROM tbl_staff
GROUP BY Responsibility

-- Create View

CREATE VIEW tbl_AdminEmployee (Name, Surname) AS
SELECT Name, Surname
FROM tbl_staff
WHERE Responsibility='Industrial Engineer'

