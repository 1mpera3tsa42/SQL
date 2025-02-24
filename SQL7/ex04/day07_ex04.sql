SELECT p.name AS name, COUNT(visit_date) AS count_of_visits FROM person_visits
INNER JOIN person AS p ON p.id = person_visits.person_id
GROUP BY name
HAVING COUNT (visit_date) > 3;