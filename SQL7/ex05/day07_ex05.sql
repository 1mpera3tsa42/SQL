SELECT DISTINCT(p.name) AS name 
FROM person  AS p
INNER JOIN person_order AS po ON p.id = person_id
ORDER BY p.name