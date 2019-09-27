DROP TABLE employee        cascade constraints;
DROP TABLE faultreport     cascade constraints;
DROP TABLE outlet          cascade constraints;
DROP TABLE vehicle         cascade constraints;
DROP TABLE client          cascade constraints;
DROP TABLE ragreement      cascade constraints;

SET ECHO ON
SET LINESIZE 200
SET PAGESIZE 200
COLUMN ClientName FORMAT 'A10'

CREATE TABLE client
( clientNo       NUMBER(10),
  ClientName     VARCHAR2(15),
  Street         VARCHAR2(30),
  City           VARCHAR2(15),
  State          VARCHAR2(15),
  ZipCode        NUMBER(10),
  WebAddress     VARCHAR2(150),
  Contact_FName  VARCHAR2(15),
  Contact_LName  VARCHAR2(15),
  Phone          VARCHAR2(15),
  Email          VARCHAR2(30),
  CONSTRAINT client_clientNo_PK PRIMARY KEY (clientNo));

CREATE TABLE outlet
( outNo        NUMBER(10),
  Street       VARCHAR2(20),
  City         VARCHAR2(20),
  State        VARCHAR2(20),
  ZipCode      NUMBER(10),
  Phone        VARCHAR2(15),
  ManagerNo    NUMBER(5),
  CONSTRAINT outlet_outNo_PK PRIMARY KEY (outNo));


CREATE TABLE employee
( EmpNo        NUMBER(5),
  FName        VARCHAR2(25),
  LName        VARCHAR2(25),
  Position     VARCHAR2(25),
  Phone        VARCHAR2(15),
  Email        VARCHAR2(25),
  DOB          DATE,
  Gender       CHAR(1),
  Salary       NUMBER(10),
  HireDate     DATE,
  OutNo        NUMBER(5),
  SupervisorNo NUMBER(5),
  CONSTRAINT employee_EmpNo_PK        PRIMARY KEY (EmpNo),
  CONSTRAINT employee_DOB_ck          CHECK (DOB < '13-Jul-2015'),
  CONSTRAINT employee_email_ck        CHECK (email LIKE '%@carrental.com'),
  CONSTRAINT employee_salary_ck       CHECK (salary >= 0),
  CONSTRAINT employee_OutNo_FK        FOREIGN KEY (OutNo) REFERENCES outlet(OutNo),
  CONSTRAINT employee_SupervisorNo_FK FOREIGN KEY (SupervisorNo) REFERENCES employee (EmpNo));

CREATE TABLE vehicle
( LicenseNo      VARCHAR2(8),
  Make           VARCHAR2(10),
  Model          VARCHAR2(10),
  Color          VARCHAR2(10),
  Year           NUMBER(5),
  NoDoors        NUMBER(5),
  Capacity       NUMBER(5),
  DailyRate      NUMBER(10),
  InsepctionDate Date,
  outNo          NUMBER(10),
  CONSTRAINT vehicle_LicenseNo_PK  PRIMARY KEY (LicenseNo),
  CONSTRAINT vehicle_outNo_FK      FOREIGN KEY (outNo) REFERENCES outlet (outNo));

CREATE TABLE ragreement
( RentalNo       NUMBER(10),
  StartDate      Date,
  ReturnDate     Date,
  MileageBefore  NUMBER(10),
  MileageAfter   NUMBER(10),
  InsuranceType  VARCHAR2(15),
  ClientNo       NUMBER(10),
  LicenseNo      VARCHAR2(15),
  CONSTRAINT ragreement_RentalNo_PK    PRIMARY KEY (RentalNo),
  CONSTRAINT ragreement_date_ck        CHECK (returndate > startdate),
  CONSTRAINT ragreement_mileage_ck     CHECK (mileageafter > mileagebefore),
  CONSTRAINT ragreement_ClientNo_FK    FOREIGN KEY (ClientNo) REFERENCES client (clientNo),
  CONSTRAINT ragreement_LicneseNo_FK   FOREIGN KEY (LicenseNo) REFERENCES vehicle (LicenseNo));

