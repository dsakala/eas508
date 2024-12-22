
-- Create Regions Table
CREATE TABLE Regions (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(255) UNIQUE NOT NULL
);

-- Create Years Table
CREATE TABLE Years (
    YearID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT UNIQUE NOT NULL
);

-- Create AlcoholTypes Table
CREATE TABLE AlcoholTypes (
    AlcoholTypeID INT AUTO_INCREMENT PRIMARY KEY,
    AlcoholType VARCHAR(255) UNIQUE NOT NULL
);

-- Create Consumption Table
CREATE TABLE Consumption (
    ConsumptionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionID INT NOT NULL,
    YearID INT NOT NULL,
    AlcoholTypeID INT NOT NULL,
    TotalConsumption DECIMAL(10, 2),
    PerCapitaConsumption DECIMAL(10, 2),
    PureAlcoholPerCapita DECIMAL(10, 2),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    FOREIGN KEY (YearID) REFERENCES Years(YearID),
    FOREIGN KEY (AlcoholTypeID) REFERENCES AlcoholTypes(AlcoholTypeID)
);

-- Sample Insert Statements for Regions
INSERT INTO Regions (RegionName) VALUES
('Belgorod Oblast'),
('Bryansk Oblast'),
('Vladimir Oblast');

-- Sample Insert Statements for Years
INSERT INTO Years (Year) VALUES
(2017),
(2018),
(2019);

-- Sample Insert Statements for AlcoholTypes
INSERT INTO AlcoholTypes (AlcoholType) VALUES
('Wine'),
('Beer'),
('Spirits');

-- Sample Insert Statements for Consumption
INSERT INTO Consumption (RegionID, YearID, AlcoholTypeID, TotalConsumption, PerCapitaConsumption, PureAlcoholPerCapita) VALUES
(1, 1, 1, 278.27, 1.79, 0.20),
(2, 1, 1, 368.22, 3.02, 0.33),
(3, 1, 1, 518.43, 3.70, 0.41);
