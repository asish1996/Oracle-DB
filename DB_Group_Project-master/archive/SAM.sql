-- Initialization
DROP TABLE EMPLOYEE     CASCADE CONSTRAINTS purge;
DROP TABLE FAULTREPORT  CASCADE CONSTRAINTS purge;
DROP TABLE OUTLET       CASCADE CONSTRAINTS purge;
DROP TABLE VEHICLE      CASCADE CONSTRAINTS purge;
DROP TABLE CLIENT       CASCADE CONSTRAINTS purge;
DROP TABLE RAGREEMENT   CASCADE CONSTRAINTS purge;
ALTER SESSION SET NLS_DATE_FORMAT= 'DD-MON-YY HH24:MI:SS';

-- Creating tables
CREATE TABLE EMPLOYEE
(EmpNo          NUMBER(5),
 Fname          VARCHAR2(20),
 Lname          VARCHAR2(20),
 Position       VARCHAR2(20),
 Phone          VARCHAR2(15),
 Email          VARCHAR2(30),
 DOB            DATE,
 Gender         CHAR(1),
 Salary         NUMBER(7),
 HireDate       DATE,
 OutNo          NUMBER(5),
 SupervisorNo   NUMBER(5),
 CONSTRAINT     EMPLOYEE_EmpNo_pk
                PRIMARY KEY (EmpNo),
 CONSTRAINT     EMPLOYEE_Gender_ck
                CHECK (Gender IN ('M', 'F')),
 CONSTRAINT     EMPLOYEE_Email_ck
                CHECK (Email LIKE '%@rentacar.com'));

CREATE TABLE OUTLET
(OutNo          NUMBER(5),
 Street         VARCHAR2(40),
 City           VARCHAR2(20),
 State          CHAR(2),
 ZipCode        CHAR(5),
 Phone          VARCHAR2(15),
 ManagerNo      NUMBER(5),
 CONSTRAINT     OUTLET_OutNo_pk
                PRIMARY KEY (OutNo));

CREATE TABLE FAULTREPORT
(ReportNum      NUMBER(5),
 DateChecked    DATE,
 Comments       VARCHAR2(100),
 EmpNo          NUMBER(5),
 LicenseNo      VARCHAR2(15),
 RentalNo       NUMBER(5),
 CONSTRAINT     FAULTREPORT_ReportNum_pk
                PRIMARY KEY (ReportNum));

CREATE TABLE VEHICLE
(LicenseNo          VARCHAR2(15),
 Make               VARCHAR2(30),
 Model              VARCHAR2(30),
 Color              CHAR(3),
 Year               NUMBER(4),
 NoDoors            NUMBER(1),
 Capacity           NUMBER(5,2),
 DailyRate          NUMBER(5,2),
 InspectionDate     DATE,
 outNo              NUMBER(5),
 CONSTRAINT         VEHICLE_LicenseNo_pk
                    PRIMARY KEY (LicenseNo));

CREATE TABLE CLIENT
(clientNo       NUMBER(5),
 ClientName     VARCHAR2(50),
 Street         VARCHAR2(40),
 City           VARCHAR2(20),
 State          CHAR(2),
 ZipCode        CHAR(5),
 WebAddress     VARCHAR2(100),
 Contact_FName  VARCHAR2(25),
 Contact_LName  VARCHAR2(25),
 Phone          VARCHAR2(15),
 Email          VARCHAR2(30),
 CONSTRAINT     CLIENT_clientNo_pk
                PRIMARY KEY (clientNo));

CREATE TABLE RAGREEMENT
(RentalNo       NUMBER(5),
 StartDate      DATE,
 ReturnDate     DATE,
 MileageBefore  NUMBER(5),
 MileageAfter   NUMBER(5),
 InsuranceType  VARCHAR2(15),
 ClientNo       NUMBER(5),
 LicenseNo      VARCHAR2(15),
 CONSTRAINT     RAGREEMENT_RentalNo_pk
                PRIMARY KEY (RentalNo),
 CONSTRAINT     RAGREEMENT_Start_Return_ck
                CHECK (StartDate <= ReturnDate),
 CONSTRAINT     RAGREEMENT_Mileage_ck
                CHECK (MileageBefore <= MileageAfter));

