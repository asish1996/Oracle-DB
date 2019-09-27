SET ECHO ON
SET LINESIZE 200
SET PAGESIZE 200
spool C:\\DBM\\HW3\\queryC.txt
COLUMN "OUTLET INFO" FORMAT A27
COLUMN "CLIENT TYPE" FORMAT A36

SELECT (OutNo || ' in ' ||outlet.city||', '|| outlet.state) AS "OUTLET INFO", 
	(CASE
	WHEN LOWER(WebAddress) LIKE '%.edu' THEN 'EDUCATION'
	WHEN LOWER(WebAddress) LIKE '%.gov' THEN 'GOVERNMENT AGENCY'
	WHEN LOWER(WebAddress) LIKE '%.org' THEN 'NON-FOR-PROFIT ORGANIZATION'
	WHEN LOWER(WebAddress) LIKE '%.com' THEN 'FOR-PROFIT COMPANY'
	WHEN WebAddress IS NULL THEN 'NOT AVAILABLE'
	ELSE 'PERSONAL'
	END) AS "CLIENT TYPE",
	TO_CHAR(AVG(MONTHS_BETWEEN(returndate,startdate)*30), '9990.99') AS "AVG_Duration", 
	TO_CHAR(SUM(CEIL(MONTHS_BETWEEN(returndate,startdate)*30)*DailyRate), '$999990') AS "SUM_Revenue",
	TO_CHAR(AVG(DailyRate), '$990.99') AS "AVG(DailyRate)"
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
spool off