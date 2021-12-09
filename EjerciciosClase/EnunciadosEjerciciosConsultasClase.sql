-- EJERCICIOS CON ADVENTUREWORKS
use AdventureWorks2019



--1.-Nombre empleados

SELECT p.FirstName, p.LastName
FROM Person.Person p
INNER JOIN HumanResources.Employee ON (p.BusinessEntityID = Employee.BusinessEntityID



--2.-Clientes que sean empleados

SELECT p.FirstName, p.LastName
FROM Person.Person p
INNER JOIN HumanResources.Employee ON (p.BusinessEntityID = Employee.BusinessEntityID)
INNER JOIN Sales.Customer sc ON (sc.CustomerID = p.BusinessEntityID)

--3.-Empleados de california

--4.-Pedido más caro

--5.-Clientes que el nombre empiece por c

--6.-Total ventas 2011

--7.-Total importe ventas 2011

--8.-Importe de todas las ventas de cada año
