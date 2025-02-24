-- Session #1
begin;
-- Session #2
begin;
-- Session #1
SELECT * FROM pizzeria where name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria where name = 'Pizza Hut';
-- Session #1
update pizzeria set rating = 5 where name= 'Pizza Hut';
commit;
-- Session #2
SELECT * FROM pizzeria where name = 'Pizza Hut';