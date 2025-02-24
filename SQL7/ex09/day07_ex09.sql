SELECT address, ROUND(ROUND(MAX(age), 2) - (ROUND(MIN(age), 2)/ROUND(MAX(age), 2)), 2) AS formula,
ROUND(AVG(age), 2) AS average, 
CASE WHEN (MAX(age) - (MIN(age)/MAX(age))) > AVG(age) THEN true
ELSE false 
END AS comparison
FROM person 
GROUP BY address 
ORDER BY address;