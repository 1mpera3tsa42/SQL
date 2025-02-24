CREATE UNIQUE INDEX idx_person_discount_unique
ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYZE 
	SELECT person_id, pizzeria_id 
	FROM person_discounts
		WHERE person_id = 3 OR pizzeria_id = 2;