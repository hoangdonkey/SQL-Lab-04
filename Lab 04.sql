USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Lab04')
	DROP DATABASE Lab04
GO

CREATE DATABASE Lab04
GO

USE Lab04
GO

CREATE TABLE Students
(	StudentID INT,
	StudentName VARCHAR(50),
	Age INT,
	PhoneNumber BIGINT UNIQUE,
	CONSTRAINT pk_student PRIMARY KEY (StudentID))
GO

CREATE TABLE Class
(	ClassID INT,
	ClassName VARCHAR(20),
	CONSTRAINT pk_class PRIMARY KEY (ClassID))
GO

CREATE TABLE StudentsClass
(	Number INT IDENTITY,
	StudentID INT,
	StudentName VARCHAR(50),
	ClassID INT,
	ClassName VARCHAR(20),
	CONSTRAINT fk_studentid FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT fk_classid FOREIGN KEY (ClassID) REFERENCES Class(ClassID))
GO

INSERT INTO Class VALUES (1,'Morning')
INSERT INTO Class VALUES (2,'Evening')
INSERT INTO Class VALUES (3,'Night')
INSERT INTO Class VALUES (4,'Saturday')
INSERT INTO Class VALUES (5,'Sunday')
GO

INSERT INTO Students VALUES (1,'A',18,9124654)
INSERT INTO Students VALUES (2,'B',18,9943835)
INSERT INTO Students VALUES (3,'C',18,8285743)
INSERT INTO Students VALUES (4,'D',18,9762534)
INSERT INTO Students VALUES (5,'E',18,9095756)
GO

INSERT INTO StudentsClass VALUES (1,'A',1,'Morning')
INSERT INTO StudentsClass VALUES (2,'B',2,'Evening')
INSERT INTO StudentsClass VALUES (3,'C',3,'Night')
INSERT INTO StudentsClass VALUES (4,'D',4,'Saturday')
INSERT INTO StudentsClass VALUES (5,'E',5,'SunDay')
GO

UPDATE StudentsClass SET ClassID = '2' WHERE StudentID = '1'
UPDATE StudentsClass SET ClassName = 'Evening' WHERE StudentID = '1'
UPDATE StudentsClass SET ClassID = '3' WHERE StudentName = 'E'
UPDATE StudentsClass SET ClassName = 'Night' WHERE StudentName = 'E'
UPDATE Students SET Age = '22' WHERE StudentID = '1' 
GO


DELETE FROM StudentsClass WHERE StudentID = '1'
DELETE FROM Students WHERE StudentID = '1'
DELETE FROM Class WHERE ClassName = 'Sunday'
DELETE FROM StudentsClass WHERE ClassName = 'Saturday'
DELETE FROM Class WHERE ClassID = '4'
GO

SELECT * FROM Students
SELECT * FROM Class
SELECT * FROM StudentsClass
GO