-- Foreign key constraints
ALTER TABLE EMPLOYEE
ADD CONSTRAINT EMPLOYEE_Supervisor_fk
FOREIGN KEY (SupervisorNo)
REFERENCES EMPLOYEE (EmpNo);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT EMPLOYEE_OutNo_fk
FOREIGN KEY (OutNo)
REFERENCES OUTLET (OutNo);

ALTER TABLE OUTLET
ADD CONSTRAINT OUTLET_ManagerNo_fk
FOREIGN KEY (ManagerNo)
REFERENCES EMPLOYEE (EmpNo);

ALTER TABLE FAULTREPORT
ADD CONSTRAINT FAULTREPORT_EmpNo_fk
FOREIGN KEY (EmpNo)
REFERENCES EMPLOYEE (EmpNo);

ALTER TABLE FAULTREPORT
ADD CONSTRAINT FAULTREPORT_LicenseNo_fk
FOREIGN KEY (LicenseNo)
REFERENCES VEHICLE (LicenseNo);

ALTER TABLE FAULTREPORT
ADD CONSTRAINT FAULTREPORT_RentalNo_fk
FOREIGN KEY (RentalNo)
REFERENCES RAGREEMENT (RentalNo);

ALTER TABLE VEHICLE
ADD CONSTRAINT VEHICLE_outNo_fk
FOREIGN KEY (outNo)
REFERENCES OUTLET (outNo);

ALTER TABLE RAGREEMENT
ADD CONSTRAINT RAGREEMENT_ClientNo_fk
FOREIGN KEY (ClientNo)
REFERENCES CLIENT (ClientNo);

ALTER TABLE RAGREEMENT
ADD CONSTRAINT RAGREEMENT_LicenseNo_fk
FOREIGN KEY (LicenseNo)
REFERENCES VEHICLE (LicenseNo);

