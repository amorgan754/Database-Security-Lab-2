/*Ashley Morgan
24 Jan 2023
SDEV 350 6380
Professor Haseltine*/

/*create tables for engineers, faculty, classes, and class enrollment*/
CREATE TABLE Engineers(
    EID NUMBER NOT NULL PRIMARY KEY,
    Firstname VARCHAR2(30),
    Lastname VARCHAR2 (30),
    Email VARCHAR2(50),
    Graddate VARCHAR2(10)
    );
    
CREATE TABLE Faculty(
    FID NUMBER NOT NULL PRIMARY KEY,
    First VARCHAR2(30),
    Last VARCHAR2 (30),
    Emailaddress VARCHAR2(50),
    Hiredate VARCHAR2(10)
    );
    
CREATE TABLE Classes(
    CID NUMBER NOT NULL PRIMARY KEY,
    Subject VARCHAR2(30),
    Catalognbr VARCHAR2 (30),
    Title VARCHAR2(50)
    );
    
CREATE TABLE ClassEnrollments(
    EnID NUMBER NOT NULL PRIMARY KEY,
    CID NUMBER REFERENCES Classes(CID),
    FID NUMBER REFERENCES Faculty(FID),
    EID NUMBER REFERENCES Engineers(EID)
    );
 
 /*insert values into each table*/   
INSERT INTO Engineers VALUES('1', 'Bob', 'Smith', 'bobsmith@school.com', '01/01/2024');
INSERT INTO Engineers VALUES('2', 'Tanner', 'Joe', 'tannerjoe@school.com', '05/01/2024');
INSERT INTO Engineers VALUES('3', 'Joe', 'Wright', 'joewright@school.com', '05/01/2024');
INSERT INTO Engineers VALUES('4', 'Savanah', 'Smith', 'savanahsmith@school.com', '05/01/2024');
INSERT INTO Engineers VALUES('5', 'Joanna', 'Wright', 'joannawright@school.com', '05/01/2024');
INSERT INTO Engineers VALUES('6', 'Bree', 'Smith', 'breesmith@school.com', '01/01/2024');
INSERT INTO Engineers VALUES('7', 'Tyler', 'Lee', 'tylerlee@school.com', '01/01/2024');
INSERT INTO Engineers VALUES('8', 'Joe', 'Smith', 'joesmith@school.com', '01/01/2024');
INSERT INTO Engineers VALUES('9', 'Guy', 'Lock', 'guylock@school.com', '12/01/2023');
INSERT INTO Engineers VALUES('10', 'Jason', 'Greyson', 'jasongreyson@school.com', '12/01/2023');
INSERT INTO Engineers VALUES('11', 'Lily', 'Pad', 'lilypad@school.com', '12/01/2023');
INSERT INTO Engineers VALUES('12', 'Jane', 'Doe', 'janedoe@school.com', '12/01/2024');
INSERT INTO Engineers VALUES('13', 'John', 'Doe', 'johndoe@school.com', '12/01/2023');
INSERT INTO Engineers VALUES('14', 'Jason', 'Doe', 'jasondoe@school.com', '12/01/2024');
INSERT INTO Engineers VALUES('15', 'Sarah', 'Smith', 'sarahsmith@school.com', '12/01/2024');

INSERT INTO Faculty VALUES('1', 'Maria', 'Smith', 'mariasmith@school.com', '05/01/2012');
INSERT INTO Faculty VALUES('2', 'Jose', 'Johnson', 'josejohnson@school.com', '08/01/2015');
INSERT INTO Faculty VALUES('3', 'Ali', 'Williams', 'aliwilliams@school.com', '01/01/2023');

INSERT INTO Classes VALUES('1', 'SDEV', '350', 'Database Security');
INSERT INTO Classes VALUES('2', 'CMIT', '321', 'Ethical Hacking');
INSERT INTO Classes VALUES('3', 'CMIS', '440', 'Advanced Programming');

INSERT INTO ClassEnrollments VALUES('1', '1', '1', '1');
INSERT INTO ClassEnrollments VALUES('2', '2', '2', '2');
INSERT INTO ClassEnrollments VALUES('3', '3', '3', '3');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('4', '4');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('5', '5');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('6', '6');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('7', '7');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('8', '8');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('9', '9');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('10', '10');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('11', '11');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('12', '12');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('13', '13');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('14', '14');
INSERT INTO ClassEnrollments(EnID, EID) VALUES('15', '15');

/*display all from each table*/
SELECT * FROM Engineers ORDER BY EID DESC;
SELECT * FROM Faculty ORDER BY FID DESC;
SELECT * FROM Classes ORDER BY CID DESC;
SELECT * FROM ClassEnrollments ORDER BY EnID DESC;

/*update the faculty, engineers, classes, and class enrollments tables*/
UPDATE Faculty
SET Last = 'Friendship'
WHERE Last = 'Williams';

UPDATE Engineers
SET Firstname = 'Amadeus'
WHERE Firstname = 'Bob';

UPDATE Classes
SET Subject = 'IOT Cyber'
WHERE Subject = 'Advanced Programming';

DELETE FROM ClassEnrollments
WHERE EnID = '1';

/*create a view combining each table*/
CREATE VIEW Overall AS
    SELECT Engineers.Firstname, Engineers.Lastname, Faculty.Last, 
    Faculty.Emailaddress, Classes.Subject, Classes.Title
    FROM Engineers, Faculty, Classes;

/*display the view*/
SELECT * FROM Overall;
