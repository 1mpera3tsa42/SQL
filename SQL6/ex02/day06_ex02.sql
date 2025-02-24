SELECT p.name AS name,
	m.pizza_name AS pizza_name,
	m.price AS price,
	ROUND(m.price - (m.price * discount / 100)) AS discountn_price, pz.name AS pizzeria_name FROM person_discounts
	INNER JOIN person AS p ON p.id = person_id
	INNER JOIN pizzeria AS pz ON pz.id = pizzeria_id
	INNER JOIN menu AS m ON m.pizzeria_id = pz.id
	ORDER BY p.name, pizza_name