-- Table EMPLOYEE
INSERT INTO EMPLOYEE VALUES (1001, 'Christiano', 'Ronaldo', 'Admin', '532-345-2443', 'cronaldo@rentacar.com', '09-MAY-85', 'M', 90000, '05-MAY-10', null, null);
INSERT INTO EMPLOYEE VALUES (1002, 'Karim', 'Benzema', 'Admin', '235-345-2555', 'kbenzema@rentacar.com', '02-Feb-95', 'M', 80000, '03-MAR-14', null, null);
INSERT INTO EMPLOYEE VALUES (1003, 'Christian', 'Bale', 'Admin', '412-345-9990', 'cbale@rentacar.com', '11-NOV-99', 'M', 85000, '02-JAN-12', null, null);
INSERT INTO EMPLOYEE VALUES (1004, 'Tierry', 'Henry', 'Admin', '342-245-0999', 'thenry@rentacar.com', '27-FEB-91', 'M', 78000, '09-SEP-15', null, null);
INSERT INTO EMPLOYEE VALUES (1005, 'Michael', 'Jordan', 'Sales', '812-327-2462', 'mjordan@rentacar.com', '01-JAN-80', 'M', 95000, '09-JUL-11', null, null);
INSERT INTO EMPLOYEE VALUES (1006, 'Dennis', 'Rodman', 'Sales', '831-234-2562', 'drodman@rentacar.com', '02-JUL-83', 'M', 90000, '24-FEB-13', null, null);
INSERT INTO EMPLOYEE VALUES (1007, 'Scotty', 'Pippen', 'Sales', '404-342-3449', 'spippen@rentacar.com', '29-NOV-81', 'M', 87000, '19-NOV-14', null, null);
INSERT INTO EMPLOYEE VALUES (1008, 'Shaq', 'Oneal', 'Sales', '804-147-4448', 'soneal@rentacar.com', '19-MAY-84', 'M', 85000, '22-FEB-15', null, null);
INSERT INTO EMPLOYEE VALUES (1009, 'Lionel', 'Messi', 'Mechanic', '737-701-1132', 'lmessi@rentacar.com', '07-MAR-81', 'M', 75000, '29-JAN-09', null, null);
INSERT INTO EMPLOYEE VALUES (1010, 'Luis', 'Suarez', 'Mechanic', '412-304-2234', 'lsuarez@rentacar.com', '15-OCT-92', 'M', 70000, '11-NOV-11', null, null);
INSERT INTO EMPLOYEE VALUES (1011, 'Neymar', 'Junior', 'Mechanic', '214-342-6664', 'njunior@rentacar.com', '12-FEB-89', 'M', 67000, '14-APR-15', null, null);
INSERT INTO EMPLOYEE VALUES (1012, 'Wayne', 'Rooney', 'Mechanic', '612-242-2246', 'wrooney@rentacar.com', '19-APR-85', 'M', 69000, '11-AUG-14', null, null);
INSERT INTO EMPLOYEE VALUES (1013, 'Lebron', 'James', 'Customer Service', '411-335-9447', 'ljames@rentacar.com', '09-DEC-82', 'M', 70000, '23-MAR-16', null, null);
INSERT INTO EMPLOYEE VALUES (1014, 'Dwayne', 'Wade', 'Customer Service', '239-135-9555', 'dwade@rentacar.com', '02-JUN-96', 'M', 60000, '02-JAN-19', null, null);
INSERT INTO EMPLOYEE VALUES (1015, 'Chris', 'Bosh', 'Customer Service', '124-348-1290', 'cbosh@rentacar.com', '11-SEP-93', 'M', 65000, '28-FEB-18', null, null);
INSERT INTO EMPLOYEE VALUES (1016, 'Jimmy', 'Butler', 'Customer Service', '721-831-9235', 'jbutler@rentacar.com', '31-DEC-97', 'M', 63000, '02-FEB-17', null, null);

-- Set Supervisors
UPDATE EMPLOYEE
SET SupervisorNo = 1001
WHERE EmpNo = ANY (1002,1003,1004);
UPDATE EMPLOYEE 
SET SupervisorNo = 1005
WHERE EmpNo = ANY (1006,1007,1008);
UPDATE EMPLOYEE
SET SupervisorNo = 1009
WHERE EmpNo = ANY (1010,1011,1012);
UPDATE EMPLOYEE
SET SupervisorNo = 1013
WHERE EmpNo = ANY (1014, 1015, 1016);

-- Table OUTLET
INSERT INTO OUTLET VALUES (30001, '4601 Bayard Street', 'Pittsburgh', 'PA', 15213, '412-999-3424', 1001);
INSERT INTO OUTLET VALUES (30002, '35 East Champ Street', 'Philadelphia', 'PA', 19019, '311-939-3424', 1013);
INSERT INTO OUTLET VALUES (30003, '91 South Bourbon Street', 'Morgantown', 'WV', 26501, '304-939-3424', 1002);
INSERT INTO OUTLET VALUES (30004, '12 Morgan Drive', 'Charleston', 'WV', 26444, '304-932-2524', 1014);
INSERT INTO OUTLET VALUES (30005, '2400 Waterview Pkwy', 'Dallas', 'TX', 75080, '214-911-9253', 1003);
INSERT INTO OUTLET VALUES (30006, '5217 Old Spicespring Street', 'Austin', 'TX', 78731, '512-111-8253', 1015);
INSERT INTO OUTLET VALUES (30007, '19 West Palm Street', 'Miami', 'FL', 33101, '786-119-5354', 1004);
INSERT INTO OUTLET VALUES (30008, '104 Disney Street', 'Orlando', 'FL', 32789, '407-221-3299', 1016);

