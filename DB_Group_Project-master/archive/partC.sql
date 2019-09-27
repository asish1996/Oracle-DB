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

COLUMN "OUTLET INFO" FORMAT A30
SELECT (OutNo || ' in ' ||outlet.city||','|| outlet.state) AS "OUTLET INFO", 
	(CASE
	WHEN LOWER(WebAddress) LIKE '%.edu' THEN 'EDUCATION'
	WHEN LOWER(WebAddress) LIKE '%.gov' THEN 'GOVERNMENT AGENCY'
	WHEN LOWER(WebAddress) LIKE '%.org' THEN 'NON-FOR-PROFIT ORGANIZATION'
	WHEN LOWER(WebAddress) LIKE '%.com' THEN 'FOR-PROFIT COMPANY'
	WHEN WebAddress IS NULL THEN 'NOT AVAILABLE'
	ELSE 'PERSONAL'
	END) AS "CLIENT TYPE",
	AVG(MONTHS_BETWEEN(returndate,startdate)*30) AS "AVG_Duration", 
	SUM(CEIL(MONTHS_BETWEEN(returndate,startdate)*30)*DailyRate) AS "SUM_Revenue",
	AVG(DailyRate)
FROM ragreement JOIN vehicle USING (LicenseNo) JOIN outlet USING (outNo) JOIN client USING (clientNo)
GROUP BY CUBE ((OutNo || ' in ' ||outlet.city||','|| outlet.state), (CASE
	WHEN LOWER(WebAddress) LIKE '%.edu' THEN 'EDUCATION'
	WHEN LOWER(WebAddress) LIKE '%.gov' THEN 'GOVERNMENT AGENCY'
	WHEN LOWER(WebAddress) LIKE '%.org' THEN 'NON-FOR-PROFIT ORGANIZATION'
	WHEN LOWER(WebAddress) LIKE '%.com' THEN 'FOR-PROFIT COMPANY'
	WHEN WebAddress IS NULL THEN 'NOT AVAILABLE'
	ELSE 'PERSONAL'
	END))
ORDER BY 1,2;




