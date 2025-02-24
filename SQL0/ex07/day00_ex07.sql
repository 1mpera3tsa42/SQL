SELECT id, name,
	CASE
		WHEN age BETWEEN 10 and 20 THEN 'internal #1'
		WHEN age BETWEEN 21 and 23 THEN 'internal #2'
		ELSE 'internal #3'
	END AS internal_info
  FROM person 
ORDER BY internal_info