-- Set outlet employees
UPDATE EMPLOYEE
SET OutNo = 30001
WHERE EmpNo = ANY (1001, 1005, 1009);
UPDATE EMPLOYEE
SET OutNo = 30002
WHERE EmpNo = ANY (1013);
UPDATE EMPLOYEE
SET OutNo = 30003
WHERE EmpNo = ANY (1002, 1006, 1010);
UPDATE EMPLOYEE
SET OutNo = 30004
WHERE EmpNo = ANY (1014);
UPDATE EMPLOYEE
SET OutNo = 30005
WHERE EmpNo = ANY (1003, 1007, 1011);
UPDATE EMPLOYEE
SET OutNo = 30006
WHERE EmpNo = ANY (1015);
UPDATE EMPLOYEE
SET OutNo = 30007
WHERE EmpNo = ANY (1004, 1008, 1012);
UPDATE EMPLOYEE
SET OutNo = 30008
WHERE EmpNo = ANY (1016);

-- Table CLIENT
INSERT INTO CLIENT VALUES
(10000, 'Calleigh Whitney', '890 Poco Mas Drive', 'Morrisville', 'PA', '19067', 'http://bubble.example.org/', 'Calleigh', 'Whitney', '332-861-3029', 'yruan@msn.com');
INSERT INTO CLIENT VALUES
(10001, 'Lexa Toller', '7626 Henry Smith Drive ', 'Glenside', 'PA', '19038', 'https://example.com/bag/', 'Lexa', 'Toller', '483-543-1160', 'drezet@sbcglobal.net');
INSERT INTO CLIENT VALUES
(10002, 'Andrea Robinson', '71 Arch St. ', 'Gibsonia', 'PA', '15044', 'http://www.example.com/', 'Andrea', 'Robinson', '745-559-6934', 'cyrus@optonline.net');
INSERT INTO CLIENT VALUES
(10003, 'Georgiana Ledford', '4060 Columbia Mine Road', 'Morgantown', 'WV', '26505', 'https://boot.example.com/', 'Georgiana', 'Ledford', '874-356-5185', 'preneel@live.com');
INSERT INTO CLIENT VALUES
(10004, 'Barbara Paternoster', '599 Jackson Dr. ', 'Clarksburg', 'WV', '26301', 'https://example.edu/#brass', 'Barbara', 'Paternoster', '981-224-4522', 'andrei@me.com');
INSERT INTO CLIENT VALUES
(10005, 'Lawrence Holland', '752 Fulton Street', 'Morgantown', 'WV', '26505', 'http://arm.example.com/', 'Lawrence', 'Holland', '421-628-6048', 'bwcarty@hotmail.com');
INSERT INTO CLIENT VALUES
(10006, 'Donnie Osborne', '206 Crescent Drive', 'Dallas', 'TX', '75219', 'http://example.org/', 'Donnie', 'Osborne', '555-963-0271', 'psichel@att.net');
INSERT INTO CLIENT VALUES
(10007, 'Bunny Clarkson', '2846 Romines Mill Road', 'Dallas', 'TX', '75247', 'https://www.example.org/army', 'Bunny', 'Clarkson', '610-493-5960', 'njpayne@gmail.com');
INSERT INTO CLIENT VALUES
(10008, 'Cherie Bronson', '2774 Tyler Avenue', 'Beach', 'FL', '33001', 'http://example.com/babies/act', 'Cherie', 'Bronson', '217-341-5710', 'dowdy@aol.com');
INSERT INTO CLIENT VALUES
(10009, 'Poppy Lyon', '7846 Gregory Drive ', 'Miami', 'FL', '33012', null, 'Poppy', 'Lyon', '369-952-8762', 'nimaclea@icloud.com');

