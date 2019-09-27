DROP TABLE VEHICLE CASCADE CONSTRAINTS;
DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE RAGREEMENT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE FAULTREPORT CASCADE CONSTRAINTS;
DROP TABLE OUTLET CASCADE CONSTRAINTS;

CREATE TABLE OUTLET
(
 outNo NUMBER(6) ,
 Street VARCHAR2(20),
 City VARCHAR2(20),
 State CHAR(2),
 ZipCode NUMBER(5),
 Phone NUMBER(10),
 ManagerNo NUMBER(5),
 CONSTRAINT OUTLET_outNo_PK PRIMARY KEY (outNo)
);

CREATE TABLE CLIENT
(
    clientNo NUMBER(20), 
    ClientName VARCHAR2(30), 
    Street VARCHAR2(20), 
    City VARCHAR2(20), 
    State VARCHAR2(2), 
    ZipCode NUMBER(5), 
    WebAddress VARCHAR2(30), 
    Contact_FName VARCHAR2(20),
    Contact_LName VARCHAR2(20), 
    Phone NUMBER(10), 
    Email VARCHAR2(50),
	CONSTRAINT CLIENT_clientNo_PK PRIMARY KEY (clientNo)
);

CREATE TABLE EMPLOYEE
(
 EmpNo NUMBER(5),
 Fname VARCHAR2(20),
 Lname VARCHAR2(20),
 Position VARCHAR2(20),
 Phone NUMBER(10),
 Email VARCHAR2(30),
 DOB DATE,
 Gender VARCHAR2(1),
 Salary NUMBER(10),
 HireDate Date,
 OutNo NUMBER(6),
 SupervisorNo NUMBER(5),
 CONSTRAINT EMPLOYEE_EmpNo_PK PRIMARY KEY (EmpNo),
 CONSTRAINT EMPLOYEE_OutNo_FK 
    FOREIGN KEY (OutNo)
    REFERENCES OUTLET(outNo),
 CONSTRAINT EMPLOYEE_SupervisorNo_FK
    FOREIGN KEY (SupervisorNo)
    REFERENCES EMPLOYEE(EmpNo),
 CONSTRAINT EMPLOYEE_HireDate_CK	
	CHECK (MONTHS_BETWEEN(HireDate, DOB) >= 14*12),
 CONSTRAINT EMPLOYEE_Email_CK	
	CHECK(Email LIKE '%@car_rental.com'),
 CONSTRAINT EMPLOYEE_Gender_CK	
	CHECK(Gender IN ('F','M','O'))
);
 
CREATE TABLE VEHICLE
(
    LicenseNo VARCHAR2(20), 
	Make VARCHAR2(30), 
	Model VARCHAR2(30), 
	Color VARCHAR2(15), 
	Year NUMBER(4), 
	NoDoors NUMBER(1), 
	Capacity NUMBER(2), 
	DailyRate NUMBER(6,2), 
	InspectionDate DATE, 
	outNo NUMBER(6),
	CONSTRAINT VEHICLE_LicenseNo_PK PRIMARY KEY (LicenseNo),
	CONSTRAINT VEHICLE_outNo_FK 
    FOREIGN KEY (outNo)
    REFERENCES OUTLET(outNo)
);

CREATE TABLE RAGREEMENT
(
    RentalNo NUMBER(20), 
	StartDate DATE, 
	ReturnDate DATE, 
	MileageBefore NUMBER(10), 
	MileageAfter NUMBER(10), 
	InsuranceType VARCHAR2(40),
    ClientNo NUMBER(20), 
	LicenseNo VARCHAR2(16),
	CONSTRAINT RAGREEMENT_RentalNo_PK PRIMARY KEY (RentalNo),
	CONSTRAINT RAGREEMENT_ClientNo_FK
		FOREIGN KEY (ClientNo)
		REFERENCES CLIENT(clientNo),
	CONSTRAINT RAGREEMENT_LicenseNo_FK
		FOREIGN KEY (LicenseNo)
		REFERENCES VEHICLE(LicenseNo),
	CONSTRAINT RAGREEMENT_ReturnDate_CK
		CHECK (ReturnDate >= StartDate),
	CONSTRAINT RAGREEMENT_MlgAft_CK
		CHECK (MileageAfter >= MileageBefore)
);

