#BITRIX24

/*
USER ACTIVITY BY YEAR AND MONTH
*/
SELECT 
	YEAR(DATE_CREATE) AS year, 
	MONTH(DATE_CREATE) AS month, 
	COUNT(ID) as sum 
FROM b_im_message 
GROUP BY YEAR(DATE_CREATE), MONTH(DATE_CREATE);
/*
USER ACTIVITY BY HOUR
*/
SELECT 
	HOUR(DATE_CREATE) as hour, 
	COUNT(ID) AS  sum 
FROM b_im_message 
GROUP BY HOUR(DATE_CREATE) 
ORDER BY sum DESC;
/*
USER ACTIVITY BY YEAR AND MONTH AND NOTIFY MODULE
*/
SELECT 
	YEAR(DATE_CREATE) AS year, 
	MONTH(DATE_CREATE) AS month, 
	NOTIFY_MODULE AS module,
	COUNT(ID) as sum 
FROM b_im_message 
GROUP BY YEAR(DATE_CREATE), MONTH(DATE_CREATE), NOTIFY_MODULE;