-- Table VEHICLE
INSERT INTO VEHICLE VALUES
('PFG-3739', 'Chevrolet', 'Camaro', 'BLA', 2015, 2, 5.0, 102.93, '01-Jan-19', 30001);
INSERT INTO VEHICLE VALUES
('URE-4779', 'Chevrolet', 'Cruze', 'BLU', 2015, 4, 4.2, 166.70, '02-Jan-19', 30003);
INSERT INTO VEHICLE VALUES
('XJG-2795', 'Chevrolet', 'Cruze', 'BLU', 2015, 4, 4.2, 166.70, '03-Jan-19', 30005);
INSERT INTO VEHICLE VALUES
('TDG-1224', 'Chevrolet', 'Cruze', 'BLU', 2015, 4, 4.2, 166.70, '04-Jan-19', 30007);
INSERT INTO VEHICLE VALUES
('XZA-5887', 'Chevrolet', 'Spark', 'SIL', 2015, 4, 2.4, 158.12, '05-Jan-19', 30008);
INSERT INTO VEHICLE VALUES
('UEX-6169', 'Jeep', 'Patriot', 'GOL', 2015, 4, 3.7, 147.08, '06-Jan-19', 30001);
INSERT INTO VEHICLE VALUES
('VNH-9208', 'Jeep', 'Wrangler', 'NAV', 2015, 2, 5.0, 120.51, '07-Jan-19', 30003);
INSERT INTO VEHICLE VALUES
('VUF-4106', 'Jeep', 'Wrangler', 'NAV', 2015, 2, 5.0, 120.51, '08-Jan-19', 30005);
INSERT INTO VEHICLE VALUES
('KHA-9880', 'Jeep', 'Patriot', 'GOL', 2015, 4, 3.7, 147.08, '09-Jan-19', 30007);
INSERT INTO VEHICLE VALUES
('XND-4169', 'Nissan', 'Frontier', 'SIL', 2014, 4, 21.1, 150.41, '10-Jan-19', 30002);
INSERT INTO VEHICLE VALUES
('LRG-9924', 'Nissan', 'Leaf', 'WHI', 2015, 4, null, 185.57, '11-Jan-19', 30004);
INSERT INTO VEHICLE VALUES
('PXB-8120', 'Nissan', 'Frontier', 'SIL', 2014, 4, 21.1, 150.41, '12-Jan-19', 30006);