CREATE TABLE FAULTREPORT
(
 ReportNum NUMBER(10),
 DateChecked DATE,
 Comments VARCHAR2(100),
 EmpNo NUMBER(5),
 LicenseNo VARCHAR2(20),
 RentalNo NUMBER(20), 
 CONSTRAINT FAULTREPORT_ReportNum_PK PRIMARY KEY (ReportNum),
 CONSTRAINT FAULTREPORT_EmpNo_FK
	FOREIGN KEY (EmpNo)
	REFERENCES EMPLOYEE(EmpNo),
 CONSTRAINT FAULTREPORT_LicenseNo_FK
	FOREIGN KEY (LicenseNo)
	REFERENCES VEHICLE(LicenseNo),
 CONSTRAINT FAULTREPORT_RentalNo_FK
	FOREIGN KEY (RentalNo)
	REFERENCES RAGREEMENT(RentalNo)
);

ALTER TABLE OUTLET
	ADD CONSTRAINT OUTLET_ManagerNo_FK
	FOREIGN KEY (ManagerNo)
	REFERENCES EMPLOYEE(EmpNo);

INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (4532016128,'Chiwetel Ejiofor','Murray Avenue','Pittsburgh','PA',15213,'www.alex.com','Rohit','Sharma',1234567891,'r.sharma@abc.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (3455200757,'John Oliver','Get lost avenue','Boston','MA',16215,'www.kane.gov','Virat','Kohli',2345678912,'v.kohli@abc.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (1599434496,'James Earl Jones','Go to hell avenue','San Francisco','CA',17215,'www.stokes.com','Adam','Zampa',3456789123,'a.zampa@abc.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (9878511883,'Alfre Woodard','Never Mind street','Greater Huntington','WV',18215,'www.alex.cn','Lionel','Messi',4567891234,'l.messi@abc.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (5580424655,'Eric Andre','Senseless avenue','Greater Huntington','WV',19215,'www.russel.in','Virat','Kohli',2345678912,'v.kohli@abc.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (6977879690,'Beyonce','Careful street','Atlanta','GA',19216,'www.gayle.net','Trent','Boult',6789123456,'t.boult@xyz.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (2998787484,'Christian Bale','Murray Avenue','Pittsburgh','PA',15213,'www.sam.com','Andrew','Carnegie',7891234567,'a.carnegie@cmu.edu');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (1530375421,'Thanos','Jungle street','Chicago','IL',13213,'www.thanos.com','Andrew','Carnegie',7891234567,'a.carnegie@cmu.edu');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (1036438432,'Tony','Iron Man avenue','Chicago','IL',13214,'www.us.gov','Bill','Gates',9123456789,'b.gates@microsoft.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (2915486715,'Stokes','Cricket street','New York City','NY',14218,'www.stokes.com','Mark','Zuckerberg',1472583694,'mark1@facebook.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (5431225125,'Cillian Murphy','Downton abbey','Philadelphia','PA',12532,NULL,'Chin','Han',3242626534,'cmurphy@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (3490125515,'Jill Stuart','Fifth avenue','Greater Huntington','WV',35235,NULL,'Ivy','Chen',4122095545,'jills@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (1092615453,'Mike','2306 Penn Ave','Pittsburgh','PA',15222,'www.cmu.edu','Jason','Yao',4124346579,'aby21@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (2345436214,'Lin','1501 Arch St','Pittsburgh','PA',15212,'www.beautychina.org','Nik','Wanq',4123428152,'edsp1@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (3342342521,'Michael','1003 Charleston','Charleston','WV',25389,'www.savepoverty.org','Iva','Chang',3043443950,'se021@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (4568323734,'Kobe','1201 University Rd','Cleveland','OH',44113,'www.upitts.edu','Wax','Uid',2167719236,'ies912w@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (5765567583,'Shang','1979 W 25th St','Cleveland','OH',44113,'www.uiuc.edu','Min','Ning',2165796800,'721ddd@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (6657435424,'Dirk','116 Kanawha Blvd E','Charleston','WV',25301,'www.upmc.org','Mark','Yalk',2342082245,'8e3s2@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (7843452345,'Jason','1198 Wayne Ave','Indiana','PA',15701,'www.something.com','Aaron','Tim',7243495750,'aac98@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (8765474265,'Alex','2025 Ben Franklin','Philadelphia','PA',19130,'www.uchicago.edu','Mary','Wai',2152787000,'uei91@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (9654423553,'Dwan','1320 Walnut St','Philadelphia','PA',19107,'www.voteforwomen.org','Rai','Ioa',2157321726,'ss82@gmail.com');
INSERT INTO CLIENT (CLIENTNO,CLIENTNAME,STREET,CITY,STATE,ZIPCODE,WEBADDRESS,CONTACT_FNAME,CONTACT_LNAME,PHONE,EMAIL) VALUES (1053456546,'Tim','28 S 18th St','Philadelphia','PA',19103,NULL,'Shean','Lin',2155675144,'wuesx92@gmail.com');

INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (476412,'Tator Patch Road','Burr Ridge','IL',60527,3129403653,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (926360,'Mulberry Avenue','Little Rock','AR',72211,5012991518,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (942762,'Harry Place','Charlotte','NC',28202,7047656154,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (677386,'Oakmound Drive','Chicago','IL',60631,7733668128,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (386703,'Garfield Road','Macomb','IL',61455,3097050728,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (939863,'Edwards Street','Rocky Mount','NC',27801,2527247932,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (134523,'756 S Millvale Ave','Pittsburgh','PA',15213,4125709026,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (243868,'1318 Fifth Ave','Pittsburgh','PA',15219,4125796723,NULL);
INSERT INTO OUTLET (OUTNO,STREET,CITY,STATE,ZIPCODE,PHONE,MANAGERNO) VALUES (348931,'5634 Baum Blvd','Pittsburgh','PA',15206,4124780297,NULL);

INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (285,'Martha','Jones','General Manager',4195717055,'mjones@car_rental.com',to_date('18-JUN-86','DD-MON-RR'),'F',100000,to_date('12-OCT-09','DD-MON-RR'),386703,NULL);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (193,'Brian','Smith','Operations Manager',5104429270,'bsmith@car_rental.com',to_date('29-JUN-85','DD-MON-RR'),'M',78000,to_date('20-DEC-13','DD-MON-RR'),677386,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (56,'Delbert','Quintero','Operations Manager',7323615593,'dquintero@car_rental.com',to_date('07-JUL-80','DD-MON-RR'),'M',85000,to_date('24-JAN-12','DD-MON-RR'),476412,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (1939,'Kelly','Jackson','Office Manager',7082005099,'kjackson@car_rental.com',to_date('01-NOV-84','DD-MON-RR'),'F',98000,to_date('07-MAR-12','DD-MON-RR'),476412,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (6834,'Hillary','Dennis','Office Manager',5016581818,'hdennis@car_rental.com',to_date('29-AUG-82','DD-MON-RR'),'F',98000,to_date('19-JUN-14','DD-MON-RR'),926360,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (341,'Kevin','Mares','Office Manager',7045126712,'kmares@car_rental.com',to_date('11-JUN-73','DD-MON-RR'),'M',93000,to_date('13-AUG-15','DD-MON-RR'),942762,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (237,'Helen','Lewis','Office Manager',4122787768,'helenl@car_rental.com',to_date('11-AUG-90','DD-MON-RR'),'F',3800,to_date('05-APR-17','DD-MON-RR'),134523,285);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (559,'Isaias','Gatson','Rental Agent',2482011215,'igatson@car_rental.com',to_date('26-JAN-84','DD-MON-RR'),'M',80000,to_date('13-FEB-12','DD-MON-RR'),942762,56);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (786,'Robert','Meinhardt','Rental Agent',8484664566,'rmeinhardt@car_rental.com',to_date('21-JUL-83','DD-MON-RR'),'M',72000,to_date('15-JUL-16','DD-MON-RR'),677386,56);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (20,'Michele','Marcum','Customer Service',3054137501,'mmarcum@car_rental.com',to_date('02-FEB-92','DD-MON-RR'),'F',52000,to_date('05-AUG-16','DD-MON-RR'),386703,193);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (863,'Carl','Landwehr','Customer Service',4074153207,'clandwehr@car_rental.com',to_date('20-AUG-70','DD-MON-RR'),'M',67000,to_date('30-SEP-16','DD-MON-RR'),386703,193);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (362,'Wallace ','Fernandes','Supervisor',8632687856,'wfernandes@car_rental.com',to_date('15-MAY-82','DD-MON-RR'),'M',80000,to_date('13-MAY-17','DD-MON-RR'),939863,193);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (263,'Stephen ','Bentley','Car Washer',4600359839,'sbentley@car_rental.com',to_date('16-JAN-81','DD-MON-RR'),'M',47000,to_date('24-MAR-18','DD-MON-RR'),939863,362);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (505,'Georgia','Murray','Rental Agent',4102951574,'gmurray@car_rental.com',to_date('19-MAY-76','DD-MON-RR'),'F',56000,to_date('18-JUN-18','DD-MON-RR'),386703,56);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (1,'Molly','Taylor','Admin',4123452467,'mollyt@car_rental.com',to_date('11-AUG-89','DD-MON-RR'),'F',3800,to_date('05-APR-15','DD-MON-RR'),134523,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (2,'John','Smith','Mechanics',4125824290,'johns@car_rental.com',to_date('11-AUG-88','DD-MON-RR'),'M',4000,to_date('20-AUG-10','DD-MON-RR'),134523,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (3,'Micheal','Jones','Sales rep',4127457862,'michealj@car_rental.com',to_date('20-DEC-82','DD-MON-RR'),'M',5500,to_date('20-JAN-13','DD-MON-RR'),134523,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (4,'David','Parker','Sales rep',4123904432,'davidp@car_rental.com',to_date('16-JAN-78','DD-MON-RR'),'M',4500,to_date('10-APR-07','DD-MON-RR'),134523,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (5,'Mario','Brown','Mechanics',4124091290,'mariob@car_rental.com',to_date('01-JUN-80','DD-MON-RR'),'M',4000,to_date('10-JAN-08','DD-MON-RR'),243868,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (6,'Larry','Davis','Sales rep',4122899078,'larryd@car_rental.com',to_date('27-NOV-83','DD-MON-RR'),'M',5000,to_date('01-JUN-09','DD-MON-RR'),243868,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (7,'Luke','White','Sales rep',4129904908,'lukew@car_rental.com',to_date('11-APR-87','DD-MON-RR'),'M',3500,to_date('05-APR-18','DD-MON-RR'),348931,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (8,'Erica','King','Sales rep',4124237623,'ericak@car_rental.com',to_date('20-SEP-80','DD-MON-RR'),'F',3500,to_date('05-DEC-12','DD-MON-RR'),348931,237);
INSERT INTO EMPLOYEE (EMPNO,FNAME,LNAME,POSITION,PHONE,EMAIL,DOB,GENDER,SALARY,HIREDATE,OUTNO,SUPERVISORNO) VALUES (9,'Jacob','Baker','Mechanics',4124058915,'jacobb@car_rental.com',to_date('01-FEB-92','DD-MON-RR'),'M',3000,to_date('05-APR-16','DD-MON-RR'),348931,237);

UPDATE Outlet SET  ManagerNo = 1939 WHERE outNo = 476412;
UPDATE Outlet SET  ManagerNo = 6834 WHERE outNo = 926360;
UPDATE Outlet SET  ManagerNo = 341 WHERE outNo = 942762;
UPDATE Outlet SET  ManagerNo = 1939 WHERE outNo = 677386;
UPDATE Outlet SET  ManagerNo = 1939 WHERE outNo = 386703;
UPDATE Outlet SET  ManagerNo = 341 WHERE outNo = 939863;
UPDATE Outlet SET  ManagerNo = 237 WHERE outNo = 134523;
UPDATE Outlet SET  ManagerNo = 237 WHERE outNo = 243868;
UPDATE Outlet SET  ManagerNo = 237 WHERE outNo = 348931;

INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('A543527','MERCEDES-BENZ','G500','Red',2012,4,5,120,to_date('08/21/2015 17:21:05','MM/DD/YYYY HH24:MI:SS'),476412);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('9CA300','SUBARU','TRIBECA','White',2013,4,5,100,to_date('01/01/2017 19:55:42','MM/DD/YYYY HH24:MI:SS'),926360);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('6GDG486','KIA','SPORTAGE','Blue',2014,2,2,143,to_date('06/20/2018 13:15:02','MM/DD/YYYY HH24:MI:SS'),476412);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('34538','BMW','M6','Yellow',2015,5,7,100,to_date('07/13/2018 16:26:08','MM/DD/YYYY HH24:MI:SS'),386703);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('A193958','BMW','X6','Red',2016,5,7,110,to_date('09/09/2018 22:27:59','MM/DD/YYYY HH24:MI:SS'),386703);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('EPK6669','DODGE','GRAND CARAVAN','Blue',2017,4,5,170,to_date('02/12/2019 19:52:39','MM/DD/YYYY HH24:MI:SS'),926360);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('WYF8231','CHEVROLET','W5500','Black',2018,4,5,120,to_date('04/09/2019 13:15:47','MM/DD/YYYY HH24:MI:SS'),939863);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('6TRJ244','FORD','ESCAPE','Red',2013,4,5,143,to_date('01/01/2017 13:08:29','MM/DD/YYYY HH24:MI:SS'),476412);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('195SUQ','CHEVROLET','EQUINOX','Black',2015,2,2,115,to_date('07/13/2018 18:34:16','MM/DD/YYYY HH24:MI:SS'),677386);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('742982','AUDI','RS4','White',2017,5,7,120,to_date('03/12/2019 22:36:39','MM/DD/YYYY HH24:MI:SS'),942762);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('VZA2517','CHEVROLET','Spark','Green',2011,2,4,140,to_date('04/13/2018 09:06:14','MM/DD/YYYY HH24:MI:SS'),134523);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('LGV5764','FORD','Focus','Gray',2010,4,5,110,to_date('01/18/2017 19:45:56','MM/DD/YYYY HH24:MI:SS'),243868);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('LHK6850','TOYOTA','Altis','White',2013,4,5,120,to_date('05/28/2017 22:56:13','MM/DD/YYYY HH24:MI:SS'),348931);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('ZXP3330','TOYOTA','Camry','Red',2011,4,5,130,to_date('10/28/2018 09:48:12','MM/DD/YYYY HH24:MI:SS'),134523);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('LMT7148','HONDA','Fit','Black',2014,4,5,130,to_date('06/23/2018 13:36:37','MM/DD/YYYY HH24:MI:SS'),243868);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('VUR8143','HONDA','CRV','Black',2013,4,5,140,to_date('06/14/2015 09:54:39','MM/DD/YYYY HH24:MI:SS'),134523);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('JHH7857','HONDA','Fit','White',2014,4,5,130,to_date('07/02/2015 13:42:05','MM/DD/YYYY HH24:MI:SS'),243868);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('IUA2298','MITSUBISHI','Eclipse','White',2013,4,5,120,to_date('06/18/2015 21:01:21','MM/DD/YYYY HH24:MI:SS'),134523);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('JGW2269','TOYOTA','Camry','Gray',2011,4,5,100,to_date('05/11/2017 10:14:49','MM/DD/YYYY HH24:MI:SS'),348931);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('PHF4089','TOYOTA','Camry','White',2017,4,5,130,to_date('05/19/2018 18:02:43','MM/DD/YYYY HH24:MI:SS'),348931);
INSERT INTO VEHICLE (LICENSENO,MAKE,MODEL,COLOR,YEAR,NODOORS,CAPACITY,DAILYRATE,INSPECTIONDATE,OUTNO) VALUES ('ZVN2758','FORD','Focus','White',2014,4,5,120,to_date('05/13/2017 18:17:08','MM/DD/YYYY HH24:MI:SS'),348931);

INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (1572515072,to_date('02/21/2018 19:42:42','MM/DD/YYYY HH24:MI:SS'),to_date('03/04/2018 12:58:38','MM/DD/YYYY HH24:MI:SS'),6061,6413,'Personal injury protection insurance',9878511883,'34538');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (742666768,to_date('10/28/2017 10:59:44','MM/DD/YYYY HH24:MI:SS'),to_date('11/11/2017 08:30:33','MM/DD/YYYY HH24:MI:SS'),7204,7659,'Collision insurance',1036438432,'195SUQ');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (1931823579,to_date('11/23/2018 20:24:17','MM/DD/YYYY HH24:MI:SS'),to_date('12/07/2018 10:09:53','MM/DD/YYYY HH24:MI:SS'),8433,10013,'Collision insurance',1599434496,'6GDG486');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (8809065717,to_date('07/02/2019 09:42:30','MM/DD/YYYY HH24:MI:SS'),to_date('07/12/2019 08:27:59','MM/DD/YYYY HH24:MI:SS'),16396,23974,'Collision insurance',1530375421,'6TRJ244');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (5572767354,to_date('01/30/2019 06:22:16','MM/DD/YYYY HH24:MI:SS'),to_date('02/09/2019 07:51:47','MM/DD/YYYY HH24:MI:SS'),1306,1947,'Liability insurance',1599434496,'6TRJ244');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (8200523568,to_date('06/08/2019 07:18:57','MM/DD/YYYY HH24:MI:SS'),to_date('07/03/2019 20:01:26','MM/DD/YYYY HH24:MI:SS'),3063,3751,'Personal injury protection insurance',2915486715,'742982');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (4611047496,to_date('06/10/2016 09:32:14','MM/DD/YYYY HH24:MI:SS'),to_date('06/23/2016 14:47:24','MM/DD/YYYY HH24:MI:SS'),1241,2977,'Gap Insurance',3455200757,'9CA300');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (6331078473,to_date('11/25/2017 18:15:20','MM/DD/YYYY HH24:MI:SS'),to_date('12/08/2017 18:58:21','MM/DD/YYYY HH24:MI:SS'),43524,46641,'Liability insurance',1530375421,'WYF8231');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (6928262987,to_date('04/03/2019 17:29:12','MM/DD/YYYY HH24:MI:SS'),to_date('04/15/2019 19:39:26','MM/DD/YYYY HH24:MI:SS'),2138,3234,'Liability insurance',5580424655,'A193958');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (9674433000,to_date('07/22/2019 19:48:11','MM/DD/YYYY HH24:MI:SS'),to_date('07/28/2019 15:18:36','MM/DD/YYYY HH24:MI:SS'),15496,32895,'Collision insurance',4532016128,'A193958');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (147757247,to_date('06/11/2019 11:44:56','MM/DD/YYYY HH24:MI:SS'),to_date('06/24/2019 06:34:38','MM/DD/YYYY HH24:MI:SS'),64275,99268,'Gap Insurance',6977879690,'A193958');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (9036892903,to_date('03/03/2018 07:41:04','MM/DD/YYYY HH24:MI:SS'),to_date('03/16/2018 08:40:45','MM/DD/YYYY HH24:MI:SS'),1610,1794,'Personal injury protection insurance',4532016128,'A543527');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (736473964,to_date('05/22/2019 22:27:25','MM/DD/YYYY HH24:MI:SS'),to_date('06/05/2019 08:18:52','MM/DD/YYYY HH24:MI:SS'),9967,10863,'Gap Insurance',6977879690,'EPK6669');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (3157445115,to_date('05/25/2019 06:19:06','MM/DD/YYYY HH24:MI:SS'),to_date('06/20/2019 08:57:00','MM/DD/YYYY HH24:MI:SS'),4013,83109,'Gap Insurance',9878511883,'EPK6669');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (5696741198,to_date('07/17/2019 06:42:24','MM/DD/YYYY HH24:MI:SS'),to_date('07/29/2019 19:58:02','MM/DD/YYYY HH24:MI:SS'),3228,3293,'Liability insurance',2998787484,'WYF8231');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (2143214132,to_date('07/16/2018 20:02:40','MM/DD/YYYY HH24:MI:SS'),to_date('07/25/2018 13:38:09','MM/DD/YYYY HH24:MI:SS'),4023,4523,'Liability insurance',5431225125,'WYF8231');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (468923673,to_date('11/16/2016 15:19:36','MM/DD/YYYY HH24:MI:SS'),to_date('03/10/2017 10:06:45','MM/DD/YYYY HH24:MI:SS'),3000,3800,'Personal injury protection insurance',1092615453,'VZA2517');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (177663452,to_date('10/05/2016 18:59:35','MM/DD/YYYY HH24:MI:SS'),to_date('01/13/2017 18:11:12','MM/DD/YYYY HH24:MI:SS'),8312,9312,'Personal injury protection insurance',1092615453,'VUR8143');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (776842375,to_date('02/18/2015 16:38:19','MM/DD/YYYY HH24:MI:SS'),to_date('05/21/2015 06:58:59','MM/DD/YYYY HH24:MI:SS'),5291,6311,'Collision insurance',3342342521,'ZXP3330');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (145435784,to_date('08/04/2017 19:38:57','MM/DD/YYYY HH24:MI:SS'),to_date('11/11/2017 11:36:05','MM/DD/YYYY HH24:MI:SS'),1183,1489,'Collision insurance',4568323734,'JHH7857');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (114567845,to_date('11/10/2015 19:52:16','MM/DD/YYYY HH24:MI:SS'),to_date('02/22/2016 13:11:14','MM/DD/YYYY HH24:MI:SS'),4921,5005,'Collision insurance',5765567583,'IUA2298');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (169987057,to_date('01/16/2018 18:04:25','MM/DD/YYYY HH24:MI:SS'),to_date('05/02/2018 22:48:04','MM/DD/YYYY HH24:MI:SS'),5000,5529,'Personal injury protection insurance',6657435424,'JGW2269');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (182389054,to_date('04/05/2017 10:31:23','MM/DD/YYYY HH24:MI:SS'),to_date('07/08/2017 22:04:39','MM/DD/YYYY HH24:MI:SS'),6631,6804,'Personal injury protection insurance',6657435424,'PHF4089');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (256324576,to_date('06/15/2016 09:10:14','MM/DD/YYYY HH24:MI:SS'),to_date('09/08/2016 22:11:55','MM/DD/YYYY HH24:MI:SS'),3981,4099,'Collision insurance',8765474265,'LHK6850');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (224562678,to_date('03/09/2018 18:50:16','MM/DD/YYYY HH24:MI:SS'),to_date('05/19/2018 17:37:45','MM/DD/YYYY HH24:MI:SS'),3081,3221,'Gap Insurance',9654423553,'ZVN2758');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (576345243,to_date('09/19/2017 22:59:44','MM/DD/YYYY HH24:MI:SS'),to_date('01/03/2018 09:50:45','MM/DD/YYYY HH24:MI:SS'),6812,7001,'Gap Insurance',9654423553,'LGV5764');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (687934144,to_date('07/16/2016 21:51:10','MM/DD/YYYY HH24:MI:SS'),to_date('10/08/2016 08:06:04','MM/DD/YYYY HH24:MI:SS'),4122,4299,'Collision insurance',3342342521,'LHK6850');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (367354871,to_date('11/12/2016 16:09:06','MM/DD/YYYY HH24:MI:SS'),to_date('01/28/2017 06:37:43','MM/DD/YYYY HH24:MI:SS'),4311,4331,'Collision insurance',8765474265,'LHK6850');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (132432143,to_date('01/11/2017 10:43:56','MM/DD/YYYY HH24:MI:SS'),to_date('04/28/2017 09:29:23','MM/DD/YYYY HH24:MI:SS'),6012,6191,'Collision insurance',5765567583,'LMT7148');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (196453526,to_date('05/13/2017 17:02:19','MM/DD/YYYY HH24:MI:SS'),to_date('08/01/2017 08:09:20','MM/DD/YYYY HH24:MI:SS'),6112,6231,'Gap Insurance',9654423553,'LMT7148');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (298346486,to_date('05/20/2016 14:55:19','MM/DD/YYYY HH24:MI:SS'),to_date('08/21/2016 17:44:04','MM/DD/YYYY HH24:MI:SS'),7101,7211,'Collision insurance',2345436214,'ZXP3330');
INSERT INTO RAGREEMENT (RENTALNO,STARTDATE,RETURNDATE,MILEAGEBEFORE,MILEAGEAFTER,INSURANCETYPE,CLIENTNO,LICENSENO) VALUES (317987234,to_date('10/23/2016 14:32:28','MM/DD/YYYY HH24:MI:SS'),to_date('01/11/2017 12:15:22','MM/DD/YYYY HH24:MI:SS'),7305,7389,'Personal injury protection insurance',2345436214,'ZXP3330');

INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (1407197472,to_date('03/25/2018 22:50:30','MM/DD/YYYY HH24:MI:SS'),'A/C Not Working',559,'A543527',9036892903);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (1609115110,to_date('07/11/2019 08:20:08','MM/DD/YYYY HH24:MI:SS'),'excessive oil consumption',362,'EPK6669',3157445115);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (2662355246,to_date('07/25/2019 10:57:08','MM/DD/YYYY HH24:MI:SS'),'engine stalls/shuts off while driving',559,'6TRJ244',8809065717);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (3163038296,to_date('08/01/2019 09:47:50','MM/DD/YYYY HH24:MI:SS'),'rear end slides easily',505,'WYF8231',5696741198);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (3282623590,to_date('12/09/2018 20:33:31','MM/DD/YYYY HH24:MI:SS'),'shudder, vibration',559,'6GDG486',1931823579);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (4082415089,to_date('06/25/2019 20:01:03','MM/DD/YYYY HH24:MI:SS'),'hard shifting',20,'EPK6669',736473964);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (4148179892,to_date('04/28/2019 15:14:14','MM/DD/YYYY HH24:MI:SS'),'fuel in oil with overfilled oil level, gas smell in cabin',20,'A193958',6928262987);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (6399396312,to_date('06/29/2016 20:21:50','MM/DD/YYYY HH24:MI:SS'),'daytime running led light failure',786,'9CA300',4611047496);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (6538214296,to_date('12/16/2017 18:34:04','MM/DD/YYYY HH24:MI:SS'),'paint peeling',362,'WYF8231',6331078473);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (7344158384,to_date('07/22/2019 10:58:42','MM/DD/YYYY HH24:MI:SS'),'daytime led lights burning out',362,'742982',8200523568);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (9520964913,to_date('05/14/2018 14:02:29','MM/DD/YYYY HH24:MI:SS'),'A/C stopped working',786,'34538',1572515072);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (9958868184,to_date('11/16/2017 08:22:43','MM/DD/YYYY HH24:MI:SS'),'hesitates and lurches at slower speeds',863,'195SUQ',742666768);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (1467564245,to_date('03/10/2017 19:37:26','MM/DD/YYYY HH24:MI:SS'),'Right front door dent',2,'VZA2517',468923673);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (2546745235,to_date('01/03/2018 13:36:50','MM/DD/YYYY HH24:MI:SS'),'battery bad contact, could not start some time',9,'LGV5764',576345243);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (3564357432,to_date('09/08/2016 22:55:24','MM/DD/YYYY HH24:MI:SS'),'one headlight is broken down',2,'LHK6850',256324576);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (4658768655,to_date('10/08/2016 09:06:17','MM/DD/YYYY HH24:MI:SS'),'gas tank leak',9,'LHK6850',687934144);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (5576582465,to_date('05/21/2015 10:24:13','MM/DD/YYYY HH24:MI:SS'),'software errors with mileage display',2,'ZXP3330',776842375);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (6765472456,to_date('01/28/2017 13:40:31','MM/DD/YYYY HH24:MI:SS'),'door handle stucks',9,'LHK6850',367354871);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (7789934545,to_date('04/28/2017 19:17:31','MM/DD/YYYY HH24:MI:SS'),'sun visor fell out',5,'LMT7148',132432143);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (8879435665,to_date('08/01/2017 21:59:57','MM/DD/YYYY HH24:MI:SS'),'sun visor fell out',5,'LMT7148',196453526);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (9890780456,to_date('08/21/2016 18:06:55','MM/DD/YYYY HH24:MI:SS'),'door handle stucks',5,'ZXP3330',298346486);
INSERT INTO FAULTREPORT (REPORTNUM,DATECHECKED,COMMENTS,EMPNO,LICENSENO,RENTALNO) VALUES (1067867534,to_date('01/11/2017 20:45:11','MM/DD/YYYY HH24:MI:SS'),'door handle stucks',5,'ZXP3330',317987234);

commit;