CREATE TABLE faultreport
( ReportNum      NUMBER(10),
  Datechecked    Date,
  Comments       VARCHAR2(400), 
  EmpNo          NUMBER(5),
  LicenseNo      VARCHAR2(15),
  RentalNo       NUMBER(10),
  CONSTRAINT faultreport_ReportNum_PK     PRIMARY KEY (ReportNum),
  CONSTRAINT faultreport_EmpNo_FK         FOREIGN KEY (EmpNo) REFERENCES employee (EmpNo),
  CONSTRAINT faultreport_LicenseNo_FK     FOREIGN KEY (LicenseNo) REFERENCES vehicle (LicenseNo),
  CONSTRAINT faultreport_RentalNo_FK      FOREIGN KEY (RentalNo) REFERENCES ragreement (RentalNo));

ALTER TABLE outlet ADD CONSTRAINT outlet_ManagerNo_FK FOREIGN KEY (ManagerNo) REFERENCES employee (EmpNo);

INSERT INTO client VALUES
(1, 'Mike', '2306 Penn Ave', 'Pittsburgh', 'PA', 15222, 'https://www.google.com/maps/place/WFH+Oriental+Market', 
'Jason', 'Yao', '412-434-6579', 'aby21@gmail.com');

INSERT INTO client VALUES
(2, 'Lin', '1501 Arch St', 'Pittsburgh', 'PA', 15212, 'https://www.google.com/maps/place/Randyland',
'Nik', 'Wanq', '412-342-8152', 'edsp1@gmail.com');

INSERT INTO client VALUES
(3, 'Michael', '1003 Charleston Town Center', 'Charleston', 'WV', 25389, 'https://www.google.com/maps/place/Sears+Outlet',
'Iva', 'Chang', '304-344-3950', 'se021@gmail.com');

INSERT INTO client VALUES
(4, 'Kobe', '1201 University Rd', 'Cleveland', 'OH', 44113, 'https://www.google.com/maps/place/Sokolowski',
'Wax', 'Uid', '216-771-9236', 'ies912w@gmail.com');

INSERT INTO client VALUES
(5, 'Shang', '1979 W 25th St', 'Cleveland', 'OH', 44113, 'https://www.google.com/maps/place/West+Side+Market',
'Min', 'Ning', '216-579-6800', '721ddd@gmail.com');

INSERT INTO client VALUES
(6, 'Dirk', '116 Kanawha Blvd E', 'Charleston', 'WV', 25301, 'https://www.google.com/maps/place/Chipotle+Mexican+Grill',
'Mark', 'Yalk', '234-208-2245', '8e3s2@gmail.com');

INSERT INTO client VALUES
(7, 'Jason', '1198 Wayne Ave', 'Indiana', 'PA', 15701, 'https://www.google.com/maps/place/Hoss',
'Aaron', 'Tim', '724-349-5750', 'aac98@gmail.com');

INSERT INTO client VALUES
(8, 'Alex', '2025 Benjamin Franklin Pkwy', 'Philadelphia', 'PA', 19130, 'https://www.google.com/maps/place/chipolte',
'Mary', 'Wai', '215-278-7000', 'uei91@gmail.com');

INSERT INTO client VALUES
(9, 'Dwan', '1320 Walnut St', 'Philadelphia', 'PA', 19107, 'https://www.google.com/maps/place/IHOP',
'Rai', 'Ioa', '215-732-1726', 'ss82@gmail.com');

INSERT INTO client VALUES
(10, 'Tim', '28 S 18th St', 'Philadelphia', 'PA', 19103, 'https://www.google.com/maps/place/Midtown',
'Shean', 'Lin', '215-567-5144', 'wuesx92@gmail.com');



INSERT INTO outlet VALUES 
(1, '756 S Millvale Ave', 'Pittsburgh', 'PA', 15213, '412-570-9026',null);

INSERT INTO outlet VALUES 
(2, '1318 Fifth Ave', 'Pittsburgh', 'PA', 15219, '412-579-6723',null);

INSERT INTO outlet VALUES 
(3, '5634 Baum Blvd', 'Pittsburgh', 'PA', 15206, '412-478-0297',null);

INSERT INTO employee VALUES
(1, 'Molly', 'Taylor', 'Admin', '412-345-2467', 'mollyt@carrental.com', '11-Aug-1989', 'F', 3800, '05-Apr-2015', 1, NULL);

