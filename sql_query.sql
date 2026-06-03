CREATE DATABASE if not exists ecommerce_analysis ;
USE ecommerce_analysis;

select*from titanic_tbl;
CREATE DATABASE titanic_db;
USE titanic_db;
CREATE TABLE  if not exists titanic_tbl (
    PassengerId INT,
    Survived INT,
    Pclass INT,
    Name VARCHAR(255),
    Sex VARCHAR(20),
    Age FLOAT,
    SibSp INT,
    Parch INT,
    Ticket VARCHAR(100),
    Fare FLOAT,
    Cabin VARCHAR(100),
    Embarked VARCHAR(10)
);
SELECT * FROM  titanic_tbl LIMIT 10;
SELECT COUNT(*) AS Total_Passengers
FROM titanic_tbl;
SELECT Sex, COUNT(*) AS Count
FROM titanic_tbl
GROUP BY Sex;
SELECT COUNT(*) AS Survived_Count
FROM titanic_tbl
WHERE Survived = 1;
SELECT COUNT(*) AS Not_Survived
FROM titanic_tbl
WHERE Survived = 0;
SELECT *
FROM titanic_tbl
WHERE Sex='female'
AND Survived=1;
SELECT *
FROM titanic_tbl
WHERE Pclass=1;
SELECT *
FROM titanic_tbl
WHERE Age > 30;
SELECT Name, Fare
FROM titanic_tbl
ORDER BY Fare DESC;
SELECT Name, Age
FROM titanic_tbl
ORDER BY Age ASC;
SELECT Sex,
       COUNT(*) AS Total,
       SUM(Survived) AS Survivors
FROM titanic_tbl
GROUP BY Sex;
SELECT Pclass,
       COUNT(*) AS Total,
       SUM(Survived) AS Survivors
FROM titanic_tbl
GROUP BY Pclass;
SELECT Pclass,
       AVG(Fare) AS Avg_Fare
FROM titanic_tbl
GROUP BY Pclass;
SELECT AVG(Age) AS Average_Age
FROM titanic_tbl;
SELECT MAX(Fare) AS Highest_Fare
FROM titanic_tbl;
SELECT MIN(Fare) AS Lowest_Fare
FROM titanic_tbl;
SELECT SUM(Fare) AS Total_Fare_Collected
FROM titanic_tbl;
SELECT Name, Fare
FROM titanic_tbl
WHERE Fare >
(
    SELECT AVG(Fare)
    FROM titanic_tbl
);
SELECT Name, Age
FROM titanic_tbl
WHERE Age >
(
    SELECT AVG(Age)
    FROM titanic_tbl
);
SELECT Name, Fare
FROM titanic_tbl
WHERE Fare =
(
    SELECT MAX(Fare)
    FROM titanic_tbl
);
CREATE TABLE class_info (
    Pclass INT,
    Class_Name VARCHAR(50)
);
INSERT INTO class_info VALUES
(1,'First Class'),
(2,'Second Class'),
(3,'Third Class');
SELECT t.Name,
       c.Class_Name,
       t.Fare
FROM titanic_tbl t
INNER JOIN class_info c
ON t.Pclass = c.Pclass;
SELECT t.Name,
       c.Class_Name
FROM titanic_tbl t
LEFT JOIN class_info c
ON t.Pclass = c.Pclass;
SELECT t.Name,
       c.Class_Name
FROM titanic_tbl t
RIGHT JOIN class_info c
ON t.Pclass = c.Pclass;
CREATE VIEW survival_analysis AS
SELECT PassengerId,
       Name,
       Sex,
       Age,
       Pclass,
       Survived
FROM titanic_tbl;
SELECT * FROM survival_analysis;
CREATE VIEW female_survivors AS
SELECT *
FROM titanic_tbl
WHERE Sex='female'
AND Survived=1;
SELECT * FROM female_survivors;
CREATE INDEX idx_survived
ON titanic_tbl(Survived);
CREATE INDEX idx_sex
ON titanic_tbl(Sex);
CREATE INDEX idx_pclass
ON titanic_tbl(Pclass);
SELECT Sex,
       ROUND((SUM(Survived)/COUNT(*))*100,2)
       AS Survival_Rate
FROM titanic_tbl
GROUP BY Sex;
SELECT Pclass,
       ROUND((SUM(Survived)/COUNT(*))*100,2)
       AS Survival_Rate
FROM titanic_tbl
GROUP BY Pclass;
SELECT Name, Fare
FROM titanic_tbl
ORDER BY Fare DESC
LIMIT 10;
SELECT AVG(Age) AS Avg_Age_Survivors
FROM titanic_tbl
WHERE Survived=1;