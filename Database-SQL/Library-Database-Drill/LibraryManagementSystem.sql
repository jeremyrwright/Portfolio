USE master
GO

--run only if Library is present
IF EXISTS (SELECT * FROM sysdatabases WHERE [name] = 'Library')
DROP DATABASE Library
GO

CREATE DATABASE Library
GO

USE Library
GO

CREATE TABLE Publisher
(
Name varchar(40) Primary Key,
Address varchar(50) NOT NULL,
Phone varchar(18)
)
GO

INSERT INTO Publisher
VALUES ('Time To Retire Publishing','1220 Manning Way','888-354-2989'),
('Tofu Publishing Inc','4219 NW Vegetarian Way','555-256-7921'),
('Woodland Creature Publishers','8718 Woodside Court','234-567-8901'),
('Skate Or Die Publishing','5560 NE Trasher Road','425-675-8790'),
('House of Waffles Publishers','1217 SW Waffle St','768-546-3214'),
('Fourth Meal Publishing House','3422 Burrito Supreme Ct.','234-678-4566'),
('Middle School Publishers','9011 St. Patricia','212-332-4544'),
('Aye Aye Aye Publishing','1208 Dos Encinas','800-788-6578'),
('Days Of Summer Publishers','443 SE Dogginit Rd.','503-585-9476'),
('Golden Guy Publishers','3291 Bluff Ave','971-234-5555'),
('Cheese Filled Dream Publishing','2290 Enchilada Rd','456-334-5511'),
('Trump Publishing','99011 Outrageous St','346-888-7877'),
('Tower Flyby Publishers','7734 Danger Zone Highway','777-777-7777'),
('The Cooler Publishing','3489 Double Duece Ln.','785-345-5666'),
('Making This Stuff Up Publishers','882 SW First Ave','112-332-7879'),
('Got Nothing Publishers','7609 Ricardo Drive','536-444-6576'),
('Phoning It In Publishers','9201 Paso Del Rio Way','888-723-4544'),
('Dudes Got Talent Publishing','6857 Mozart St','888-678-5647'),
('Rock And Roll Publishers','8756 Built This City Road','232-232-3323'),
('Phone Home Publishing','Area 69 Way','999-999-9999'),
('Dude Looks Like A Lady Publishing','6969 Tyler Alley','875-444-3453'),
('Junior Software Developer Publishers','7848 Yes Way Ted','777-897-4309')
GO

CREATE TABLE Book
(
BookID int PRIMARY KEY,
Title varchar(40) NOT NULL,
PublisherName varchar (40) REFERENCES Publisher(Name)
)
GO

INSERT INTO Book
VALUES (1,'White Fang','Time To Retire Publishing'),
(2,'Christine','Tofu Publishing Inc'),
(3,'Great Expectations','Woodland Creature Publishers'),
(4,'Romeo and Juliet','Skate Or Die Publishing'),
(5,'Pride and Prejudice','House of Waffles Publishers'),
(6,'War and Peace','Fourth Meal Publishing House'),
(7,'For Whom the Bell Tolls','Middle School Publishers'),
(8,'The Telltale Heart','Aye Aye Aye Publishing'),
(9,'Adventures of Huckleberry Finn','Days Of Summer Publishers'),
(10,'Ulysses','Golden Guy Publishers'),
(11,'To the Lighthouse','Cheese Filled Dream Publishing'),
(12,'1984','Trump Publishing'),
(13,'The Golden Bowl','Tower Flyby Publishers'),
(14,'Days of Reading','The Cooler Publishing'),
(15,'The Mediocre Gatsby','Making This Stuff Up Publishers'),
(16,'Animal Farm','Got Nothing Publishers'),
(17,'The Hobbit','Phoning It In Publishers'),
(18,'The Castle','Dudes Got Talent Publishing'),
(19,'DIY City Building','Rock And Roll Publishers'),
(20,'De Profundis','Phone Home Publishing'),
(21,'And Then There Were None','Dude Looks Like A Lady Publishing'),
(22,'The Lost Tribe','Junior Software Developer Publishers')
GO

