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
/*
TOTAL MESSAGE'S STATUS
*/
SELECT
	PARAM_NAME,
	COUNT(ID) as total
FROM
	b_im_message_param
GROUP BY PARAM_NAME 
/*
NEW USER REGISTRATION MONTHLY
*/
SELECT
	YEAR(DATE_REGISTER) AS year, 
	MONTH(DATE_REGISTER) AS month,
	COUNT(ID)
FROM
	b_user
GROUP BY YEAR(DATE_REGISTER), MONTH(DATE_REGISTER)