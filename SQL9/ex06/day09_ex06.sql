CREATE FUNCTION fnc_person_visits_and_eats_on_date (
    IN pperson varchar default 'Dmitriy',
    IN pprice numeric default 500,
    IN pdate date default '2022-01-08')
RETURNS TABLE (name varchar) 
AS $$
BEGIN
RETURN QUERY 
  SELECT DISTINCT(pizzeria.name)
  FROM person_visits
	JOIN person_order ON person_order.person_id = person_visits.person_id
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	JOIN menu on menu.id = person_order.menu_id AND menu.pizzeria_id = pizzeria.id
	JOIN person on person.id = person_order.person_id AND person.id = person_visits.person_id
  WHERE 
	person.name = pperson 
	AND menu.price < pprice
	AND person_visits.visit_date = pdate;	
END;
$$LANGUAGE plpgsql;

