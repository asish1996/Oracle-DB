INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(476412,'Tator Patch Road','Burr Ridge','IL',60527,3129403653);
INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(926360,'Mulberry Avenue','Little Rock','AR',72211,5012991518);
INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(942762,'Harry Place','Charlotte','NC',28202,7047656154);
INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(677386,'Oakmound Drive','Chicago','IL',60631,7733668128);
INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(386703,'Garfield Road','Macomb','IL',61455,3097050728);
INSERT INTO OUTLET(outNo, Street,City,State,ZipCode,Phone)
VALUES(939863,'Edwards Street','Rocky Mount','NC',27801,2527247932);

INSERT INTO CLIENT
VALUES(4532016128,'Chiwetel Ejiofor','Murray Avenue','Pittsburgh','PA',15213,'www.alex.org','Rohit','Sharma',1234567891,'r.sharma@abc.com');
INSERT INTO CLIENT
VALUES (3455200757,'John Oliver','Get lost avenue','Boston','MA',16215,'www.kane.gov','Virat','Kohli',2345678912,'v.kohli@abc.com');
INSERT INTO CLIENT
VALUES(1599434496,'James Earl Jones','Go to hell avenue','San Francisco','CA',17215,'www.stokes.com','Adam','Zampa',3456789123,'a.zampa@abc.com');
INSERT INTO CLIENT
VALUES(9878511883,'Alfre Woodard','Never Mind street','Greater Huntington','WV',18215,'www.alex.edu','Lionel','Messi',4567891234,'l.messi@abc.com');
INSERT INTO CLIENT
VALUES(5580424655,'Eric André','Senseless avenue','Greater Huntington','WV',19215,'www.russel.in','Virat','Kohli',2345678912,'v.kohli@abc.com');
INSERT INTO CLIENT
VALUES(6977879690,'Beyoncé','Careful street','Atlanta','GA',19216,'www.gayle.net','Trent','Boult',6789123456,'t.boult@xyz.com');
INSERT INTO CLIENT
VALUES(2998787484,'Christian Bale','Murray Avenue','Pittsburgh','PA',15213,'www.sam.edu','Andrew','Carnegie',7891234567,'a.carnegie@cmu.edu');
INSERT INTO CLIENT
VALUES(1530375421,'Thanos','Jungle street','Chicago','IL',13213,'www.thanos.com','Andrew','Carnegie',7891234567,'a.carnegie@cmu.edu');
INSERT INTO CLIENT
VALUES(1036438432,'Tony','Iron Man avenue','Chicago','IL',13214,'www.tony.org','Bill','Gates',9123456789,'b.gates@microsoft.com');
INSERT INTO CLIENT
VALUES(2915486715,'Stokes','Cricket street','New York City','NY',14218,'www.stokes.org','Mark','Zuckerberg',1472583694,'mark1@facebook.com');
INSERT INTO CLIENT
VALUES(5431225125,'Cillian Murphy','Downton abbey','Philadelphia','PA',12532,'','Chin','Han',3242626534,'cmurphy@gmail.com');
INSERT INTO CLIENT
VALUES(3490125515,'Jill Stuart','Fifth avenue','Greater Huntington','WV',35235,'','Ivy','Chen',4122095545,'jills@gmail.com');

