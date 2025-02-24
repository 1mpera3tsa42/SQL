SELECT (SELECT name FROM person AS p WHERE po.person_id = p.id) AS NAME
FROM person_order AS po
WHERE order_date = '2022-01-07'
AND (menu_id = 13 OR menu_id = 14 OR menu_id = 18);
