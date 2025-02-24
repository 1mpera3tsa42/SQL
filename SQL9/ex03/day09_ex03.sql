CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS $fnc_trg_person_audit$
	BEGIN
    	IF (TG_OP = 'INSERT') THEN
        	INSERT INTO person_audit 
			SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*;
		ELSEIF (TG_OP = 'UPDATE') THEN
        	INSERT INTO person_audit 
			SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', NEW.*;
		ELSEIF (TG_OP = 'DELETE') THEN
        	INSERT INTO person_audit 
            SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*;
        END IF;
		RETURN NULL;
	END;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
