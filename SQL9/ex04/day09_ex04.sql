CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
	ID BIGINT,
    name varchar,
	age INTEGER,
    gender VARCHAR,
    address VARCHAR
) AS $$
	SELECT * FROM person WHERE gender='female';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
	ID BIGINT,
    name varchar,
	age INTEGER,
    gender VARCHAR,
    address VARCHAR
) AS $$
	SELECT * FROM person WHERE gender='male';
$$ LANGUAGE SQL;
