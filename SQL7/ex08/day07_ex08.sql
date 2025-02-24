SELECT address, pizzeria.name, 
COUNT (order_date) AS count_of_orders
FROM person_order
INNER JOIN person ON person.id = person_id 
INNER JOIN menu ON menu.id = menu_id 
INNER JOIN pizzeria ON pizzeria.id = pizzeria_id
GROUP BY address, pizzeria.name
ORDER BY address, pizzeria.name;