INSERT INTO employee VALUES
(2, 'John', 'Smith', 'Mechanics', '412-582-4290', 'johns@carrental.com', '11-Aug-1988', 'M', 4000, '20-Aug-2010', 1, NULL);

INSERT INTO employee VALUES
(3, 'Micheal', 'Jones', 'Sales rep', '412-745-7862', 'michealj@carrental.com', '20-Dec-1982', 'M', 5500, '20-Jan-2013', 1, NULL);

INSERT INTO employee VALUES
(4, 'David', 'Parker', 'Sales rep', '412-390-4432', 'davidp@carrental.com', '16-Jan-1978', 'M', 4500, '10-Apr-2007', 1, 3);

INSERT INTO employee VALUES
(5, 'Mario', 'Brown', 'Mechanics', '412-409-1290', 'mariob@carrental.com', '01-Jun-1980', 'M', 4000, '10-Jan-2008', 2, NULL);

INSERT INTO employee VALUES
(6, 'Helen', 'Lewis', 'Admin', '412-278-7768', 'helenl@carrental.com', '11-Aug-1990', 'F', 3800, '05-Apr-2017', 2, NULL);

INSERT INTO employee VALUES
(7, 'Larry', 'Davis', 'Sales rep', '412-289-9078', 'larryd@carrental.com', '27-Nov-1983', 'M', 5000, '01-Jun-2009', 2, NULL);

INSERT INTO employee VALUES
(8, 'Luke', 'White', 'Sales rep', '412-990-4908', 'lukew@carrental.com', '11-Apr-1987', 'M', 3500, '05-Apr-2018', 3, NULL);

INSERT INTO employee VALUES
(9, 'Erica', 'King', 'Sales rep', '412-423-7623', 'ericak@carrental.com', '20-Sep-1980', 'F', 3500, '05-Dec-2012', 3, 8);

INSERT INTO employee VALUES
(10, 'Jacob', 'Baker', 'Mechanics', '412-405-8915', 'jacobb@carrental.com', '01-Feb-1992', 'M', 3000, '05-Apr-2016', 3, NULL);

UPDATE outlet
SET ManagerNo = 3
WHERE outNo = 1;

UPDATE outlet
SET ManagerNo = 8
WHERE outNo = 2;

UPDATE outlet
SET ManagerNo = 8
WHERE outNo = 3;

INSERT INTO vehicle VALUES 
('VZA-2517', 'Chevrolet', 'Spark', 'Green', 2011, 2, 4, 70, TO_DATE( '13-Apr-2018 14:00', 'DD-MM-YYYY HH24:MI' ), 1);

INSERT INTO vehicle VALUES 
('LGV-5764', 'Ford', 'Focus', 'Gray', 2010, 4, 5, 55, TO_DATE( '18-Jan-2017 16:00', 'DD-MM-YYYY HH24:MI' ), 1);

INSERT INTO vehicle VALUES 
('LHK-6850', 'Toyota', 'Altis', 'White', 2013, 4, 5, 60, TO_DATE( '28-May-2017 16:00', 'DD-MM-YYYY HH24:MI' ), 2);

INSERT INTO vehicle VALUES 
('ZXP-3330', 'Toyota', 'Camry', 'Red', 2011, 4, 5, 65, TO_DATE( '28-Oct-2018 10:00', 'DD-MM-YYYY HH24:MI' ), 2);

INSERT INTO vehicle VALUES 
('LMT-7148', 'Honda', 'Fit', 'Black', 2014, 4, 5, 65, TO_DATE( '23-Jun-2018 11:00', 'DD-MM-YYYY HH24:MI' ), 3);

INSERT INTO vehicle VALUES 
('VUR-8143', 'Honda', 'CRV', 'Black', 2013, 4, 5, 70, TO_DATE( '14-Jun-2015 13:00', 'DD-MM-YYYY HH24:MI' ), 2);

INSERT INTO vehicle VALUES 
('JHH-7857', 'Honda', 'Fit', 'White', 2014, 4, 5, 65, TO_DATE( '02-Jul-2015 13:00', 'DD-MM-YYYY HH24:MI' ), 2);

