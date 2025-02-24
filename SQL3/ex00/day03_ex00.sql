WITH 
	T AS (
	SELECT pv.pizzeria_id AS pizzeria_id, 
	pv.visit_date AS visit_date
FROM person_visits AS pv
		INNER JOIN person AS pr ON pr.id = pv.person_id
	WHERE pr.name = 'Kate'
		  )
	
SELECT m.pizza_name AS pizza_name,
	m.price AS price,
	pz.name AS name,
	T.visit_date
FROM menu AS m
	INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
	INNER JOIN T ON T.pizzeria_id = m.pizzeria_id
		WHERE m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, name