
-- initializing database

-- 1
CREATE DATABASE PetPals;
USE PetPals;

-- creating tables and defining appropriate primary keys, foreign keys, and constraints

-- 2,3,4
DROP TABLE IF EXISTS Pets;
CREATE TABLE  Pets (
    PetID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100),
    Age INT,
    Breed VARCHAR(100),
    Type VARCHAR(50),
    AvailableForAdoption BIT
);

DROP TABLE IF EXISTS Shelters;
CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);

DROP TABLE IF EXISTS Donations;
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY IDENTITY,
    DonorName VARCHAR(100),
    DonationType VARCHAR(50),
    DonationAmount DECIMAL(10,2),
    DonationItem VARCHAR(100),
    DonationDate DATETIME
);

DROP TABLE IF EXISTS AdoptionEvents;
CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY IDENTITY,
    EventName VARCHAR(100),
    EventDate DATETIME,
    Location VARCHAR(255)
);

DROP TABLE IF EXISTS Participants;
CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY IDENTITY,
    ParticipantName VARCHAR(100),
    ParticipantType VARCHAR(50),
    EventID INT FOREIGN KEY REFERENCES AdoptionEvents(EventID)
);

DROP TABLE IF EXISTS Adoption;
CREATE TABLE Adoption (
    AdoptionID INT PRIMARY KEY IDENTITY,
    PetID INT FOREIGN KEY REFERENCES Pets(PetID),
    AdopterName VARCHAR(100),
    AdoptionDate DATETIME
);


-- inserting values

INSERT INTO Pets VALUES
('Bruno', 3, 'Labrador', 'Dog', 1),
('Milo', 2, 'Beagle', 'Dog', 1),
('Simba', 4, 'Persian', 'Cat', 0),
('Chintu', 1, 'Pomeranian', 'Dog', 1),
('Ginger', 5, 'Siamese', 'Cat', 1);

INSERT INTO Shelters VALUES
('Happy Paws Shelter', 'Mumbai'),
('Compassionate Care Shelter', 'Chennai'),
('Pet Haven', 'Bangalore');

INSERT INTO Donations VALUES
('Amit Sharma', 'Cash', 5000.00, NULL, '2024-03-10'),
('Neha Iyer', 'Item', NULL, 'Dog Food', '2024-03-12'),
('Rajesh Gupta', 'Cash', 3000.00, NULL, '2024-03-15');

INSERT INTO AdoptionEvents VALUES
('Summer Adoption Drive', '2024-04-05', 'Mumbai'),
('Rescue & Rehome Fair', '2024-04-10', 'Bangalore');

INSERT INTO Participants VALUES
('Happy Paws Shelter', 'Shelter', 1),
('Neha Iyer', 'Adopter', 2);

INSERT INTO Adoption (PetID, AdopterName, AdoptionDate) VALUES
(1, 'Rahul Sharma', '2024-03-20'),
(3, 'Priya Verma', '2024-03-22');

-- queries

-- 5
SELECT Name, Age, Breed, Type FROM Pets WHERE AvailableForAdoption = 1;

-- 6
DECLARE @EventID INT = 2;
SELECT p.ParticipantName, p.ParticipantType FROM Participants p
JOIN AdoptionEvents ae ON p.EventID = ae.EventID WHERE p.EventID = @EventID;

-- 7
DROP PROCEDURE IF EXISTS UpdateShelterInfo;
GO
CREATE PROCEDURE UpdateShelterInfo 
@ShelterID INT,
@NewName VARCHAR(100),
@NewLocation VARCHAR(255)
AS
BEGIN
    UPDATE Shelters SET Name = @NewName, Location = @NewLocation WHERE ShelterID = @ShelterID;
END;

EXEC UpdateShelterInfo @ShelterID = 1, @NewName = 'Hopeful Paws Shelter', @NewLocation = 'Delhi';

-- 8
SELECT s.Name, SUM(d.DonationAmount) AS TotalDonation FROM Shelters s
LEFT JOIN Donations d ON s.ShelterID = d.DonationID 
GROUP BY s.Name
HAVING SUM(d.DonationAmount) IS NOT NULL;

-- 9
SELECT Name, Age, Breed, Type FROM Pets WHERE AvailableForAdoption = 1;

-- 10
SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear, SUM(DonationAmount) AS TotalDonation FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');

-- 11
SELECT DISTINCT Breed FROM Pets WHERE Age BETWEEN 1 AND 3 OR Age > 5;

-- 12
SELECT p.Name, s.Name AS ShelterName FROM Pets p
JOIN Shelters s ON p.PetID = s.ShelterID WHERE p.AvailableForAdoption = 1;

-- 13
SELECT COUNT(p.ParticipantID) AS TotalParticipants
FROM Participants p
JOIN AdoptionEvents a ON p.EventID = a.EventID
WHERE a.Location = 'Mumbai';

-- 14
SELECT DISTINCT Breed FROM Pets WHERE Age BETWEEN 1 AND 5;

-- 15
SELECT * FROM Pets WHERE PetID NOT IN (SELECT PetID FROM Adoption);

-- 16
SELECT p.Name AS PetName, a.AdopterName AS AdopterName FROM Pets p
JOIN Adoption a ON p.PetID = a.PetID;

-- 17
SELECT s.Name, COUNT(p.PetID) AS AvailablePets FROM Shelters s
LEFT JOIN Pets p ON s.ShelterID = p.PetID WHERE p.AvailableForAdoption = 1 GROUP BY s.Name;

-- 18
SELECT p1.Name AS Pet1, p2.Name AS Pet2, p1.Breed, s.Name AS ShelterName 
FROM Pets p1
JOIN Pets p2 ON p1.PetID = p2.PetID 
    AND p1.Breed = p2.Breed 
    AND p1.PetID < p2.PetID
JOIN Shelters s ON p1.PetID= s.ShelterID;

-- 19
SELECT s.Name AS ShelterName, a.EventName FROM Shelters s CROSS JOIN AdoptionEvents a;

--20
SELECT TOP 1 s.Name, COUNT(a.PetID) AS AdoptedPetsCount FROM Shelters s
JOIN Adoption a ON s.ShelterID = a.PetID GROUP BY s.Name ORDER BY AdoptedPetsCount DESC;




SELECT * FROM Participants;


