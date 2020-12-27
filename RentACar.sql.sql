CREATE DATABASE RentACar

--

USE RentACar

--

CREATE TABLE Employees(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Oib nvarchar(11) NOT NULL
);

CREATE TABLE Vehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Brand nvarchar(50) NOT NULL,
	Model nvarchar(50) NOT NULL,
	Registration nvarchar(15) NOT NULL,
	Color nvarchar(30) NOT NULL,
	VehicleType nvarchar(50) NOT NULL,
	Mileage int NOT NULL,
	RegisteredOn datetime2 NOT NULL,
	RegistrationExpires datetime2 NOT NULL,
	WinterPrice int NOT NULL,
	SummerPrice int NOT NULL
);

CREATE TABLE Rents(
	Id int IDENTITY(1,1) PRIMARY KEY,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id),
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id),
	RentStart datetime2 NOT NULL,
	RentDuration float NOT NULL CHECK (RentDuration >= 1),
	CustomerFirstName nvarchar(50) NOT NULL,
	CustomerLastName nvarchar(50) NOT NULL,
	CustomerOib nvarchar(11) NOT NULL,
	CustomerBirthDate datetime2,
	CustomerLicenceNumber nvarchar(20) NOT NULL,
	CustomerCreditCard nvarchar(20) NOT NULL
);

--

INSERT INTO Employees(FirstName, LastName, Oib) VALUES
('George', 'Clooney', '8475406249'),
('Ben', 'Stiller', '28477165594'),
('Clint', 'Eastwood', '66471554841'),
('Sophie', 'Turner', '15477996438'),
('Billie', 'Eilish', '64479921515'),
('Matthew', 'McConaughey', '27484416335');

INSERT INTO Vehicles(Brand, Model, Registration, Color, VehicleType, Mileage, RegisteredOn, RegistrationExpires, WinterPrice, SummerPrice) VALUES
('Škoda', 'Octavia', 'ST-156-NL', 'Blue', 'Hatchback', 15002, '2020-5-2', '2021-5-1', 120, 180),
('Škoda', 'Superb', 'ST-554-PO', 'Red', 'Hatchback', 16847, '2019-4-4', '2020-3-4', 120, 180),
('Škoda', 'Fabia', 'ST-1001-II', 'Orange', 'Hatchback', 5421, '2018-12-2', '2019-12-2', 120, 180),
('Kia', 'Seltos', 'ZG-1475-OK', 'Red', 'SUV', 125, '2020-7-25', '2021-8-20', 150, 220),
('Audi', 'SQ5', 'ZG-1054-FF', 'Black', 'SUV', 1245, '2019-8-22', '2020-8-25', 150, 220),
('Audi', 'SQ8', 'ST-456-BA', 'Blue', 'SUV', 2255, '2020-12-12', '2021-12-28', 150, 220),
('Alfa Romeo', 'Stelvio', 'ST-884-UR', 'Black', 'SUV', 9887, '2020-5-2', '2020-5-20', 150, 220),
('BMW', 'M2', 'DA-887-IJ', 'Grey', 'Coupe', 13000, '2019-4-21', '2021-1-4', 200, 280),
('Toyota', 'Supra', 'RI-122-KK', 'White', 'Coupe', 4848, '2019-4-21', '2020-5-4', 200, 280),
('Chevrolet', 'Camaro', 'ST-1224-VO', 'White', 'Coupe', 654, '2020-9-14', '2021-10-4', 200, 280),
('Mercedes', 'AMG C43', 'ST-984-FU', 'White', 'Coupe', 15488, '2019-10-25', '2021-1-4', 200, 280),
('Toyota', 'Siena', 'ST-228-LK', 'Yellow', 'Minivan', 12478, '2019-5-25', '2020-5-30', 220, 310),
('Honda', 'Odyssey', 'ST-1047-PK', 'Red', 'Minivan', 9885, '2020-5-25', '2021-5-30', 220, 310),
('Nissan', 'Quest', 'ST-300-BU', 'Grey', 'Minivan', 9992, '2020-5-10', '2021-4-30', 220, 310),
('Ford', 'Transit', 'ST-114-OL', 'Blue', 'Van', 11874, '2020-5-2', '2021-9-1', 250, 350),
('Kia', 'Sedona', 'ST-774-HG', 'Grey', 'Van', 10544, '2019-10-2', '2020-11-5', 250, 350),
('Mercedes', 'EQV', 'ST-1009-ST', 'Black', 'Van', 6005, '2019-12-12', '2021-1-12', 250, 350),
('Honda', 'SH350i', 'ST-264-UU', 'Purple', 'Scooter', 1200, '2020-11-30', '2021-11-1', 100, 140),
('Vespa', 'GTS300', 'ZG-3000-AS', 'Red', 'Scooter', 25, '2020-12-20', '2021-12-1', 100, 140),
('Suzuki', 'Address 110', 'ST-995-BD', 'Blue', 'Scooter', 11002, '2019-11-30', '2020-11-1', 100, 140);