INSERT INTO vehicle VALUES 
('IUA-2298', 'Mitsubishi', 'Eclipse', 'White', 2013, 4, 5, 60, TO_DATE( '18-Jun-2015 13:00', 'DD-MM-YYYY HH24:MI' ), 1);

INSERT INTO vehicle VALUES 
('JGW-2269', 'Toyata', 'Camry', 'Gray', 2011, 4, 5, 50, TO_DATE( '11-May-2017 15:00', 'DD-MM-YYYY HH24:MI' ), 1);

INSERT INTO vehicle VALUES 
('PHF-4089', 'Toyata', 'Camry', 'White', 2017, 4, 5, 65, TO_DATE( '19-May-2018 15:00', 'DD-MM-YYYY HH24:MI' ), 2);

INSERT INTO vehicle VALUES 
('ZVN-2758', 'Ford', 'Focus', 'White', 2014, 4, 5, 60, TO_DATE( '13-May-2017 15:00', 'DD-MM-YYYY HH24:MI' ), 1);


INSERT INTO ragreement VALUES
(4,  TO_DATE( '01-Mar-2017 09:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '10-Mar-2017 18:00', 'DD-MM-YYYY HH24:MI' ), 3000, 3800, 'TYPE I', 1, 'VZA-2517');

INSERT INTO ragreement VALUES
(17, TO_DATE( '04-Dec-2016 10:00', 'DD-MM-YYYY HH24:MI' ), TO_DATE( '13-Jan-2017 11:00', 'DD-MM-YYYY HH24:MI' ), 8312, 9312, 'TYPE I', 2, 'VUR-8143');

INSERT INTO ragreement VALUES
(7,  TO_DATE( '19-Apr-2015 11:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '21-May-2015 14:00', 'DD-MM-YYYY HH24:MI' ), 5291, 6311, 'TYPE II', 3, 'ZXP-3330');

INSERT INTO ragreement VALUES
(14,  TO_DATE( '03-Oct-2017 12:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '11-Nov-2017 19:00', 'DD-MM-YYYY HH24:MI' ), 1183, 1489, 'TYPE II', 4, 'JHH-7857');

INSERT INTO ragreement VALUES
(11,  TO_DATE( '09-Jan-2016 13:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '22-Feb-2016 11:00', 'DD-MM-YYYY HH24:MI' ), 4921, 5005, 'TYPE II', 5, 'IUA-2298');

INSERT INTO ragreement VALUES
(16,  TO_DATE( '17-Mar-2018 14:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '02-May-2018 15:00', 'DD-MM-YYYY HH24:MI' ), 5000, 5529, 'TYPE I', 6, 'JGW-2269');

INSERT INTO ragreement VALUES
(18,  TO_DATE( '04-Jun-2017 15:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '08-Jul-2017 19:00', 'DD-MM-YYYY HH24:MI' ), 6631, 6804, 'TYPE I', 7, 'PHF-4089');

INSERT INTO ragreement VALUES
(2,  TO_DATE( '14-Aug-2016 09:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '08-Sep-2016 11:00', 'DD-MM-YYYY HH24:MI' ), 3981, 4099, 'TYPE II', 8, 'LHK-6850');

INSERT INTO ragreement VALUES
(22,  TO_DATE( '08-May-2018 13:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '19-May-2018 14:00', 'DD-MM-YYYY HH24:MI' ), 3081, 3221, 'TYPE III', 9, 'ZVN-2758');

INSERT INTO ragreement VALUES
(5,  TO_DATE( '18-Nov-2017 11:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '03-Jan-2018 19:00', 'DD-MM-YYYY HH24:MI' ), 6812, 7001, 'TYPE III', 10, 'LGV-5764');

INSERT INTO ragreement VALUES
(6,  TO_DATE( '14-Sep-2016 15:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '08-Oct-2016 10:00', 'DD-MM-YYYY HH24:MI' ), 4122, 4299, 'TYPE II', 3, 'LHK-6850');

INSERT INTO ragreement VALUES
(3,  TO_DATE( '11-Jan-2017 14:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '28-Jan-2017 08:00', 'DD-MM-YYYY HH24:MI' ), 4311, 4331, 'TYPE II', 8, 'LHK-6850');

INSERT INTO ragreement VALUES
(1,  TO_DATE( '12-Mar-2017 20:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '28-Apr-2017 14:00', 'DD-MM-YYYY HH24:MI' ), 6012, 6191, 'TYPE II', 5, 'LMT-7148');

INSERT INTO ragreement VALUES
(19,  TO_DATE( '12-Jul-2017 21:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '01-Aug-2017 19:00', 'DD-MM-YYYY HH24:MI' ), 6112, 6231, 'TYPE III', 9, 'LMT-7148');

INSERT INTO ragreement VALUES
(29,  TO_DATE( '19-Jul-2016 19:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '21-Aug-2016 17:00', 'DD-MM-YYYY HH24:MI' ), 7101, 7211, 'TYPE II', 2, 'ZXP-3330');

INSERT INTO ragreement VALUES
(31,  TO_DATE( '22-Dec-2016 10:00', 'DD-MM-YYYY HH24:MI' ),  TO_DATE( '11-Jan-2017 09:00', 'DD-MM-YYYY HH24:MI' ), 7305, 7389, 'TYPE I', 2, 'ZXP-3330');



INSERT INTO faultreport VALUES
(1, '10-Mar-2017', 'Right front door dent', 10, 'VZA-2517', 4);

INSERT INTO faultreport VALUES
(2, '03-Jan-2018', 'battery bad contact, could not start some time', 5, 'LGV-5764', 5);

INSERT INTO faultreport VALUES
(3, '08-Sep-2016', 'one headlight is broken down', 2, 'LHK-6850', 2);

INSERT INTO faultreport VALUES
(4, '08-Oct-2016', 'gas tank leak', 5, 'LHK-6850', 6);

INSERT INTO faultreport VALUES
(5, '21-May-2015', 'software errors with mileage display', 10, 'ZXP-3330', 7);

INSERT INTO faultreport VALUES
(6, '28-Jan-2017', 'door handle stucks', 5, 'LHK-6850', 3);

INSERT INTO faultreport VALUES
(7, '28-Apr-2017', 'sun visor fell out', 5, 'LMT-7148', 1);

INSERT INTO faultreport VALUES
(8, '01-Aug-2017', 'sun visor fell out', 10, 'LMT-7148', 19);

INSERT INTO faultreport VALUES
(9, '21-Aug-2016', 'door handle stucks', 10, 'ZXP-3330', 29);

INSERT INTO faultreport VALUES
(10, '11-Jan-2017', 'door handle stucks', 10, 'ZXP-3330', 31);


--1
SELECT clientNo, ClientName, TO_CHAR(months_between(returndate, startdate)*30*24, '9990') AS duration,
						TO_CHAR(months_between(returndate, startdate)*30, '90')*DailyRate AS rental
FROM client JOIN ragreement USING (clientNo)
            JOIN vehicle USING (LicenseNo)
WHERE State = 'PA'
ORDER BY 2;

--2
COLUMN name FORMAT 'A15'
SELECT EmpNo, FName || ' ' || LName AS name, COUNT(ReportNum) AS "# Reports"
FROM employee LEFT OUTER JOIN faultreport USING (EmpNo)
GROUP BY EmpNo, FName, LName
ORDER BY 3 DESC;

--3
SELECT outNo, TO_CHAR(AVG(months_between(ReturnDate ,Datechecked)*30*24), '90.99') AS "Avg # Hours"
FROM outlet JOIN vehicle USING (outNo)
            JOIN faultreport USING (LicenseNo)
			JOIN ragreement USING (LicenseNo)
GROUP BY outNo;

--4
COLUMN ClientName FORMAT 'A15'
COLUMN ContactName FORMAT 'A15'
COLUMN Email FORMAT 'A20'
SELECT clientNo, ClientName, Contact_FName || ' ' || Contact_LName AS ContactName, Phone, Email
FROM client JOIN ragreement USING (clientNo)
            JOIN vehicle USING (LicenseNo)
MINUS
SELECT clientNo, ClientName, Contact_FName || ' ' || Contact_LName AS ContactName, Phone, Email
FROM client JOIN ragreement USING (clientNo)
            JOIN vehicle USING (LicenseNo)
			JOIN faultreport USING (LicenseNo);
			
--5
SELECT outNo, a AS "# Rental Agreements", revenue
FROM (SELECT outNo, COUNT(RentalNo) AS a, SUM(TO_CHAR(months_between(ReturnDate, StartDate)*30,'990')*DailyRate) AS revenue
	  FROM outlet JOIN vehicle USING (outNo)
				  JOIN ragreement USING (LicenseNo)
	  GROUP BY outNo
	  ORDER BY revenue DESC)    
WHERE ROWNUM < 3;

--6
SELECT RentalNo, StartDate, ReturnDate, clientNo, ClientName, outlet.Street AS "Outlet Street Address"
FROM ragreement JOIN client USING (clientNo)
			    JOIN vehicle USING (LicenseNo)
				JOIN outlet USING (OutNo)
WHERE outNo = (SELECT outNo
			   FROM (SELECT outNo, COUNT(RentalNo)
			         FROM outlet JOIN vehicle USING(outNo)
								 JOIN ragreement USING (LicenseNo)
					 GROUP BY outNo
					 ORDER BY 2 DESC)
			   WHERE ROWNUM < 2);
					
--7
SELECT clientNo, ClientName, COUNT(ragreement.RentalNo) AS "# Rentals", 
	   AVG(months_between(ReturnDate, StartDate)*30) AS "Avg of Days", COUNT(ReportNum) AS "# Faul Reports"
FROM faultreport JOIN vehicle USING (LicenseNo)
                 JOIN ragreement USING (LicenseNo)
				 RIGHT OUTER JOIN client USING (clientNo) 
WHERE State = 'WV'
GROUP BY clientNo, ClientName;

--8
SELECT outNo, Make, SUM(TO_CHAR(months_between(ReturnDate, StartDate)*30,'990')*DailyRate) AS revenue
FROM outlet FULL OUTER JOIN vehicle USING (outNo)
            FULL OUTER JOIN ragreement USING(LicenseNo)
GROUP BY outNo, Make
ORDER BY outNo;

--9
COLUMN "Employee Name" FORMAT 'A15'
COLUMN Make FORMAT 'A10'
COLUMN Model FORMAT 'A10'
SELECT Comments, LicenseNo, Make, Model, Fname || ' ' || Lname AS "Employee Name"
FROM employee JOIN faultreport USING (EmpNo)
			  JOIN vehicle USING (LicenseNo);
			  
--10???
SELECT FName || ' ' || LName AS "Manager Name", COUNT(outlet.outNo) AS "# outlets", 
	   COUNT(EmpNo) AS "# employees", COUNT(LicenseNo) AS "# vehicle"
FROM outlet JOIN employee ON (ManagerNo = EmpNo)
			JOIN vehicle ON (outlet.outNo = vehicle.outNo)
GROUP BY FName, LName;

--11
SELECT COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(StartDate, 'HH24') < 12) AS "# Morning Rental",
	   COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(ReturnDate, 'HH24') < 12) AS "# Morning Return",
	   COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(StartDate, 'HH24') Between 12 AND 18) AS "# Afternoon Rental",
	   COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(ReturnDate, 'HH24') Between 12 AND 18) AS "# Afternoon Return",
	   COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(StartDate, 'HH24') Between 18 AND 23) AS "# Evening Rental",
	   COUNT(SELECT RentalNo FROM ragreement WHERE TO_CHAR(ReturnDate, 'HH24') Between 18 AND 23) AS "# Evening Return",
FROM ragreement
GROUP BY RentalNo;
	   
	   
	COUNT(SELECT RentalNo FROM ragreement WHERE StartDate IS NOT NULL AND ReturnDate IS NOT NULL),		  
SELECT RentalNo
FROM ragreement
WHERE TO_CHAR(ReturnDate, 'HH24') Between 12 AND 18;
			  
COLUMN FName FORMAT 'A10'
COLUMN LName FORMAT 'A10'
COLUMN Position FORMAT 'A10'
COLUMN Phone FORMAT 'A13'








