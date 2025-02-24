-- ЗАПРОС

WITH RECURSIVE rec AS (
 SELECT point1, 
    point2, 
    cost, 
    array[point1] AS mat, 
    0::numeric AS total, 
    false AS flag
 FROM Graph
 WHERE point1 = 'A'
 
       UNION
 
 SELECT nod.point1, 
   nod.point2, 
   nod.cost, 
   rec.mat || nod.point1,
   rec.total + rec.cost, 
   nod.point1 = ANY(rec.mat) AS flag
 FROM Graph AS nod 
      INNER JOIN 
 rec ON nod.point1 = rec.point2
   
 WHERE flag != true
),

result AS (
 SELECT 
  DISTINCT(mat) AS tour, 
  total AS total_cost
    FROM rec
    WHERE length(mat::varchar) = (SELECT COUNT(DISTINCT(point1)) FROM Graph) * 2 + 3
    AND mat[1] = mat[(SELECT COUNT(DISTINCT(point1)) FROM Graph) + 1]
)

SELECT total_cost, tour
FROM result
WHERE total_cost = (SELECT MIN(total_cost) FROM result) 
OR (total_cost = (SELECT MAX(total_cost) FROM result))
ORDER BY total_cost, tour;