INSERT INTO EMPLOYEE
VALUES(00285,'Martha','Jones','General Manager',4195717055,'mjones@car_rental.com','18-Jun-1986','F',100000,'12-Oct-2009','386703',NULL);
INSERT INTO EMPLOYEE
VALUES(00193,'Brian','Smith','Operations Manager',5104429270,'bsmith@car_rental.com','29-Jun-1985','M',78000,'20-Dec-2013','677386',00285);
INSERT INTO EMPLOYEE
VALUES(00056,'Delbert','Quintero','Operations Manager',7323615593,'dquintero@car_rental.com','7-Jul-1980','M',85000,'24-Jan-2012','476412',00285);
INSERT INTO EMPLOYEE
VALUES(01939,'Kelly','Jackson','Office Manager',7082005099,'kjackson@car_rental.com','1-Nov-1984','F',98000,'7-Mar-2012','476412',00285);
INSERT INTO EMPLOYEE
VALUES(06834,'Hillary','Dennis','Office Manager',5016581818,'hdennis@car_rental.com','29-Aug-1982','F',98000,'19-Jun-2014','926360',00285);
INSERT INTO EMPLOYEE
VALUES(00341,'Kevin','Mares','Office Manager',7045126712,'kmares@car_rental.com','11-Jun-1973','M',93000,'13-Aug-2015','942762',00285);
INSERT INTO EMPLOYEE
VALUES(00559,'Isaias','Gatson','Rental Agent',2482011215,'igatson@car_rental.com','26-Jan-1984','M',80000,'13-Feb-2012','942762',00056);
INSERT INTO EMPLOYEE
VALUES(00786,'Robert','Meinhardt','Rental Agent',8484664566,'rmeinhardt@car_rental.com','21-Jul-1983','M',72000,'15-Jul-2016','677386',00056);
INSERT INTO EMPLOYEE
VALUES(00020,'Michele','Marcum','Customer Service',3054137501,'mmarcum@car_rental.com','2-Feb-1992','F',52000,'5-Aug-2016','386703',00193);
INSERT INTO EMPLOYEE
VALUES(00863,'Carl','Landwehr','Customer Service',4074153207,'clandwehr@car_rental.com','20-Aug-1970','M',67000,'30-Sep-2016','386703',00193);
INSERT INTO EMPLOYEE
VALUES(00362,'Wallace ','Fernandes','First-Line Supervisor',863-268-7856,'wfernandes@car_rental.com','15-May-1982','M',80000,'13-May-2017','939863',00193);
INSERT INTO EMPLOYEE
VALUES(00362,'Wallace ','Fernandes','Supervisor',8632687856,'wfernandes@car_rental.com','15-May-1982','M',80000,'13-May-2017','939863',00193);
INSERT INTO EMPLOYEE
VALUES(00263,'Stephen ','Bentley','Car Washer',4600359839,'sbentley@car_rental.com','16-Jan-1981','M',47000,'24-Mar-2018','939863',00362);
INSERT INTO EMPLOYEE
VALUES(00505,'Georgia','Murray','Rental Agent',4102951574,'gmurray@car_rental.com','19-May-1976','F',56000,'18-Jun-2018','386703',00056);


UPDATE Outlet 
SET  ManagerNo=01939
WHERE outNo=476412;

UPDATE Outlet 
SET  ManagerNo=06834
WHERE outNo=926360;

UPDATE Outlet 
SET  ManagerNo=00341
WHERE outNo=942762;

UPDATE Outlet 
SET  ManagerNo=01939
WHERE outNo=677386;

UPDATE Outlet 
SET  ManagerNo=01939
WHERE outNo=386703;

UPDATE Outlet 
SET  ManagerNo=00341
WHERE outNo=939863;


INSERT INTO VEHICLE
VALUES ('A543527','MERCEDES-BENZ','G500','Red',2012,4,5,120.23,'21-Aug-2015',476412);
INSERT INTO VEHICLE
VALUES ('9CA300','SUBARU','TRIBECA','White',2013,4,5,100.35,'1-Jan-2017',926360);
INSERT INTO VEHICLE
VALUES ('6GDG486','KIA','SPORTAGE','Blue',2014,2,2,143.36,'20-Jun-2018',476412);
INSERT INTO VEHICLE
VALUES ('034538','BMW','M6','Yellow',2015,5,7,100.35,'13-Jul-2018',386703);
INSERT INTO VEHICLE
VALUES ('A193958','BMW','X6','Red',2016,5,7,110.65,'9-Sep-2018',386703);
INSERT INTO VEHICLE
VALUES ('EPK6669','DODGE','GRAND CARAVAN','Blue',2017,4,5,170.36,'12-Feb-2019',926360);
INSERT INTO VEHICLE
VALUES ('WYF8231','CHEVROLET','W5500','Black',2018,4,5,120.23,'9-Apr-2019',939863);
INSERT INTO VEHICLE
VALUES ('6TRJ244','FORD','ESCAPE','Red',2013,4,5,143.36,'1-Jan-2017',476412);
INSERT INTO VEHICLE
VALUES ('195SUQ','CHEVROLET','EQUINOX','Black',2015,2,2,115.25,'13-Jul-2018',677386);
INSERT INTO VEHICLE
VALUES ('742982','AUDI','RS4','White',2017,5,7,120.23,'12-Mar-2019',942762);