CREATE TABLE Book_Authors
(
BookID int REFERENCES Book(BookID),
AuthorName varchar(30) NOT NULL PRIMARY KEY,
)
GO

INSERT INTO Book_Authors
VALUES (1,'Jack London'),
(2,'Stephen King'),
(3,'Charles Dickens'),
(4,'William Shakespeare'),
(5,'Jane Austen'),
(6,'Leo Tolstoy'),
(7,'Ernest Hemingway'),
(8,'Edgar Allan Poe'),
(9,'Mark Twain'),
(10,'James Joyce'),
(11,'Virginia Woolf'),
(12,'Geaorge Orwell'),
(13,'Henry James'),
(14,'Marcel Proust'),
(15,'F. Scott Fitzgerald'),
(16,'George Orwell'),
(17,'J.R.R. Tolkien'),
(18,'Franz Kafka'),
(19,'Miquel de Cervantes'),
(20,'Oscar Wilde'),
(21,'Agatha Christie'),
(22,'Jeremy Wright')
GO

CREATE TABLE Library_Branch
(
BranchID int PRIMARY KEY,
BranchName varchar(30) NOT NULL,
Address varchar(50) NOT NULL
)
GO

INSERT INTO Library_Branch
VALUES (1,'Sharpstown','9834 N Flat Tire Way'),
(2,'Central','2266 NW Middle Of Everything St'),
(3,'Flatstown','765 Les Scwab Road'),
(4,'Funky Town','3466 Take Me Here Ct.')
GO

CREATE TABLE Borrower
(
CardNo int PRIMARY KEY,
Name varchar(30) NOT NULL,
Address varchar(50) NOT NULL,
Phone varchar(18)
)
GO

INSERT INTO Borrower
VALUES (10,'Darth Vader','7272 Imperial March Way','330-555-8444'),
(11,'Gary Dickens','1256 American Beauty Dr','635-555-0173'),
(12,'Harry Mickens','1259 Ygnacio Valley Road','815-555-0138'),
(13,'Janet Crickens','5424 Bel Air Drive','465-555-0156'),
(14,'Mary Tickens','7884 Power Ave.','154-555-0161'),
(15,'Douglas Chickens','5455 Granola Dr','224-555-0119'),
(16,'Pedro Zickens','5468 Boxwood Drive','804-555-0100'),
(17,'Sally Pickens','1267 Baltic Sea Ct.','476-444-6712'),
(18,'Larry','5489 Cable Guy Blvd.','155-555-0182')
GO

CREATE TABLE Book_Loans
(
BookID int REFERENCES Book(BookID),
BranchID int REFERENCES Library_Branch(BranchID),
CardNo int REFERENCES Borrower(CardNo),
[DateOut] varchar(10) NOT NULL,
[DueDate] varchar(10) NOT NULL
)
GO