-- Table RAGREEMENT
INSERT INTO RAGREEMENT VALUES
(90000, '1-Jun-19 15:21:28', '6-Jun-19 06:34:58', 5126, 5147, 'Liability', 10005, 'XZA-5887');
INSERT INTO RAGREEMENT VALUES
(90001, '1-Jun-19 21:19:51', '5-Jun-19 08:17:42', 44013, 44088, 'Liability', 10009, 'LRG-9924');
INSERT INTO RAGREEMENT VALUES
(90002, '1-Jun-19 21:32:04', '2-Jun-19 11:10:58', 25369, 25444, 'Liability', 10003, 'XJG-2795');
INSERT INTO RAGREEMENT VALUES
(90003, '2-Jun-19 11:57:36', '8-Jun-19 13:42:19', 62929, 62940, 'Liability', 10008, 'XND-4169');
INSERT INTO RAGREEMENT VALUES
(90004, '2-Jun-19 14:16:20', '9-Jun-19 08:32:16', 22958, 23012, 'Liability', 10002, 'URE-4779');
INSERT INTO RAGREEMENT VALUES
(90005, '2-Jun-19 16:22:14', '6-Jun-19 09:33:40', 40682, 40771, 'Liability', 10007, 'VNH-9208');
INSERT INTO RAGREEMENT VALUES
(90006, '3-Jun-19 12:16:16', '8-Jun-19 18:07:24', 39335, 39367, 'Liability', 10004, 'TDG-1224');
INSERT INTO RAGREEMENT VALUES
(90007, '4-Jun-19 09:59:50', '11-Jun-19 15:17:11', 25444, 25502, 'Liability', 10001, 'XJG-2795');
INSERT INTO RAGREEMENT VALUES
(90008, '5-Jun-19 16:13:00', '7-Jun-19 11:10:37', 10334, 10360, 'Liability', 10006, 'KHA-9880');
INSERT INTO RAGREEMENT VALUES
(90009, '8-Jun-19 12:22:07', '18-Jun-19 18:02:06', 45462, 45524, 'Liability', 10007, 'VUF-4106');
INSERT INTO RAGREEMENT VALUES
(90010, '8-Jun-19 18:35:16', '9-Jun-19 18:58:13', 10360, 10415, 'Liability', 10006, 'KHA-9880');
INSERT INTO RAGREEMENT VALUES
(90011, '9-Jun-19 17:55:12', '13-Jun-19 18:10:44', 68317, 68360, 'Liability', 10004, 'UEX-6169');
INSERT INTO RAGREEMENT VALUES
(90012, '9-Jun-19 20:20:52', '11-Jun-19 07:28:22', 5147, 5201, 'Liability', 10005, 'XZA-5887');
INSERT INTO RAGREEMENT VALUES
(90013, '10-Jun-19 10:13:23', '12-Jun-19 12:38:57', 44088, 44111, 'Liability', 10008, 'LRG-9924');
INSERT INTO RAGREEMENT VALUES
(90014, '11-Jun-19 19:54:13', '15-Jun-19 20:38:19', 23012, 23034, 'Liability', 10001, 'URE-4779');
INSERT INTO RAGREEMENT VALUES
(90015, '13-Jun-19 21:18:55', '14-Jun-19 12:17:30', 5201, 5287, 'Liability', 10004, 'XZA-5887');
INSERT INTO RAGREEMENT VALUES
(90016, '14-Jun-19 19:02:37', '17-Jun-19 17:07:36', 10415, 10502, 'Liability', 10006, 'KHA-9880');
INSERT INTO RAGREEMENT VALUES
(90017, '15-Jun-19 08:36:01', '16-Jun-19 14:50:54', 44111, 44145, 'Liability', 10009, 'LRG-9924');
INSERT INTO RAGREEMENT VALUES
(90018, '15-Jun-19 13:06:53', '24-Jun-19 06:32:33', 61838, 61862, 'Liability', 10008, 'PXB-8120');
INSERT INTO RAGREEMENT VALUES
(90019, '18-Jun-19 21:06:30', '28-Jun-19 14:19:15', 23034, 23060, 'Liability', 10002, 'URE-4779');
INSERT INTO RAGREEMENT VALUES
(90020, '25-Jun-19 16:25:22', '28-Jun-19 22:19:07', 39367, 39397, 'Liability', 10004, 'TDG-1224');

-- Table FAULTREPORT
INSERT INTO FAULTREPORT VALUES (40001, '2-Jun-19 13:35:30', 'Bumper is missing', 1011, 'XJG-2795', 90002);
INSERT INTO FAULTREPORT VALUES (40002, '6-Jun-19 12:30:01', 'Engine not working', 1010, 'VNH-9208', 90005);
INSERT INTO FAULTREPORT VALUES (40003, '7-Jun-19 14:12:50', 'A/C not working', 1012, 'KHA-9880', 90008);
INSERT INTO FAULTREPORT VALUES (40004, '9-Jun-19 09:31:59', 'Navigation not working', 1010, 'URE-4779', 90004); 
INSERT INTO FAULTREPORT VALUES (40005, '9-Jun-19 20:10:24', 'A/C not working', 1012, 'KHA-9880', 90010);      
INSERT INTO FAULTREPORT VALUES (40006, '15-Jun-19 21:30:44', 'Navigation not working', 1010, 'URE-4779', 90014);
INSERT INTO FAULTREPORT VALUES (40007, '28-Jun-19 17:20:08', 'Driver Seat Belt is broken', 1010, 'URE-4779', 90019);

-- 1
SELECT ClientNo, ClientName, RentalNo,
       CEIL(24 * (ReturnDate - StartDate)) Duration,
       TO_CHAR((DailyRate * (CEIL(ReturnDate - StartDate))), '$9990.99') Cost