INSERT INTO RAGREEMENT
VALUES (1572515072,TO_DATE('09/15/2017 6:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('03/04/2018 8:40:25', 'MM/DD/YYYY HH24:MI:SS'),6061,6413,'Personal injury protection insurance',9878511883,'034538');
INSERT INTO RAGREEMENT
VALUES(742666768,TO_DATE('06/21/2017 8:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('11/11/2017 3:40:25', 'MM/DD/YYYY HH24:MI:SS'),7204,7659,'Collision insurance',1036438432,'195SUQ');
INSERT INTO RAGREEMENT
VALUES(1931823579,TO_DATE('12/04/2017 12:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('12/07/2018 17:40:25', 'MM/DD/YYYY HH24:MI:SS'),8433,10013,'Collision insurance',1599434496,'6GDG486');
INSERT INTO RAGREEMENT
VALUES(8809065717,TO_DATE('07/02/2019 7:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('07/12/2019 18:40:25', 'MM/DD/YYYY HH24:MI:SS'),16396,23974,'Collision insurance',1530375421,'6TRJ244');
INSERT INTO RAGREEMENT
VALUES(5572767354,TO_DATE('06/30/2017 15:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('02/09/2019 19:40:25', 'MM/DD/YYYY HH24:MI:SS'),1306,1947,'Liability insurance',1599434496,'6TRJ244');
INSERT INTO RAGREEMENT
VALUES(8200523568,TO_DATE('05/24/2019 20:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('07/03/2019 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),3063,3751,'Personal injury protection insurance',2915486715,'742982');
INSERT INTO RAGREEMENT
VALUES(4611047496,TO_DATE('07/27/2015 14:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('06/23/2016 22:40:25', 'MM/DD/YYYY HH24:MI:SS'),1241,2977,'Gap Insurance',3455200757,'9CA300');
INSERT INTO RAGREEMENT
VALUES(6331078473,TO_DATE('09/26/2016 9:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('12/08/2017 17:40:25', 'MM/DD/YYYY HH24:MI:SS'),43524,46641,'Liability insurance',1530375421,'9CA300');
INSERT INTO RAGREEMENT
VALUES(6928262987,TO_DATE('08/25/2018 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('04/15/2019 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),2138,3234,'Liability insurance',5580424655,'A193958');
INSERT INTO RAGREEMENT
VALUES(9674433000,TO_DATE('07/22/2019 15:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('07/28/2019 7:40:25', 'MM/DD/YYYY HH24:MI:SS'),15496,32895,'Collision insurance',4532016128,'A193958');
INSERT INTO RAGREEMENT
VALUES(147757247,TO_DATE('06/11/2019 19:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('06/24/2019 8:40:25', 'MM/DD/YYYY HH24:MI:SS'),64275,99268,'Gap Insurance',6977879690,'A193958');
INSERT INTO RAGREEMENT
VALUES(9036892903,TO_DATE('04/02/2015 10:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('03/16/2018 7:40:25', 'MM/DD/YYYY HH24:MI:SS'),1610,1794,'Personal injury protection insurance',4532016128,'A543527');
INSERT INTO RAGREEMENT
VALUES(736473964,TO_DATE('12/01/2018 12:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('06/05/2019 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),9967,10863,'Gap Insurance',6977879690,'EPK6669');
INSERT INTO RAGREEMENT
VALUES(3157445115,TO_DATE('05/10/2019 22:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('06/20/2019 15:40:25', 'MM/DD/YYYY HH24:MI:SS'),4013,83109,'Gap Insurance',9878511883,'EPK6669');
INSERT INTO RAGREEMENT
VALUES(5696741198,TO_DATE('07/11/2017 20:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('05/29/2018 22:40:25', 'MM/DD/YYYY HH24:MI:SS'),3228,3293,'Liability insurance',2998787484,'WYF8231');
INSERT INTO RAGREEMENT
VALUES(2143214132,TO_DATE('07/01/2018 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),TO_DATE('07/25/2018 21:40:25', 'MM/DD/YYYY HH24:MI:SS'),4023,4523,'Liability insurance',5431225125,'WYF8231');



INSERT INTO FAULTREPORT
VALUES(1407197472,TO_DATE('03/25/2018 8:40:25', 'MM/DD/YYYY HH24:MI:SS'),'A/C Not Working',00559,'A543527',9036892903);
INSERT INTO FAULTREPORT
VALUES(1609115110,TO_DATE('7/11/2019 9:46:45', 'MM/DD/YYYY HH24:MI:SS'),'excessive oil consumption',00362,'EPK6669',3157445115);
INSERT INTO FAULTREPORT
VALUES(2662355246,TO_DATE('7/25/2019 9:46:14', 'MM/DD/YYYY HH24:MI:SS'),'engine stalls/shuts off while driving',00559,'6TRJ244',8809065717);
INSERT INTO FAULTREPORT
VALUES(3163038296,TO_DATE('6/23/2019 9:41:10', 'MM/DD/YYYY HH24:MI:SS'),'rear end slides easily',00505,'WYF8231',5696741198);
INSERT INTO FAULTREPORT
VALUES(3282623590,TO_DATE('12/9/2018 8:38:22', 'MM/DD/YYYY HH24:MI:SS'),'shudder, vibration',00559,'6GDG486',1931823579);
INSERT INTO FAULTREPORT
VALUES(4082415089,TO_DATE('6/25/2019 8:34:58', 'MM/DD/YYYY HH24:MI:SS'),'hard shifting',00020,'EPK6669',736473964);
INSERT INTO FAULTREPORT
VALUES(4148179892,TO_DATE('4/28/2019 8:40:45', 'MM/DD/YYYY HH24:MI:SS'),'fuel in oil with overfilled oil level, gas smell in cabin',00020,'A193958',6928262987);
INSERT INTO FAULTREPORT
VALUES(6399396312,TO_DATE('6/29/2016 9:55:46', 'MM/DD/YYYY HH24:MI:SS'),'daytime running led light failure',00786,'9CA300',4611047496);
INSERT INTO FAULTREPORT
VALUES(6538214296,TO_DATE('12/16/2017 8:45:54', 'MM/DD/YYYY HH24:MI:SS'),'paint peeling',00362,'WYF8231',6331078473);
INSERT INTO FAULTREPORT
VALUES(7344158384,TO_DATE('7/22/2019 8:51:57', 'MM/DD/YYYY HH24:MI:SS'),'daytime led lights burning out',00362,'742982',8200523568);
INSERT INTO FAULTREPORT
VALUES(9520964913,TO_DATE('5/14/2018 8:02:17', 'MM/DD/YYYY HH24:MI:SS'),'A/C stopped working',00786,'034538',1572515072);
INSERT INTO FAULTREPORT
VALUES(9958868184,TO_DATE('11/16/2017 8:40:32', 'MM/DD/YYYY HH24:MI:SS'),'hesitates and lurches at slower speeds',00863,'195SUQ',742666768);

--commit;