CREATE FUNCTION fnc_fibonacci(pstop integer default 10) 
RETURNs TABLE (x1 BIGINT)
AS $$
	WITH RECURSIVE fib(x1, x2) as (
    	SELECT 0 AS x1, 1 as x2
      	
        UNION ALL
      
      	SELECT x2, x1 + x2
      	FROM fib
      	where pstop > x2
    )
	SELECT x1 FROM fib;
$$ LANGUAGE SQL;