FROM CLIENT NATURAL JOIN RAGREEMENT
            NATURAL JOIN VEHICLE
WHERE State = 'PA'
ORDER BY ClientName;

-- 2
SELECT EmpNo, FName, Lname, COUNT(ReportNum) NumFaults
FROM EMPLOYEE LEFT OUTER JOIN FAULTREPORT USING (EmpNo)
GROUP BY (EmpNo, FName, Lname)
ORDER BY 4 DESC;

-- 3
SELECT OutNo,
       NVL(AVG(24 * (DateChecked - ReturnDate)), 0) AvgDelay
FROM FAULTREPORT NATURAL JOIN VEHICLE
                 JOIN RAGREEMENT USING (RentalNo)
                 RIGHT OUTER JOIN OUTLET USING (OutNo)
GROUP BY OutNo
ORDER BY OutNo;

SELECT OutNo,AVG((DateChecked-ReturnDate)*24)
FROM FAULTREPORT NATURAL JOIN VEHICLE
                 JOIN RAGREEMENT USING (RentalNo)
                 RIGHT OUTER JOIN OUTLET USING (OutNo)
GROUP BY OutNo;

-- 4
SELECT clientNo, ClientName, Contact_FName, Contact_LName, Phone, Email
FROM CLIENT NATURAL JOIN RAGREEMENT
MINUS
SELECT clientNo, ClientName, Contact_FName, Contact_LName, Phone, Email
FROM CLIENT NATURAL JOIN RAGREEMENT
            JOIN FAULTREPORT USING (RentalNo);

-- 5
SELECT OutNo, Agreements, Revenue
FROM (SELECT OutNo, COUNT(RentalNo) Agreements,
      TO_CHAR(NVL(SUM(DailyRate * (CEIL(ReturnDate - StartDate))), 0), '$999990.99') Revenue,
      RANK() OVER (ORDER BY NVL(SUM(DailyRate * (CEIL(ReturnDate - StartDate))), 0) DESC) Rank
      FROM VEHICLE NATURAL JOIN RAGREEMENT
                   RIGHT OUTER JOIN OUTLET USING (outNo)
      GROUP BY OutNo)
WHERE Rank <= 2;

-- 6
SELECT RentalNo, StartDate, ReturnDate, clientNo, ClientName, OutStreet
FROM (SELECT outNo, Street OutStreet, COUNT(RentalNo) RentalCount,
             RANK() OVER (ORDER BY COUNT(RentalNo) DESC) Rank
      FROM OUTLET NATURAL JOIN VEHICLE NATURAL JOIN RAGREEMENT
      GROUP BY outNo, Street) NATURAL JOIN VEHICLE
                              NATURAL JOIN RAGREEMENT
                              NATURAL JOIN CLIENT
WHERE Rank = 1;

-- 7
SELECT ClientNo, ClientName, COUNT(RentalNo) Rentals,
       CEIL(NVL(AVG(24*(ReturnDate - StartDate)), 0)) AvgHours,
       COUNT(ReportNum) NumReports
FROM FAULTREPORT RIGHT OUTER JOIN RAGREEMENT USING (RentalNo)
                 NATURAL JOIN CLIENT
WHERE State = 'WV'
GROUP BY ClientNo, ClientName;

-- 8
SELECT outNo, Make, COUNT(DISTINCT RAGREEMENT.RentalNo) Rentals,
       COUNT(DISTINCT ReportNum) Faults
FROM OUTLET NATURAL JOIN VEHICLE
            LEFT OUTER JOIN FAULTREPORT USING (LicenseNo)
            LEFT OUTER JOIN RAGREEMENT USING (LicenseNo)
GROUP BY (outNo, Make)
ORDER BY 1, 2;

-- 9
SELECT RentalNo, ReportNum, DateChecked, Comments,
       FName || ' ' || LName Name, Make, Model, Color, YearS
