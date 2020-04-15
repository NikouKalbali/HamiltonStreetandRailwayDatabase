SELECT BusID, Age, Manufacturer FROM Bus WHERE AdvertisingRevenue>9000;
-- question 2
SELECT COUNT(DISTINCT SIN) AS Total FROM Person WHERE Occupation='student' OR YEAR(current_date-DateOfBirth)< 25;
-- question 3
Select DISTINCT count(T1.SIN) AS "Number of students" from Passenger T1, Take T2, Bus T3 Where (T1.SIN = T2.SIN) and (T2.BusID = T3.BusID) and (T1.Type='ST') and T2.date=('05-03-2017') and (T3.RouteID = 5);
-- question 4
SELECT RouteID, SUM(AdvertisingRevenue) AS "Total Revenue" FROM Bus GROUP BY RouteID ORDER BY "Total Revenue" DESC;
-- question 5)a)
SELECT I.SIN AS "DriverID", Person.FirstName, Person.LastName FROM Infraction I INNER JOIN Person ON I.SIN=Person.SIN GROUP BY I.SIN, LastName, FirstName HAVING COUNT(I.SIN)<3;
-- question 5 b)
SELECT SIN, sum(Demerit) AS "total demerit", sum(Fine) AS "total fines" FROM Infraction GROUP BY SIN HAVING sum(Demerit)>2 ORDER BY "total fines" DESC;
-- question 6. 
SELECT Manufacturer, min(BusID) FROM Bus GROUP BY Manufacturer HAVING count(Manufacturer)<2;
-- question 7.a) 
SELECT T1.Type, sum(T2.Fee) AS "Total Fare Revenue" FROM Passenger T1, Fare T2 WHERE (T1.Type=T2.Type) GROUP BY T1.Type HAVING sum(T2.Fee)>0;
-- question 7.b) 
SELECT T1.Type, sum(T2.Fee) AS "Total Fare Revenue" FROM Passenger T1, Fare T2 WHERE (T1.Type=T2.Type) GROUP BY T1.Type HAVING sum(T2.Fee)>500;
-- question 7.c)
SELECT T1.Type AS "Most Profitable" FROM Take, Passenger T1, Fare T2 WHERE Date='05-01-2017' and (T1.Type=T2.Type) GROUP BY T1.Type HAVING sum(T2.Fee)>0 ORDER BY sum(T2.Fee) DESC fetch first rows only; 
-- question 8.a)
SELECT T2.RouteID AS "Route ID", count(T1.Time) AS "number of Passenger Trips" From Take T1, Schedule T2 Where T1.Date='05-07-2017' and (T1.time = T2.ArrivalTime) GROUP BY T2.RouteID, T1.Time ORDER BY count(T2.RouteID) DESC fetch first rows only;
-- question 8.b)
SELECT T1.Date AS "Date", count(T1.Time) AS "number of Trips Taken" From Take T1, Schedule T2 Where (T1.time = T2.ArrivalTime) GROUP BY T2.RouteID, T1.Date ORDER BY count(T2.RouteID) DESC fetch first rows only;
-- question 9.
SELECT DISTINCT T1.Occupation FROM Person T1, Take T2, Bus T3, Go T4, Sites T5 WHERE T1.SIN=T2.SIN AND T2.BusID=T3.BusID AND T3.RouteID=T4.RouteID AND T5.SIName=T4.SIName AND T5.Category='Library' AND (T2.Date='05/05/2017' OR T2.Date='05/06/2017');
-- question 10.
SELECT T1.SIN, T3.FirstName, T3.LastName FROM Driver T1, Infraction T2, Person T3 WHERE (T1.SIN=T2.SIN) and (T1.SIN=T3.SIN) and (T1.YearsOfService>5) and (T1.Salary>80000) Group By T1.SIN, T3.LastName, T3.FirstName HAVING sum(T2.Demerit)<10;
-- question 11.
SELECT DISTINCT T1.FirstName, T1.LastName, T1.Sex FROM Person T1, Take T2, Event T3, Go T4, Bus T5 WHERE (T1.Occupation='student') OR (YEAR(current_date-T1.DateOfBirth)< 25) AND T1.SIN=T2.SIN AND T4.RouteID=4 AND T2.BusID=T5.BusID AND T3.SIName=T4.SIName AND T4.RouteID=T5.RouteID AND T3.EName='Marauders Tennis';
-- question 12.
SELECT Distinct Sc.RouteID AS "Route ID", S.SName, Sc.ArrivalTIme FROM Schedule Sc, Stop S, Go G, Event E WHERE (Sc.Date='5/1/2017') and (Sc.StopID=S.StopID) and (Sc.ArrivalTime BETWEEN '16:20:00' and '16:50:00') AND S.SIName=E.SIName and Sc.RouteID=G.RouteID AND E.Ename='Marauders Basketball' AND E.Time='17:00:00';