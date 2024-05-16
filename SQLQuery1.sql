create table Brands(
Id int primary key identity,
[Name] nvarchar(50) unique,
)
create table Models(
Id int primary key identity,
[Name] nvarchar(50) unique,
BrandId int foreign key references Brands(Id)
)
create table BodyStyles(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Years(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table EngineSizes(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table WheelDrives(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Owners(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Colors(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Transmissions(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Markets(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Seats(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Fuels(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Cities(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Features(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Currencies(
Id int primary key identity,
[Name] nvarchar(50) unique
)
create table Adverts(
Id int primary key identity,
[Name] nvarchar(40) not null,
Email nvarchar(50) not null,
PhoneNumber nvarchar(50) not null,
City int foreign key references Cities(Id),
Brand int foreign key references Brands(Id),
Model int foreign key references Models(Id),
Color int foreign key references Colors(Id),
EngineSize int foreign key references EngineSizes(Id),
Seat int foreign key references Seats(Id),
[Owner] int foreign key references Owners(Id),
Transmission int foreign key references Transmissions(Id),
WheelDrive int foreign key references WheelDrives(Id),
[Year] int foreign key references Years(Id),
BodyStyle int foreign key references BodyStyles(Id),
Market int foreign key references Markets(Id),
Fuel int foreign key references Fuels(Id),
Currency int foreign key references Currencies(Id),
Price decimal(10,2) not null,
Mileage decimal(10,2) not null,
Kilometer bit default 1,
IsHit bit default 0,
IsColored bit default 0,
IsWrecked bit default 0,
EnginePower decimal(10,2) not null,
VIN_Number int,
ExtraInfo nvarchar(150),
)
create table AdvertsFeatures(
Id int primary key identity,
AdvertId int foreign key references Adverts(Id),
FeatureId int foreign key references Features(Id),
)
create table Images(
Id int primary key identity,
[Source] nvarchar(150) unique not null,
AdId int foreign key references Adverts(Id)
)
INSERT INTO Brands ([Name]) VALUES ('Toyota');
INSERT INTO Brands ([Name]) VALUES ('Honda');
INSERT INTO Brands ([Name]) VALUES ('Ford');
INSERT INTO Brands ([Name]) VALUES ('Chevrolet');
INSERT INTO Brands ([Name]) VALUES ('BMW');
INSERT INTO Brands ([Name]) VALUES ('Mercedes-Benz');

INSERT INTO Models ([Name], BrandId) VALUES ('Camry', 1);
INSERT INTO Models ([Name], BrandId) VALUES ('Civic', 2);
INSERT INTO Models ([Name], BrandId) VALUES ('F-150', 3);
INSERT INTO Models ([Name], BrandId) VALUES ('Silverado', 4);
INSERT INTO Models ([Name], BrandId) VALUES ('3 Series', 5);
INSERT INTO Models ([Name], BrandId) VALUES ('E-Class', 6);

INSERT INTO BodyStyles ([Name]) VALUES ('Sedan');
INSERT INTO BodyStyles ([Name]) VALUES ('SUV');
INSERT INTO BodyStyles ([Name]) VALUES ('Truck');

INSERT INTO Years ([Name]) VALUES ('2022');
INSERT INTO Years ([Name]) VALUES ('2021');
INSERT INTO Years ([Name]) VALUES ('2020');

INSERT INTO EngineSizes ([Name]) VALUES ('2.0L');
INSERT INTO EngineSizes ([Name]) VALUES ('3.5L');
INSERT INTO EngineSizes ([Name]) VALUES ('5.0L');

INSERT INTO WheelDrives ([Name]) VALUES ('Front-Wheel Drive');
INSERT INTO WheelDrives ([Name]) VALUES ('Rear-Wheel Drive');
INSERT INTO WheelDrives ([Name]) VALUES ('All-Wheel Drive');

INSERT INTO Owners ([Name]) VALUES ('1');
INSERT INTO Owners ([Name]) VALUES ('2');
INSERT INTO Owners ([Name]) VALUES ('3');

INSERT INTO Colors ([Name]) VALUES ('Red');
INSERT INTO Colors ([Name]) VALUES ('Blue');
INSERT INTO Colors ([Name]) VALUES ('Black');

INSERT INTO Transmissions ([Name]) VALUES ('Automatic');
INSERT INTO Transmissions ([Name]) VALUES ('Manual');

INSERT INTO Markets ([Name]) VALUES ('Local');
INSERT INTO Markets ([Name]) VALUES ('International');

INSERT INTO Seats ([Name]) VALUES ('5');
INSERT INTO Seats ([Name]) VALUES ('7');

INSERT INTO Fuels ([Name]) VALUES ('Gasoline');
INSERT INTO Fuels ([Name]) VALUES ('Diesel');

INSERT INTO Cities ([Name]) VALUES ('New York');
INSERT INTO Cities ([Name]) VALUES ('Los Angeles');
INSERT INTO Cities ([Name]) VALUES ('Chicago');

INSERT INTO Features ([Name]) VALUES ('Navigation System');
INSERT INTO Features ([Name]) VALUES ('Leather Seats');
INSERT INTO Features ([Name]) VALUES ('Sunroof');

INSERT INTO Currencies ([Name]) VALUES ('USD');
INSERT INTO Currencies ([Name]) VALUES ('EUR');
INSERT INTO Currencies ([Name]) VALUES ('GBP');
SELECT Adverts.*, Images.Source AS ImageSource
FROM Adverts
INNER JOIN Images ON Images.AdId = Adverts.Id;