FROM EMPLOYEE NATURAL JOIN FAULTREPORT
              NATURAL JOIN VEHICLE
              JOIN RAGREEMENT USING (RentalNo)
WHERE TO_CHAR(ReturnDate, 'MMYYYY') = TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'MMYYYY');

-- 10
SELECT OUTLETA.ManagerNo, EMPLOYEEA.FName, EMPLOYEEA.LName,
       COUNT(DISTINCT OUTLETB.outNo) NumOutlets,
       COUNT(DISTINCT EMPLOYEEB.EmpNo) NumEmployees,
       COUNT(DISTINCT LicenseNo) NumVehicles
FROM OUTLET OUTLETA JOIN EMPLOYEE EMPLOYEEA ON (OUTLETA.ManagerNo = EMPLOYEEA.EmpNo),
     OUTLET OUTLETB, EMPLOYEE EMPLOYEEB, VEHICLE
WHERE OUTLETB.ManagerNo = OUTLETA.ManagerNo AND
      EMPLOYEEB.OutNo = OUTLETB.outNo AND
      VEHICLE.outNo = OUTLETB.outNo
GROUP BY OUTLETA.ManagerNo, EMPLOYEEA.FName, EMPLOYEEA.LName;

-- 11
SELECT Period,
       SUM(DECODE(MOD(R, 2), 0, 1, 0)) NumStart,
       SUM(DECODE(MOD(R, 2), 1, 1, 0)) NumReturn,
       COUNT(*) Total,
       TO_CHAR(100 * COUNT(*) / SUM(COUNT(*)) OVER(), '990.99') || '%' Percentage
FROM (SELECT (CASE WHEN MOD(R, 2) = 0 AND TO_CHAR(StartDate, 'HH24') < '12' THEN 'Morning'
                   WHEN MOD(R, 2) = 0 AND TO_CHAR(StartDate, 'HH24') >= '12' AND TO_CHAR(StartDate, 'HH24') < '18' THEN 'Afternoon'
                   WHEN MOD(R, 2) = 0 AND TO_CHAR(StartDate, 'HH24') >= '18' THEN 'Evening'
                   WHEN MOD(R, 2) = 1 AND TO_CHAR(ReturnDate, 'HH24') < '12' THEN 'Morning'
                   WHEN MOD(R, 2) = 1 AND TO_CHAR(ReturnDate, 'HH24') >= '12' AND TO_CHAR(ReturnDate, 'HH24') < '18' THEN 'Afternoon'
                   WHEN MOD(R, 2) = 1 AND TO_CHAR(ReturnDate, 'HH24') >= '18' THEN 'Evening' END) Period, R
      FROM (SELECT RentalNo, StartDate, ReturnDate, 1 R
            FROM RAGREEMENT
            UNION ALL
            SELECT RentalNo, StartDate, ReturnDate, 0
            FROM RAGREEMENT
            ORDER BY RentalNo))
GROUP BY Period;

-- 12
SELECT A.Type, COUNT(clientNo) Count
FROM (SELECT DECODE(LEVEL, 1, 'Educational Institution',
                           2, 'Government Agency',
                           3, 'Non-for-profit Organization',
                           4, 'For-profit Company',
                           5, 'Not Available') Type
      FROM DUAL
      CONNECT BY LEVEL <= 5) A
     LEFT OUTER JOIN
     (SELECT (CASE WHEN WebAddress LIKE '%.edu%' THEN 'Educational Institution'
                   WHEN WebAddress LIKE '%.gov%' THEN 'Government Agency'
                   WHEN WebAddress LIKE '%.org%' THEN 'Non-for-profit Organization'
                   WHEN WebAddress LIKE '%.com%' THEN 'For-profit Company'
                   WHEN WebAddress IS NULL THEN 'Not Available' END) Type, clientNo
      FROM CLIENT) B
     ON (A.Type = B.Type)
GROUP BY A.Type;