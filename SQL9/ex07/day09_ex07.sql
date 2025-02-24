CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) 
RETURNS numeric 
AS $$
	SELECT min(elem) FROM unnest(arr) AS elem;
$$LANGUAGE SQL;