INSERT INTO Book_Loans
VALUES (1,1,17,'2016-03-01','2016-03-14'),
(2,1,12,'2016-03-01','2016-03-14'),
(4,3,13,'2016-03-01','2016-03-14'),
(3,4,14,'2016-03-01','2016-03-14'),
(22,2,15,'2016-03-01','2016-03-14'),
(21,1,16,'2016-03-01','2016-03-14'),
(18,3,17,'2016-03-01','2016-03-14'),
(17,4,18,'2016-03-01','2016-03-14'),
(16,4,18,'2016-03-01','2016-03-14'),
(15,4,18,'2016-03-01','2016-03-14'),
(14,4,18,'2016-03-01','2016-03-14'),
(13,4,18,'2016-03-01','2016-03-14'),
(5,3,13,'2016-03-01','2016-03-14'),
(6,3,13,'2016-03-01','2016-03-14'),
(7,3,13,'2016-03-01','2016-03-14'),
(9,3,13,'2016-03-01','2016-03-14'),
(10,3,13,'2016-03-01','2016-03-14'),
(22,1,12,'2016-03-01','2016-03-14'),
(1,2,15,'2016-03-01','2016-03-14'),
(20,1,16,'2016-03-03','2016-03-16'),
(19,1,16,'2016-03-03','2016-03-16'),
(18,1,16,'2016-03-03','2016-03-16'),
(5,4,14,'2016-03-03','2016-03-16'),
(7,4,14,'2016-03-03','2016-03-16'),
(9,4,14,'2016-03-03','2016-03-16'),
(11,1,12,'2016-03-03','2016-03-16'),
(13,1,12,'2016-03-03','2016-03-16'),
(2,2,15,'2016-03-03','2016-03-16'),
(1,1,16,'2016-03-03','2016-03-16'),
(11,3,13,'2016-03-05','2016-03-18'),
(12,3,13,'2016-03-05','2016-03-18'),
(13,3,13,'2016-03-05','2016-03-18'),
(14,3,13,'2016-03-05','2016-03-18'),
(15,3,13,'2016-03-05','2016-03-18'),
(16,3,13,'2016-03-05','2016-03-18'),
(3,2,15,'2016-03-07','2016-03-20'),
(2,1,16,'2016-03-07','2016-03-20'),
(21,1,12,'2016-03-07','2016-03-20'),
(17,3,13,'2016-03-07','2016-03-20'),
(22,4,14,'2016-03-07','2016-03-20'),
(4,2,15,'2016-03-07','2016-03-20'),
(10,1,16,'2016-03-09','2016-03-23'),
(20,1,12,'2016-03-09','2016-03-23'),
(18,3,13,'2016-03-09','2016-03-23'),
(13,4,14,'2016-03-09','2016-03-23'),
(5,2,15,'2016-03-09','2016-03-23'),
(17,1,16,'2016-03-09','2016-03-23'),
(19,3,13,'2016-03-09','2016-03-23'),
(11,4,14,'2016-03-09','2016-03-23'),
(7,2,15,'2016-03-09','2016-03-23'),
(16,1,16,'2016-03-09','2016-03-23')
GO

CREATE TABLE Book_Copies
(
BookID int REFERENCES Book(BookID),
BranchID int REFERENCES Library_Branch(BranchID),
No_Of_Copies int,
)
GO

INSERT INTO Book_Copies
VALUES (1,1,7),
(2,1,8),
(3,1,9),
(4,1,10),
(5,1,7),
(6,1,7),
(7,1,7),
(8,1,5),
(9,1,4),
(10,1,8),
(11,1,11),
(12,1,12),
(13,1,18),
(14,1,5),
(15,1,7),
(16,1,10),
(17,1,9),
(18,1,8),
(19,1,7),
(20,1,6),
(21,1,5),
(22,1,4),
(1,2,16),
(2,2,8),
(3,2,7),
(4,2,5),
(5,2,7),
(6,2,9),
(7,2,7),
(8,2,10),
(9,2,7),
(10,2,11),
(11,2,7),
(12,2,7),
(13,2,9),
(14,2,8),
(15,2,12),
(16,2,7),
(17,2,10),
(18,2,6),
(19,2,7),
(20,2,5),
(21,2,7),
(22,2,9),
(1,3,20),
(2,3,12),
(3,3,7),
(4,3,7),
(5,3,9),
(6,3,8),
(7,3,7),
(8,3,8),
(9,3,7),
(10,3,10),
(11,3,7),
(12,3,13),
(13,3,7),
(14,3,14),
(15,3,7),
(16,3,11),
(17,3,12),
(18,3,9),
(19,3,5),
(20,3,3),
(21,3,7),
(22,3,12),
(1,4,7),
(2,4,10),
(3,4,7),
(4,4,9),
(5,4,8),
(6,4,12),
(7,4,14),
(8,4,7),
(9,4,7),
(10,4,7),
(11,4,4),
(12,4,7),
(13,4,7),
(14,4,3),
(15,4,7),
(16,4,4),
(17,4,7),
(18,4,5),
(19,4,7),
(20,4,9),
(21,4,7),
(22,4,6)
GO

