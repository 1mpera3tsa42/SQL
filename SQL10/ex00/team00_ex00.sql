-- СОЗДАНИЕ ТАБЛИЦЫ СО ЗНАЧЕНИЯМИ 
CREATE table Graph 
(
id bigint primary key,
point1 varchar not null,
point2 varchar not null,
cost integer not null
);

insert into Graph values (1, 'A', 'B', 10);
insert into Graph values (2, 'B', 'A', 10);

insert into Graph values (3, 'A', 'C', 15);
insert into Graph values (4, 'C', 'A', 15);

insert into Graph values (5, 'D', 'C', 30);
insert into Graph values (6, 'C', 'D', 30);

insert into Graph values (7, 'D', 'B', 25);
insert into Graph values (8, 'B', 'D', 25);
 
insert into Graph values (9, 'B', 'C', 35);
insert into Graph values (10, 'C', 'B', 35);

insert into Graph values (11, 'A', 'D', 20);
insert into Graph values (12, 'D', 'A', 20);

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
ORDER BY total_cost, tour;