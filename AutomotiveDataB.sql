CREATE DATABASE AutomotiveDB;
use AutomotiveDB;

CREATE TABLE IF NOT EXISTS Cars (
	CarID INT AUTO_INCREMENT PRIMARY KEY,
    CarModel VARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Color ENUM('Red', 'Blue', 'Green', 'Black', 'White') NOT NULL
);

CREATE TABLE IF NOT EXISTS Owners (
	OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    OwnerName VARCHAR(100) NOT NULL,
    OwnerAddress VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Services (
	ServiceID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    ServiceDescription TEXT,
    ServiceCost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Ownerships (
	OwnershipID INT AUTO_INCREMENT PRIMARY KEY,
    CarID INT,
    OwnerID INT,
    PurchaseDate DATE NOT NULL,
    CONSTRAINT carID FOREIGN KEY (CarID) REFERENCES Cars(CarID)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT owner FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CarServices (
	CarID INT,
    ServiceID INT,
	ServiceDate DATE NOT NULL,
    PRIMARY KEY (CarID, ServiceID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) 
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Mechanics (
	MechanicID INT AUTO_INCREMENT PRIMARY KEY,
    MechanicName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    HireDate TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE Garages (
	GarageID INT AUTO_INCREMENT PRIMARY KEY,
    GarageName VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(255) NOT NULL
);


CREATE TABLE CarMechanics (
	CarID INT,
    MechanicID INT,
    ServiceDate DATE NOT NULL,
    PRIMARY KEY (CarID, MechanicID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (MechanicID) REFERENCES Mechanics(MechanicID)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

ALTER TABLE Cars ADD Price DECIMAL(10, 2) NOT NULL;
ALTER TABLE Owners ADD OwnerPhone VARCHAR(20) NOT NULL;
INSERT INTO Cars (CarModel, Year, Price, Color) VALUES
('Toyota Camry', 2020, 25000.00, 'Red'),
('Honda Accord', 2021, 27000.00, 'Blue'),
('Ford Focus', 2019, 22000.00, 'Green');

INSERT INTO Owners (OwnerName, OwnerAddress, OwnerPhone) VALUES
('John Doe', '123 Elm St', '555-1234'),
('Alice Johnson', '456 Oak St', '555-8765');

INSERT INTO Services (ServiceName, ServiceDescription, ServiceCost) VALUES
('Oil Change', 'Change the engine oil', 50.00),
('Tire Rotation', 'Rotate the tires', 30.00);

INSERT INTO Ownerships (CarID, OwnerID, PurchaseDate) VALUES
(1, 1, '2020-05-10'),
(2, 2, '2021-08-15');

INSERT INTO CarServices (CarID, ServiceID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(1, 2, '2021-06-15'),
(2, 1, '2021-02-20');

INSERT INTO Mechanics (MechanicName, PhoneNumber) VALUES
('Mike Smith', '555-6789'),
('Sarah Brown', '555-9876');

INSERT INTO Garages (GarageName, Location) VALUES
('Downtown Garage', '789 Maple St'),
('Uptown Garage', '101 Oak St');

INSERT INTO CarMechanics (CarID, MechanicID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(2, 2, '2021-08-15');


delete from cars where CarID = 1;

UPDATE Cars
SET CarID = 100 WHERE CarID = 2;


delete from Owners WHERE OwnerID = 1;
select * from Ownerships;

delete from services where ServiceID = 1;
select * from CarServices;


UPDATE Services 
SET ServiceID = 101 WHERE ServiceID = 1;
select * from CarServices;







    



    