INSERT INTO Rents (VehicleId, EmployeeId, CustomerFirstName, CustomerLastName, CustomerOib, CustomerBirthDate, CustomerLicenceNumber, CustomerCreditCard, RentStart, RentDuration) VALUES
(12, 2, 'Donald', 'Trump', '54114795664', '1967-8-4', '25587464', '9985477254965475', '2018-2-2 17:00', 2.5),
(14, 2, 'Joe', 'Biden', '65477411214', '1950-1-10','11448852', '3695885471121995', '2018-9-25 15:00', 5.5),
(5, 3, 'Robert', 'De Niro', '22847752124', '1957-12-15', '36652564', '2844852933157615', '2018-12-12 12:30', 3),
(17, 1, 'Ed', 'Sheeren', '57885965251', '1993-10-1', '22578841', '7698558741197698', '2018-12-24 17:30', 2),
(1, 1, 'Edo', 'Majka', '63352884751', '1975-2-25', '12247855', '3222248777569911', '2018-12-30 21:00', 8),
(11, 4, 'Oscar', 'Schindler', '26558744126', '1966-11-5', '55214987', '6999589422515475', '2019-1-2 19:00', 9.5),
(18, 4, 'Walter', 'White', '11485563298', '1968-4-22', '22050047', '2001451059749660', '2019-3-21 10:30', 3.5),
(20, 2, 'Ivan', 'Rakitić', '54966321548', '1985-11-2', '25500147', '3655201449854102', '2019-3-27 21:00', 4),
(2, 5, 'Queen', 'Elizabeth', '62554785410', '1865-8-10', '20015478', '2588541902336584', '2019-5-8 18:30', 2),
(3, 3, 'Tina', 'Turner', '81587056810', '1946-2-3', '22547812', '9584521455009262', '2019-6-24 12:00', 7),
(12, 2, 'Freddy', 'Mercury', '54116795664', '1967-9-4', '20587464', '9985477294165475', '2019-7-2 17:00', 2.5),
(15, 2, 'Angelina', 'Jolie', '65476411214', '1950-4-10','10448852', '3695885491121495', '2019-9-25 15:00', 5.5),
(4, 3, 'Vladimir', 'Putin', '22847652124', '1957-11-15', '16652564', '2844852933157615', '2019-12-12 12:30', 3),
(6, 1, 'Mark', 'Twain', '57885965261', '1993-10-5', '22578041', '7698558741149698', '2019-12-24 17:30', 2),
(3, 1, 'Edo', 'Otac', '63352884756', '1975-2-26', '12247850', '3222248777569591', '2019-12-30 21:00', 8),
(10, 4, 'Bon', 'Jovi', '26558744166', '1966-10-5', '55214907', '6999587422515975', '2020-11-2 19:00', 9.5),
(19, 4, 'Robert', 'Downey', '11486563298', '1958-4-22', '20050047', '2001451098749660', '2020-11-21 10:30', 3.5),
(8, 2, 'Miley', 'Cyrus', '54966326548', '1985-1-2', '25500047', '3655201447859102', '2020-12-17 21:00', 4),
(17, 5, 'Leonardo', 'di Caprio', '72554785410', '1965-8-10', '10015478', '2589541102336584', '2020-12-26 18:30', 2),
(16, 3, 'Leo', 'Messi', '81587056860', '1946-2-18', '22547810', '9584521455009262', '2020-12-26 12:00', 7);

INSERT INTO Rents (VehicleId, EmployeeId, CustomerFirstName, CustomerLastName, CustomerOib, CustomerBirthDate, CustomerLicenceNumber, CustomerCreditCard, RentStart, RentDuration) VALUES
(14, 2, 'Brad', 'Pitt', '65475511214', '1958-4-10','10455852', '3695555491121495', '2019-9-29 15:00', 5);

--

SELECT * FROM Vehicles
WHERE RegistrationExpires < GETDATE();


SELECT * FROM Vehicles 
WHERE RegistrationExpires BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE());


SELECT Vehicles.VehicleType, COUNT(*) as NumberOfVehicles from Vehicles
GROUP BY Vehicles.VehicleType;


SELECT TOP 5 e.FirstName, e.LastName, v.Brand, v.Model, V.Registration, v.Color, r.RentStart, r.RentDuration FROM Employees e
JOIN Rents r ON r.EmployeeId = e.Id
JOIN Vehicles v ON v.Id = r.VehicleId
WHERE EmployeeId = 2 
ORDER BY RentStart DESC;


