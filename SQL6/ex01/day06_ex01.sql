INSERT INTO person_discounts(
	SELECT row_number() over() AS id,
	person_id, pizzeria_id, CASE 
    WHEN COUNT(*) = 1 THEN 10.5
    WHEN COUNT(*) = 2 THEN 22
    ELSE 30
    END AS discount  FROM menu
	JOIN person_order ON menu_id =menu.id
	GROUP BY person_id, pizzeria_id
ORDER BY person_id, pizzeria_id
);