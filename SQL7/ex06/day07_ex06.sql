SELECT pizzeria.name, COUNT (order_date) AS count_of_orders,
ROUND (AVG(price)) AS average_price, 
MAX (price) AS max_price, 
MIN (price) AS min_price
FROM person_order
INNER JOIN menu ON menu.id = menu_id
INNER JOIN pizzeria ON pizzeria.id = pizzeria_id
GROUP BY pizzeria.name 
ORDER BY pizzeria.name;