SELECT r.CustomerFirstName, r.CustomerLastName, r.CustomerCreditCard, r.RentStart, r.RentDuration, v.Brand, v.Model, v.Registration, 
CASE
	WHEN DATEPART(dayofyear, RentStart) < 61 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) < 61 OR
	DATEPART(dayofyear, RentStart) > 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) > 275 OR
	DATEPART(dayofyear, RentStart) > 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) < 61
	THEN RentDuration * WinterPrice

	WHEN DATEPART(dayofyear, RentStart) BETWEEN 61 AND 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) BETWEEN 61 AND 275 
	THEN RentDuration * SummerPrice

	WHEN DATEPART(dayofyear, RentStart) < 61 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) BETWEEN 61 AND 275
	THEN DATEDIFF(dd, RentStart, CAST(YEAR(RentStart) AS NVARCHAR) + '-03-01') * WinterPrice +
	DATEDIFF(dd, CAST(YEAR(RentStart) AS NVARCHAR) + '-03-01', DATEADD(dd, RentDuration, RentStart)) * SummerPrice

	WHEN DATEPART(dayofyear, RentStart) BETWEEN 61 AND 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) > 275
	THEN DATEDIFF(dd, RentStart, CAST(YEAR(RentStart) AS NVARCHAR) + '-10-02') * SummerPrice +
	DATEDIFF(dd, CAST(YEAR(RentStart) AS NVARCHAR) + '-10-02', DATEADD(dd, RentDuration, RentStart)) * WinterPrice
END AS Price
FROM Rents r
JOIN Vehicles v ON v.Id = r.VehicleId
JOIN Employees e ON e.Id = r.EmployeeId
WHERE r.CustomerOib = '65475511214' AND r.VehicleId = 14 AND r.EmployeeId = 2;


SELECT DISTINCT(CustomerOib), CustomerFirstName, CustomerLastName, CustomerBirthDate, CustomerLicenceNumber FROM Rents;


SELECT MIN(e.FirstName) AS FirstName, MIN(e.LastName) AS LastName, MAX(r.RentStart) AS LastRent FROM Rents r
JOIN Employees e ON e.Id = r.EmployeeId
GROUP BY r.EmployeeId;


SELECT Vehicles.Brand, COUNT(*) AS NumberOfVehicles FROM Vehicles
GROUP BY Vehicles.Brand
ORDER BY NumberOfVehicles DESC;


SELECT r.VehicleId, r.EmployeeId, r.CustomerFirstName, r.CustomerLastName, r.CustomerOib, r.CustomerBirthDate, r.CustomerLicenceNumber, r.CustomerCreditCard, r.RentStart, r.RentDuration, 
CASE
	WHEN DATEPART(dayofyear, RentStart) < 61 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) < 61 OR
	DATEPART(dayofyear, RentStart) > 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) > 275 OR
	DATEPART(dayofyear, RentStart) > 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) < 61
	THEN RentDuration * WinterPrice

	WHEN DATEPART(dayofyear, RentStart) BETWEEN 61 AND 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) BETWEEN 61 AND 275 
	THEN RentDuration * SummerPrice

	WHEN DATEPART(dayofyear, RentStart) < 61 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) BETWEEN 61 AND 275
	THEN DATEDIFF(dd, RentStart, CAST(YEAR(RentStart) AS NVARCHAR) + '-03-01') * WinterPrice +
	DATEDIFF(dd, CAST(YEAR(RentStart) AS NVARCHAR) + '-03-01', DATEADD(dd, RentDuration, RentStart)) * SummerPrice

	WHEN DATEPART(dayofyear, RentStart) BETWEEN 61 AND 275 AND DATEPART(dayofyear, DATEADD(dd, RentDuration, RentStart)) > 275
	THEN DATEDIFF(dd, RentStart, CAST(YEAR(RentStart) AS NVARCHAR) + '-10-02') * SummerPrice +
	DATEDIFF(dd, CAST(YEAR(RentStart) AS NVARCHAR) + '-10-02', DATEADD(dd, RentDuration, RentStart)) * WinterPrice
END AS Price
INTO FinishedRents FROM Rents r
JOIN Vehicles v ON v.Id = r.VehicleId
WHERE DATEADD(dd, RentDuration, RentStart) < GETDATE();

SELECT * FROM FinishedRents;


SELECT DISTINCT(DATENAME(month, Rents.RentStart)) AS Month, COUNT(*) NumberOfRents FROM Rents
WHERE YEAR(Rents.RentStart) = 2020
GROUP BY DATENAME(month,Rents.RentStart);


SELECT *,
CASE
	WHEN RegistrationExpires BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE()) OR RegistrationExpires < GETDATE()
	THEN 'Treba registraciju'
	ELSE 'Ne treba registraciju'
END AS DoesNeedRegistration
FROM Vehicles WHERE VehicleType = 'Coupe';


SELECT v.VehicleType, COUNT(*) LongerThenAvarageRents FROM Rents r
JOIN Vehicles v ON v.Id = r.VehicleId
WHERE RentDuration > (SELECT AVG(CAST(RentDuration AS float)) FROM Rents)
GROUP BY v.VehicleType;
