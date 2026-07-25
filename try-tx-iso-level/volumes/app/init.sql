DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE doctors (id serial, name text, on_call boolean not null);

INSERT INTO doctors (id, name, on_call) VALUES
 (1, 'Alice', true),
 (2, 'Bob', true);

CREATE OR REPLACE FUNCTION check_min_on_call_doctors()
RETURNS TRIGGER AS $$
DECLARE
    on_call_count INT;
BEGIN
    -- 現在の当直医の人数をカウント
    SELECT COUNT(*) INTO on_call_count FROM doctors WHERE on_call = true;

    -- 1人未満になる場合は変更を拒否してエラーを投げる
    IF on_call_count < 1 THEN
        RAISE EXCEPTION 'ビジネスルール違反: 当直の医者は常に1人以上必要です。';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER ensure_min_on_call
AFTER UPDATE OR DELETE ON doctors
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_min_on_call_doctors();
