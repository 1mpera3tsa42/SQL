SELECT pz.name AS pizzeria_name 
FROM person AS p
	INNER JOIN person_visits AS pv ON pv.person_id = p.id
	INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
		WHERE p.name = 'Andrey'
	AND pz.name NOT IN (
SELECT pz.name
FROM person AS p
	INNER JOIN person_order AS po ON po.person_id = p.id
	INNER JOIN menu AS m ON m.id = po.menu_id
	INNER JOIN pizzeria AS piz ON m.pizzeria_id = pz.id
		WHERE p.name = 'Andrey')
ORDER BY pizzeria_name